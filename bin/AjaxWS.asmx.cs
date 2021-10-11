using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using CFM_Web.DB;
using CFM_Web.Utilities;
using MySql.Data.MySqlClient;
using FansBackend.Entities;
using System.IO;

namespace CFM_Web
{
    /// <summary>
    /// Gets the data of a particular fan to be displayed on the fan selection web page.
    /// </summary>
    [WebService(Namespace = "http://cornerstonesolutions.com.au/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
   
    public class AjaxWS : System.Web.Services.WebService
    {
        /// <summary>
        /// URL of the image that is displayed when the fan image cannot be found
        /// </summary>
        private string CONST_IMAGE_UNAVALIABLE = "images/FanImageUnavailable.jpg";

        /// <summary>
        /// Gets other data about the selected fan.
        /// Called by fanSelection.js:updateFanCurve()
        /// </summary>
        /// <param name="fanDataID">Selected Fan Data ID</param>
        /// <returns></returns>
        // [WebMethod]
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public fanData GetFanData(int fanDataID, int projectfanid, int motorid, double weight, 
            double airflow, double addairflow, double staticPressure, double pwr,
            int divPerfWidth, int divPerfHeight, int divPowerWidth, int divPowerHeight, string fandims)
        {
            FanDataForPDF pdfData = new FanDataForPDF();
            DataPoint cowlpoint = new DataPoint();

            if (projectfanid > 0)
            {
                if (checkauth(projectfanid) == false)
                {
                    fanData f = new fanData();

                    f.performanceCurve = "Not authorised to access that fan information.";

                    f.powerCurve = "";
                    f.imageLocation = "";
                    f.wireElement = "";
                    f.acousticTable = "";
                    f.nominalDataTable = "";
                    f.performanceDataTable = "";
                    f.powerDataTable = "";
                    f.fanName = "";
                    return f;
                }
            }
            string debugmsg = "<div style='display: none'>";
            try
            {
                bool isRoofCowl = false;

                // find fan and fandata by fandataid
                var fan = FansBackend.BusinessLogic.FanController.findFanWithAllDataByFanDataID(fanDataID);

                var fanData = fan.fanDataList.Find(fd => fd.fanDataID == fanDataID);
                fanData.fanObject = fan;

                double defaultmotorkW = 0;
                
                if (fan.rangeID == 32 || fan.rangeID == 33) 
                {
                    isRoofCowl = true;

                    double scc = FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(fanData.dataPointList[3]);

                    fanData.intercept = cowlpoint;
                    fanData.intercept.staticPressure = staticPressure;
                    fanData.intercept.airflow = Math.Sqrt(fanData.intercept.staticPressure / scc);
                }
                else // Skip motor calcs if a Roof Cowl
                {
                    // Get intercept so we can get consumed power at intercept.
                    // Start by seeing if there is an exact match in the fan curve datapoints.
                    // This should be in findIntercept(), but it isn't...
                    FansBackend.Entities.DataPoint dpIntercept = findExactIntercept(fanData.dataPointList, airflow);
                    if (dpIntercept == null)
                    {
                        dpIntercept =
                            FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));
                    }
                    double impellerConsPower = 0;
                    if (motorid > 0)
                    {

                        // Don't rely on the configured motor in fandata table - always find the appropriate motor
                        impellerConsPower = pwr; // getConsumedPowerAtAirflow(fanData.dataPointList, dpIntercept.airflow);

                        debugmsg += "impellerConsPower="+impellerConsPower + " fan.intercept.power from <2>:" + pwr + " calculated: " + dpIntercept.power + " fandataid:" + fanData.fanDataID.ToString() ;
                        foreach (var d in fanData.dataPointList)
                        {
                            debugmsg += " [" + d.airflow.ToString() + "," + d.power.ToString() + "] ";
                        }

                        // Find the smallest sufficient motor with the required number of poles, and motortype the same as given motorid

                        List<MotorData> motors1 = DB.MotorDBController.FindSmallestSufficientMotors(impellerConsPower, Convert.ToInt32(fan.motorPole), 0, motorid);

                        debugmsg += " motorid: " + motorid.ToString() + " addairflow:" + addairflow.ToString();
                        debugmsg += " Intercept AF: " + dpIntercept.airflow.ToString();
                        debugmsg += " impellerConsPower: " + impellerConsPower.ToString() ;

                        // In case the new motor is different, copy its data into the fan object
                        // fan.motorDataObject = motors[0];
                        motorid = motors1[0].MotorDataId;
                        fanData.motorID = motors1[0].MotorDataId;
                        fanData.motorAmps = motors1[0].FullLoadAmps;
                        fanData.motorkW = motors1[0].Kw;
                        debugmsg += " new motorid: " + motors1[0].MotorDataId.ToString() ;

                    }

                    defaultmotorkW = fanData.motorkW;
                    if (motorid != -1)
                    {
                        debugmsg += " set fanData.motorid: " + motorid.ToString();
                        fanData.motorID = motorid;
                    }

                    // Weight is also calculated, so override the default.
                    fanData.mass = weight;

                    // If we have selected from "Other fans in this family do requested duty," motorid might have been upgraded to more powerful.
                    if (addairflow > 0 && motorid != -1)
                    {
                        debugmsg += " Adjust motors ";
                        // Adjust motors
                        double PowerIncreaseFactor = Math.Pow(1.0 + addairflow / 100.0, 3.0);

                        // Retrieve the default motor info into fan.motorDataObject, for later comparison
                        fanData.motorDataObject = FansBackend.BusinessLogic.MotorDataController.find(fanData.motorID);

                        // Find new power required as intercept power * increase
                        double newImpellerMotorConsPower = impellerConsPower * PowerIncreaseFactor;

                        // This should always be false, because we are passed calculated motorid
                        if (fanData.motorkW < newImpellerMotorConsPower)
                        {
                            // Find the smallest sufficient motor with the same number of poles as the standard one.
                            List<MotorData> motors = DB.MotorDBController.FindSmallestSufficientMotors(
                                newImpellerMotorConsPower, Convert.ToInt32(fanData.motorDataObject.pole), 0, motorid);

                            // If the new motor is different, copy its data into the fan object
                            if (motors[0].Kw != fanData.motorkW)
                            {
                                // fan.motorDataObject = motors[0];
                                fanData.motorID = motors[0].MotorDataId;
                                fanData.motorAmps = motors[0].FullLoadAmps;
                                fanData.motorkW = motors[0].Kw;
                                debugmsg += " set fanData.motorid: " + motors[0].MotorDataId.ToString();
                            }

                        }

                    }

                    fanData.motorDataObject = FansBackend.DB.motorDataDBController.find(fanData.motorID);
                    fanData.fanObject = fan;
                }

                debugmsg += "</div>";

                // If there is no required af or sp, because search by model number, 
                // get an airflow/sp pair from datapoint table so that the output looks
                // realistic/sensible.
                if (double.IsNaN(airflow) && double.IsNaN(staticPressure))
                {
                    // get airflow and st pressure from datapoint table by using JOIN
                    using (var connection = DBController.CreateOpenConnection())
                    {
                        string query = "SELECT fan.fanID,partNumber,airflow,staticPressure " +
                            "FROM fan JOIN fandata ON fan.fanID=fandata.fanID " +
                            "JOIN datapoint ON fandata.fandataID=datapoint.fandataID  WHERE fan.fanID=@fanID;";
                        MySqlCommand cmd = new MySqlCommand(query, connection);

                        cmd.Parameters.AddWithValue("@fanID", fan.fanID);

                        MySqlDataReader dataReader = cmd.ExecuteReader();
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                //dataReader.Read();
                                airflow = Convert.ToDouble(dataReader["airflow"]);
                                staticPressure = Convert.ToDouble(dataReader["staticPressure"]);

                                if (airflow != 0 && staticPressure != 0)
                                {
                                    break;
                                }
                            }
                        }
                    }
                }

                // Fetch fan Reference parameters from database by project fan id
                // So that data can be added to HTML table in buildPerformanceDataTable()
                FanReference fr = new FanReference();

                if (projectfanid > 0)
                {
                    fr = ProjectDBController.GetFanReference(projectfanid);
                }
                else
                {
                    //throw new System.ArgumentException("Showing details for fans outside of projects is not supported");
                    fr.ProjectFanId = 0;
                    fr.ProjectId = 0;
                    fr.FanDataId = 0;
                    fr.FanReferenceCode = "";
                    fr.Position = 0;
                    fr.PartNumber = "";
                    fr.Qty = 0;
                    fr.PriceType = "";
                    fr.PriceValue = 0;
                    fr.AirFlow = (int)airflow;
                    fr.StaticPressure = (int)staticPressure;
                    fr.ActualAF = 0;
                    fr.ActualSP = 0;
                    fr.ActualTP = 0;
                    fr.ActualOV = 0;
                    fr.Angle = "";
                    fr.Speed = "";
                    fr.Phase = "";
                    fr.Poles = "";
                    fr.FanType = "";
                    fr.BladeMaterial = "";
                    fr.MotorType = "";
                    fr.Diameter = "";
                    fr.SoundPressure = "";
                    fr.Ancillaries = "";
                    fr.MotorUpgrade = 0;
                }


                Tuple<double, double> max = GetDataMax(fanData.dataPointList);
                fanData selectedFanData = new fanData();
                //selectedFanData.performanceCurve = FansBackend.Utilities.GraphBuilder.CreatePerformanceSVG(fan, fanDataID, airflow, staticPressure, divPerfWidth, divPerfHeight, true, max.Item1, max.Item2);
                
                // Get HTML for performance curve
                selectedFanData.performanceCurve = debugmsg + GraphBuilder.CreatePerformanceSVG(fan, fanDataID, airflow, staticPressure, divPerfWidth, divPerfHeight, true, max.Item1, max.Item2);

                // Get HTML for power curve for motor
                if (isRoofCowl) // Skip the power curve if a Roof Cowl
                {
                    selectedFanData.powerCurve = "";
                }
                else
                {
                    // Power curve is no longer used in Div 3 on screen, but it is used in GET FAN PDF.
                    // The original value of divPowerWidth,divPowerHeight was 70%,500px which was about 850px,500px
                    // selectedFanData.powerCurve = FansBackend.Utilities.GraphBuilder.CreatePowerCurveSVG(
                    //              fan, fanDataID, airflow, staticPressure, divPowerWidth, divPowerHeight, max.Item1, 0);
                    //
                    // The curve is calculated here in case the PDF is generated.
                    selectedFanData.powerCurve = FansBackend.Utilities.GraphBuilder.CreatePowerCurveSVG(
                                    fan, fanDataID, airflow, staticPressure, 850, 500, max.Item1, 0);
                }

                if (System.IO.File.Exists(AppDomain.CurrentDomain.BaseDirectory.ToString() + "images/" + fan.fanImage))
                {
                    selectedFanData.imageLocation = "images/" + fan.fanImage;
                }
                else
                {
                    selectedFanData.imageLocation = CONST_IMAGE_UNAVALIABLE;
                }
                pdfData.FanImage = selectedFanData.imageLocation;

                selectedFanData.wireElement = getWireFrameDiagram(fanData);

                if (!isRoofCowl)
                {
                    fanData.intercept = new DataPoint();

                    // Set airflow and staticpressure at intercept - actual not requested.
                    fanData.intercept.airflow = fr.ActualAF; // airflow;
                    fanData.intercept.staticPressure = fr.ActualSP; // staticPressure;
                    fanData.intercept.power = pwr;
                    pdfData.FanDataSpeed = Convert.ToString(fanData.RPM);
                }
                else
                {
                    pdfData.FanDataSpeed = "";
                }

                string nccCompliance = FanSelection.getNCCstatus(fanData, 0);
                pdfData.ncc2019 = nccCompliance;

                // Build the HTML tables to the left of and below the graph for web page
                selectedFanData.fanName              = fan.partNumber;
                selectedFanData.nominalDataTable = ""; // buildNominalDataTable(fanData, fr, nccCompliance);                
                selectedFanData.performanceDataTable = buildPerformanceDataTable(fanData, airflow, addairflow, staticPressure, fr, defaultmotorkW, weight, nccCompliance);

                Tuple<string,string,string,string,string>  powerData = buildPowerDataTable(fanData, airflow, staticPressure, pwr);
                selectedFanData.powerDataTable       = powerData.Item1;
                pdfData.ElectricalSupply             = powerData.Item2;
                pdfData.MotorPower                   = powerData.Item3;
                pdfData.CurrentFLC                   = powerData.Item4;
                pdfData.MotorFrame                   = powerData.Item5;

                selectedFanData.acousticTable        = buildAcousticTable(fanData);

                string dimsStem = getDimsStem(fanData, fandims); // Choose passed dims file, or default if empty.
                selectedFanData.dimsFile             = getDimsElement(dimsStem);
                selectedFanData.revitElement         = getRevitElement(dimsStem);
                selectedFanData.acadElement          = getAcadElement(dimsStem);
                
                //FanSelection.PartNumber = fan.partNumber;
                //FanSelection.FanDataID = fanData.fanDataID;
                HttpContext.Current.Session["PartNumber"] = fan.partNumber;
                HttpContext.Current.Session["FanDataID"] = fanData.fanDataID;


                // Set fan data for PDF generate process
                pdfData.FanCode = fan.partNumber;
                pdfData.Volume = Convert.ToString(airflow);
                pdfData.StaticPressure = Convert.ToString(staticPressure);

                if (fanData.fanObject != null && fanData.fanObject.rangeObject != null && fanData.fanObject.rangeObject.installationTypeObject != null)
                {
                    pdfData.InstallationCategory = fanData.fanObject.rangeObject.installationTypeObject.description;
                }

                pdfData.Temperature = String.Empty;
                pdfData.Altitude = String.Empty;

                pdfData.FanDataType = String.Empty;
                pdfData.FanDataDiameter = Convert.ToString(fan.diameter);
                pdfData.FanDataMass = Convert.ToString(fanData.mass);

                // Copy graphs to PDF object 
                pdfData.PerformanceCurveSVG = selectedFanData.performanceCurve;
                pdfData.PowerCurveSVG = selectedFanData.powerCurve;

                pdfData.MotorType = fr.MotorType; // check this out later - from FanReference

                // If motor has been upgraded
                // The motor might have been upgraded, so don't rely on fandata.motor*
                // and fanData.motorDataObject does not have full load current
                /*if (motorid != -1)
                {
                    MotorData motor = new MotorData();
                    motor = DB.MotorDBController.FindMotorById(motorid);
                    pdfData.MotorPower = Convert.ToString(motor.Kw);
                    pdfData.CurrentFLC = Convert.ToString(motor.FullLoadAmps);
                    pdfData.MotorFrame = motor.Frame;
                }
                else
                {
                    pdfData.MotorPower = Convert.ToString(fanData.motorkW);
                    pdfData.CurrentFLC = Convert.ToString(fanData.motorAmps);
                }
                */
                pdfData.MotorSpeed = Convert.ToString(fanData.RPM);

                pdfData.Hz63 = Convert.ToString(fanData.hz63);
                pdfData.Hz125 = Convert.ToString(fanData.hz125);
                pdfData.Hz250 = Convert.ToString(fanData.hz250);
                pdfData.Hz500 = Convert.ToString(fanData.hz500);
                pdfData.Hz1K = Convert.ToString(fanData.hz1k);
                pdfData.Hz2K = Convert.ToString(fanData.hz2k);
                pdfData.Hz4K = Convert.ToString(fanData.hz4k);
                pdfData.Hz8K = Convert.ToString(fanData.hz8k);
                pdfData.dBW = Convert.ToString(fanData.totalLwAtotal);
                pdfData.dBA3m = Convert.ToString(fanData.SPL3m);
                pdfData.dimsfile = dimsStem;  // name of dimensions file without PDF/PNG extension
                pdfData.wiring = fanData.wiring;

                var json = new JavaScriptSerializer().Serialize(pdfData);
                Session["pdfdata"] = json;
                // return the HTML snippets to the calling javascript
                return selectedFanData;
            }
            catch (Exception e)
            {
                fanData f = new fanData();

                f.performanceCurve = "An error occurred during page generation. The error was:<br />" + e.Message;
                f.powerCurve = "";
                f.imageLocation = "";
                f.wireElement = "";
                f.acousticTable = "";
                f.nominalDataTable = "";
                f.performanceDataTable = "";
                f.powerDataTable = "";
                f.fanName = "";
                return f;
            }


        }
            
            
            
        
        



        /// <summary>
        /// Gets the X and Y max of all the data points.
        /// </summary>
        /// <param name="dataPointList"></param>
        /// <returns>Item1 = MaxX, Item2 = MaxY</returns>
        public static Tuple<double, double> GetDataMax(List<FansBackend.Entities.DataPoint> dataPointList)
        {
            double maxX = 0;
            double maxY = 0;

            foreach (var dp in dataPointList)
            {
                maxX = dp.airflow > maxX ? dp.airflow : maxX;
                maxY = dp.power > maxY ? dp.power : maxY; 
                maxY = dp.staticPressure > maxY ? dp.staticPressure : maxY;
            }

            return new Tuple<double, double>(maxX, maxY);
        }

        /// <summary>
        /// Finds dimension diagram PNG file, or returns not_available.png, as HTML IMG SRC
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string getDimsStem(FansBackend.Entities.FanData fanData, string dims)
        {
            // If there is no generated motor+case name, try using the default.
            if (dims == "")
            {
                dims = fanData.dims;
            }
            return dims;
        }

        /// <summary>
        /// Finds dimension diagram PNG file, or returns not_available.png, as HTML IMG SRC
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string getDimsElement(string dims)
        {
            List<string> files = System.IO.Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + "Dims", dims + ".png").ToList();

            string Element = "<img id='img_dims' src='Dims/not_available.png' />";
            if (files.Count > 0)
            {
                string file = Path.GetFileName(files[0]);
                Element = "<img id='img_dims' src='Dims/" + file + "' />";
            }

            return Element;

        }
        /// <summary>
        /// Finds REVIT file, or returns greyed-out button, as HTML A or SPAN
        /// </summary>
        /// <param name="fanData"></param>
        /// 
        /// <returns></returns>
        private string getRevitElement(string dims)
        {
            List<string> files = System.IO.Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + "Revit", dims + ".rvt").ToList();

            string Element = "<span class=greybutton >REVIT Unavailable</span>";
            if (files.Count > 0)
            {
                string file = Path.GetFileName(files[0]);
                Element = "<a class=bluebutton href='Revit/"+ file + "' >Download REVIT"; 
            }

            return Element;

        }

        /// <summary>
        /// Finds Autocad file, or returns greyed-out button, as HTML A or SPAN
        /// </summary>
        /// <param name="fanData"></param>
        /// 
        /// <returns></returns>
        private string getAcadElement(string dims)
        {
            List<string> files = System.IO.Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + "Acad", dims + ".dwg").ToList();

            string Element = "<span class=greybutton  >ACAD Unavailable</span>";
            if (files.Count > 0)
            {
                string file = Path.GetFileName(files[0]);
                Element = "<a class=bluebutton href='Acad/" + file + "' >Download ACAD";
            }

            return Element;

        }

        /// <summary>
        /// Finds what type of file the wire diagram is.  Returns an image if it is .png, .jpg or .gif.
        /// Returns a link if it is a PDF.
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string getWireFrameDiagram(FansBackend.Entities.FanData fanData)
        {
            List<string> files = System.IO.Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + "Wiring", fanData.wiring + ".*").ToList();

            string wireframe = files.Find(w => w.EndsWith(".png", StringComparison.CurrentCultureIgnoreCase) || w.EndsWith(".jpg", StringComparison.CurrentCultureIgnoreCase) || w.EndsWith(".gif", StringComparison.CurrentCultureIgnoreCase));
            string wireElement = "";

            if (wireframe == null)
            {
                wireframe = files.Find(w => w.EndsWith(".pdf", StringComparison.CurrentCultureIgnoreCase));
                if (wireframe != null)
                {
                    wireElement = string.Format("<a id='lnk_wiring' href='{0}'>Wiring diagram</a>", "Wiring/" + System.IO.Path.GetFileName(wireframe));
                }
            }
            else
            {
                wireElement = string.Format("<img id='img_wiring' src='{0}' />", "Wiring/" + System.IO.Path.GetFileName(wireframe));
            }
            return wireElement;

        }

        /// <summary>
        /// Builds a HTML table with the acoustic data in it.
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string buildAcousticTable(FansBackend.Entities.FanData fanData)
        {   
            System.Text.StringBuilder acousticTable = new System.Text.StringBuilder();
            acousticTable.AppendLine("<table id='acousticTable' class='dataTable' style='margin-top: 0'>");
            acousticTable.AppendFormat("<tr><th colspan='9' style='text-align: center' >Sound Power Level SWL (dBA)</th><th>Weighted</th><th>SPL@3m</th></tr>");
            acousticTable.AppendLine(
                "<tr><th style='text-align:left'>Spectrum (Hz)</th><th style='width:47px'>63</th><th style='width:47px'>125</th><th style='width:47px'>250</th>" +
                "<th style='width:47px'>500</th><th style='width:47px'>1k</th><th style='width:47px'>2k</th><th style='width:47px'>4k</th>" +
                "<th style='width:47px'>8k</th><th style='width:50px'>SWL (dBA)</th><th style='width:50px'>(dBA)</th></tr>");

            acousticTable.Append("<tr><th style='text-align:left'>Inlet (dBA)</th>");
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz63).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz125).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz250).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz500).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz1k).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz2k).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz4k).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.hz8k).ToString());
            acousticTable.AppendFormat("<td>{0}</td>", Math.Floor(fanData.totalLwAtotal).ToString());


            // 
            // acousticTable.AppendFormat("<td>{0}</td>", getSPL3m(fanData));
            acousticTable.AppendFormat("<td>{0}</td>", (fanData.totalLwAtotal-21).ToString());


            acousticTable.AppendLine("</tr>");
            acousticTable.AppendLine("</table>");
            return acousticTable.ToString();
        }

        /// <summary>
        /// Find the quiest row in datapoint list for SPL3m
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string getSPL3m(FansBackend.Entities.FanData fanData)
        {
            int noise = (int)fanData.SPL3m + 21; // Add 21dBA temporarily
            // get min of fandata.DatapointList.noise (which does not have 21 dBA subtracted)
            for (int i = 0; i < fanData.dataPointList.Count; i++)
            {
                if (fanData.dataPointList[i].noise < noise && fanData.dataPointList[i].noise > 0)
                {
                    noise = fanData.dataPointList[i].noise;
                }
            }
            noise = noise - 21;
            return noise.ToString();
        }
        /// <summary>
        /// Builds a HTML table with the nominal data in it.
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string buildNominalDataTable(FansBackend.Entities.FanData fanData, FanReference fr, string nccComp = "")
        {
            System.Text.StringBuilder nominalDataTable =  new System.Text.StringBuilder();

            string impellerType = "n/a";
            if(fanData.fanObject != null && fanData.fanObject.rangeObject != null && fanData.fanObject.rangeObject.impellerTypeObject != null)
            {
                impellerType = fanData.fanObject.rangeObject.impellerTypeObject.description;
            }

            string hubSize = "n/a";
            if (fanData.fanObject != null && fanData.fanObject.hubObject != null)
            {
                hubSize = fanData.fanObject.hubObject.diameter.ToString("0.00");
            }


            // If fan is fixed fan, use bm_description
            // If fan is multiwing fan, use blade_material
            string bladeMaterial = "n/a";

            if (fanData.fanObject != null ) {
                int mw = DB.FanDBController.IsMwFromRange(fanData.fanObject.rangeObject.rangeID);
                if (mw == 1)
                {
                    bladeMaterial = fr.BladeMaterial;
                }
                else
                {
                    if ( fanData.fanObject.bladeMaterialObject != null)
                    {
                        bladeMaterial = fanData.fanObject.bladeMaterialObject.description;
                    }
                }
            }
  

            nominalDataTable.AppendLine("<table id=\"nominalDataTable\" class=\"dataTable\">");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Catalogue Code:</th><td colspan=\"3\" >{0}</td></td>", fanData.fanObject.partNumber);
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Diameter (mm):</th><td>{0}</td><th>Pitch Angle</th><td>{1}</td>", fanData.fanObject.diameter, fanData.angle.Trim().Length > 0 ? fanData.angle : "&nbsp;");
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Impeller Type: </th><td>{0}</td><th>Blade Material</th><td>{1}</td>", impellerType, bladeMaterial);
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Speed: (rpm)</th><td>{0}</td><th>NCC 2019 Compliant</th><td ID=nccComp >{1}</td>", fanData.RPM, nccComp);

            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Fan Weight: (kg)</th><td>{0}</td><th></th><td></td>", fanData.mass);
            nominalDataTable.AppendLine("</tr>");

            nominalDataTable.AppendLine("</table>");
            return nominalDataTable.ToString();
        }

        

        /// <summary>
        /// Builds a HTML table with power data for a fanData object
        /// </summary>
        /// <param name="fanData"></param>
        /// <param name="airflow"></param>
        /// <param name="staticPressure"></param>
        /// <returns></returns>
        private Tuple<string,string,string,string,string> buildPowerDataTable(FansBackend.Entities.FanData fanData,  double airflow, double staticPressure, double pwr)
        {

            System.Text.StringBuilder powerDataTable = new System.Text.StringBuilder();

            string phaseString = "";
            string motorkw = "";
            string motorcurrent = "";
            string phaseString_pdf = "";
            string motorframe = "";

            if (fanData.fanObject.motorPhase == 1)
            {
                phaseString = "1ph/240V/50Hz";
                phaseString_pdf = "1/240/50";
            }
            else if (fanData.fanObject.motorPhase == 3)
            {
                phaseString = "3ph/415V/50Hz";
                phaseString_pdf = "3/415/50";
            }
            
            

            powerDataTable.AppendFormat("<tr><th colspan='2' >Motor Data</th></tr>").AppendLine();

            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Electrical Supply:", phaseString).AppendLine();

            if (fanData.motorDataObject != null)
            {
                double aompower = fanData.motorDataObject.kw * 1.1;
                double aomcurrent = fanData.motorDataObject.fullLoadAmps * 1.1;
                /*  if (fanData.motorDataObject.fullLoadAmps == 0)
                 {
                     aomcurrent = fanData.motorAmps * 1.1;
                 } */

                // powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motordataid:", fanData.motorDataObject.motorDataID).AppendLine();

                motorkw = fanData.motorDataObject.kw.ToString("0.00");
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1} kW</td></tr>", "Motor Power:", motorkw).AppendLine();
                


                // powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor AOM Power:", aompower.ToString("0.00kW")).AppendLine();
                // powerDataTable.AppendFormat("<tr><th>{0}</th><td ID='abspwr'>{1}</td></tr>", "Absorbed Power:", pwr.ToString("0.00kW")).AppendLine();


                if (fanData.motorDataObject.fullLoadAmps > 0)
                {
                    motorcurrent = fanData.motorDataObject.fullLoadAmps.ToString("0.0");        
                }
                else
                {
                    motorcurrent = "n/a";
                }
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1} Amps</td></tr>", "Motor FLC:", "n/a").AppendLine();

                motorframe = fanData.motorDataObject.frame;
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Type:", "STD").AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Frame:", motorframe).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Speed:", fanData.motorDataObject.pole.ToString("0") + " pole" ).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Efficiency:", fanData.motorDataObject.efficiency.ToString("0.0") + "%" ).AppendLine();
            }
            else
            {
                //powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Frame:", "").AppendLine();
                motorkw = fanData.motorkW.ToString("0.00");
                motorcurrent = fanData.motorAmps.ToString("0.0");

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1} kW</td></tr>", "Motor Power:", motorkw).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1} amps</td></tr>", "Motor FLC:", motorcurrent).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Speed:",  fanData.RPM.ToString("0 RPM")).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Efficiency:",  "n/a").AppendLine();

                powerDataTable.Insert(0, "<tr style='border: none;'><th colspan=3 style='border: none;'>&nbsp;</th></tr>"); // blank lines at start because there is no Motor Frame or Type
                powerDataTable.Insert(0, "<tr style='border: none;'><th colspan=3 style='border: none;'>&nbsp;</th></tr>");

            }
            // Start the table here, because we might have prepended some spacer rows.
            powerDataTable.Insert(0, "<table id='powerDataTable' class='dataTable' >");
            powerDataTable.AppendLine("</table>");

            return new Tuple<string, string, string, string,string>(powerDataTable.ToString(), phaseString_pdf, motorkw, motorcurrent,motorframe);
        }

        /// <summary>
        /// Builds a HTML table with performance data for a fanData object
        /// including required data from FanReference object
        /// </summary>
        /// <param name="fanData"></param>
        /// <param name="airflow"></param>
        /// <param name="staticPressure"></param>
        /// <returns></returns>
        private string buildPerformanceDataTable(FansBackend.Entities.FanData fanData, double airflow, double addairflow, double staticPressure, 
            FanReference fr, double defaultmotorkW, double weight, string nccCompliance)
        {
            double adf = 0;
            double scc = 0;
            double ads = 0;

            bool isRoofCowl = false;

            // Get intercept so we can get consumed power at intercept.
            // Start by seeing if there is an exact match in the fan curve datapoints.
            // This should be in findIntercept(), but it isn't...
            FansBackend.Entities.DataPoint dpIntercept = findExactIntercept(fanData.dataPointList, airflow);
            if (dpIntercept == null)
            {

                dpIntercept =
                FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));
            }
            System.Text.StringBuilder performanceDataTable = new System.Text.StringBuilder();

            performanceDataTable.AppendLine("<table id='performanceDataTable' class='dataTable' >");
            // Dynamic AF/SP table for blue dot
            // performanceDataTable.AppendLine("<tr class=bluedottext style='border-bottom: 1px solid black;border-left: 1px solid black; border-right: 1px solid black;border-top: 1px solid black;' >" +
            //    "<td  >Airflow (l/s) / Static Pressure (Pa) </td><td id=bluedotaf align=right><td id=bluedotsp align=right></td></tr>");

            performanceDataTable.AppendFormat("<td style='color:#bb0000; font-weight: bold;' colspan=3>{0}</td></tr>", fanData.fanObject.rangeObject.rangeDescription);

            // Spacer row
            performanceDataTable.AppendLine("<tr class=bluedottext style='background-color: white; border-color: white'>" +
                "<td colspan=3 style='background-color: white; border-color: white; padding-right: 0; background-color: white; " +
                "border-right-color:white; border-right-width: 1px; border-right-style: solid;'>&nbsp;</td></tr>");

            performanceDataTable.AppendLine("<style>th {text-align: left}</style>");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th style='width:45%; color:#007700'>" +  // fanData.fanObject.partNumber + 
                "</th><th style='width:27%;'>Required</th><th>Actual&nbsp;&nbsp;</th>");
            performanceDataTable.AppendLine("</tr>");

            

            // Suppress intercept values for roof cowls
            if (fanData.fanObject.rangeObject.rangeID == 32 || fanData.fanObject.rangeObject.rangeID == 33)
            {
                isRoofCowl = true;
                dpIntercept = null;
            }

            // Show Airflow and Static pressure reults in the table, for Standard duty
            /* if (addairflow > 0)
            {
                performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #0000cc'>Requested Duty</th></tr>");
            } */

            if (isRoofCowl)
            {
                performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                    fr.AirFlow.ToString("0"), fanData.intercept.airflow.ToString("0"));
                performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                    fr.StaticPressure.ToString("0"), fanData.intercept.staticPressure.ToString("0"));
            }
            else if (dpIntercept == null)
            {
                // there is no cross-over point in
                performanceDataTable.AppendFormat("<th>Airflow (l/s):</th><td>{0}</td><td id=ac_af style='align:right'>{1}</td></tr>",
                    fr.AirFlow.ToString(), "N/A");
                performanceDataTable.AppendFormat("<th>Static Pressure (Pa):</th><td id=ac_sp>{0}</td ><td style='align:right'>{1}</td></tr>",
                    fr.StaticPressure.ToString(), "N/A");
            }
            else
            {
                //cando_req = true;
                performanceDataTable.AppendFormat("<th>Airflow (l/s):</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                    fr.AirFlow.ToString("0"), dpIntercept.airflow.ToString("0"));
                performanceDataTable.AppendFormat("<th>Static Pressure (Pa):</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                    fr.StaticPressure.ToString("0"), dpIntercept.staticPressure.ToString("0"));
            }

            // Show Airflow and Static pressure reults in the table, for additional duty
            string workings = "";
            if (addairflow > 0.0)
            {
                // performanceDataTable.AppendFormat("<tr><th colspan=3 style='color: #0000cc'>Additional Duty <font colour=black>{0}%</font></th></tr>", addairflow);
                performanceDataTable.AppendFormat("<tr><th >Additional Airflow (%):</th><td>{0}</td><td>{1}</td></tr>", addairflow, addairflow);


                adf = airflow + airflow * addairflow / 100;
                scc = staticPressure / airflow / airflow;
                ads = adf * adf * scc;

                FansBackend.Entities.DataPoint d =
                    FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList,
                            FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(adf, ads));

                // redo motor upgrade calcs and show workings
                if (fanData.fanObject.rangeID != 32 && fanData.fanObject.rangeID != 33 && dpIntercept != null && dpIntercept.power != null)
                {

                    workings = "adf= " + adf.ToString() + " ads=" + ads.ToString() + "<br />";
                    workings += "default motor: " + defaultmotorkW.ToString() + "<br />";

                    double PeakPowerIncreaseFactor = Math.Pow(1.0 + addairflow / 100.0, 3.0);
                    double ImpellerMotorPeakPower = FanSelection.findImpellerMotorPeakPower(fanData.dataPointList);
                    double newImpellerMotorPeakPower = ImpellerMotorPeakPower * PeakPowerIncreaseFactor;

                    double newImpellerMotorConsPower = dpIntercept.power * PeakPowerIncreaseFactor;
                    double NewMotorRatedPower = newImpellerMotorConsPower / 1.1;

                    workings += "PeakPowerIncreaseFactor: " + PeakPowerIncreaseFactor.ToString() + "<br />\n";
                    workings += "ImpellerMotorPeakPower: " + ImpellerMotorPeakPower.ToString() + "<br />\n";
                    workings += "newImpellerMotorPeakPower: " + newImpellerMotorPeakPower.ToString() + "<br />\n";
                    workings += "newImpellerMotorConsPower: " + newImpellerMotorConsPower.ToString() + "<br />\n";
                    workings += "NewMotorRatedPower: " + NewMotorRatedPower.ToString() + "<br />\n";
                }

            }
            else
            {
                // add blank row if no additional airflow
                performanceDataTable.AppendLine("<tr><th colspan=3>&nbsp;</th></tr>");
            }

            performanceDataTable.AppendLine("<tr><th colspan=3>&nbsp;</th></tr>");

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Diameter (mm):", fr.Diameter, fanData.fanObject.diameter);

           
            if (fanData.motorDataObject == null)
            {
                performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Fan Speed (RPM):",
                    fr.Speed == "0" ? "-" : fr.Speed, 
                    fanData.RPM.ToString()
                    ).AppendLine();

            }
            else
            {
                performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Fan Speed (RPM):",
                    fr.Speed == "0" ? "-" : fr.Speed, fanData.RPM.ToString(),
                    fanData.motorDataObject.pole.ToString("0") + "pole"
                    ).AppendLine();
            }
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td id=ac_sound>{2}</td></tr>", "Sound Pressure. dBA@3m:", fr.SoundPressure, fanData.SPL3m.ToString()).AppendLine();
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td id=ac_power>{2}</td></tr>", "Absorbed Power (kW):", "", fanData.intercept.power.ToString()).AppendLine();
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td id=ac_angle>{2}</td></tr>", "Pitch (&deg;):", "", fanData.angle.ToString()).AppendLine();

            string weighttext = "n/a";
            if (weight > 0)  weighttext = weight.ToString();
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td id=ac_weight>{2}</td></tr>", "Weight (kg):", "", weighttext).AppendLine();


            string phaseString = "n/a";
            if (fanData.fanObject.motorPhase == 1)
            {
                phaseString = "1ph<br/>240V<br/>50Hz";
            } else if (fanData.fanObject.motorPhase == 3)
            {
                phaseString = "3ph<br/>415V<br/>50Hz";
            }

            /*
             * Electrical supply and motor power suppressed 8/7/2021
            string frphaseString = "";
            if (fr.Phase == "1")
            {
                frphaseString = "1ph<br/>240V<br/>50Hz";
            }
            else if (fr.Phase == "3")
            {
                frphaseString = "3ph<br/>415V<br/>50Hz";
            }
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Elec. Supply (ph/V/Hz):", frphaseString, phaseString).AppendLine();
             


            // Motor
            // performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Type:", fr.MotorType, "").AppendLine();

            // Is the motor an upgrade from default?


            // If we have been handed a motorid, check to see if it is an upgrade
            // if (defaultmotorkW != fanData.motorkW)
            if (fanData.motorDataObject != null)
            {
                if (defaultmotorkW != fanData.motorDataObject.kw)
                {
                    performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power (standard) (kW):", "", defaultmotorkW).AppendLine();
                    performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power (upgraded) (kW):", "", fanData.motorDataObject.kw).AppendLine();
                }
                else
                {
                    performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power (kW):", "", fanData.motorkW).AppendLine();
                }
            }
            else if (isRoofCowl)
            {
                performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power (kW):", "", "n/a").AppendLine();
            }
            {
                performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power (kW):", "", fanData.motorkW).AppendLine();
            }

            */
            // If fan is fixed fan, use bm_description
            // If fan is multiwing fan, use blade_material
            int mw = DB.FanDBController.IsMwFromRange(fanData.fanObject.rangeObject.rangeID);
            string bladeMaterial = "";
            if (isRoofCowl)
            {
                bladeMaterial = "n/a";
            }
            if (mw == 1)
            {
                bladeMaterial = fr.BladeMaterial;
            }
            else
            {
                if (fanData.fanObject != null && fanData.fanObject.bladeMaterialObject != null)
                {
                    bladeMaterial = fanData.fanObject.bladeMaterialObject.description;
                }
            }

            string frb = "";
            string b = "";
            if (fr.BladeMaterial == "Aluminium") frb = "Al."; else frb = fr.BladeMaterial;
            if (bladeMaterial == "Aluminium") b = "Al."; else b = bladeMaterial;

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Material", frb, b);
            // performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Pitch", "", fanData.angle);
            string yn = fr.Ancillaries;
            if ( yn == "Yup" ) { yn = "Yes"; }
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Ancillaries", yn, "");

            // Spacer row
            performanceDataTable.AppendLine("<tr class=bluedottext ><td colspan=3  >&nbsp;</td></tr>");
                
            performanceDataTable.AppendFormat("<th>NCC 2019 Compliant</th><td></td><td ID=nccComp >{0}</td>", nccCompliance);

            performanceDataTable.AppendLine("</table>");
            performanceDataTable.AppendLine("<style> tr.bluedottext td, tr.bluedottext th {color: #2222ee; font-weight: bold; border: none;}" +
                "th a {color: white; background-color: #004b9e; font-size: 10px;  padding: 1px 3px 1px 3px; border-radius: 5px; margin-bottom: 1px; text-decoration: none; } </style>");

            return performanceDataTable.ToString();
        }

 
        /// Check user auth to project_fan_id
        private bool checkauth(int project_fan_id)
        {
            string userid = Session["user_id"].ToString() ;
            if (String.IsNullOrEmpty(userid))
                return false;

            using (var connection = DBController.CreateOpenConnection())
            {
                string query = "SELECT count(*) as count  FROM (SELECT* FROM " +
                    "( SELECT user_id FROM project_fans  JOIN project_details ON project_details.project_id = project_fans.project_id " +
                    " JOIN user_account ON user_account.company_id = project_details.company_id where project_fan_id = "+project_fan_id.ToString()+
                    " and user_account.user_id = '"+userid+"' ) a " +
                    "UNION SELECT* FROM (SELECT user_id FROM user_account WHERE user_account.user_id = '" + userid + "' AND user_class < 3) b " +
                    ") c";

                MySqlCommand cmd = new MySqlCommand(query, connection);
                MySqlDataReader dataReader = cmd.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        if (dataReader["count"].ToString() == "0")
                        {
                            return false;
                        }

                    }
                }
            }
            return true;
        }

        /// <summary>
        /// See there is an (almost) exact match for airflow intercept on fan curve, and return it if so.
        /// </summary>
        /// <param name="dpl"></param>
        /// <param name="airflow"></param>
        /// <returns></returns>
        private FansBackend.Entities.DataPoint findExactIntercept(List<FansBackend.Entities.DataPoint> dpl, double airflow)
        {
            FansBackend.Entities.DataPoint nulldp = null;
            foreach (FansBackend.Entities.DataPoint p in dpl)
            {
                if (p.airflow >= airflow && p.airflow < airflow*1.005)
                {
                    return p;
                }
            }
            return nulldp;


        }

    }
}
