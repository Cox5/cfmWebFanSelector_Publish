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

        public static FanDataForPDF pdfData = new FanDataForPDF();

        /// <summary>
        /// Gets other data about the selected fan.
        /// Called by fanSelection.js:updateFanCurve()
        /// </summary>
        /// <param name="fanDataID">Selected Fan Data ID</param>
        /// <returns></returns>
        // [WebMethod]
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public fanData GetFanData(int fanDataID, int projectfanid, int motorid, double airflow, double addairflow, double staticPressure, double pwr, 
            int divPerfWidth, int divPerfHeight, int divPowerWidth, int divPowerHeight)
        {
            try
            {
                // find fan and fandata by fandataid
                var fan = FansBackend.BusinessLogic.FanController.findFanWithAllDataByFanDataID(fanDataID);
                var fanData = fan.fanDataList.Find(fd => fd.fanDataID == fanDataID);

                double defaultmotorkW = fanData.motorkW;
                if (motorid != -1)
                {
                    fanData.motorID = motorid;
                }

                // If we have selected from "Other fans in this family do requested duty," motorid might have been upgraded to more powerful.
                if (addairflow > 0)
                {

                    // Adjust motors
                    double PeakPowerIncreaseFactor = Math.Pow(1.0 + addairflow / 100.0, 3.0);

                    // Retrieve the default motor info into fan.motorDataObject, for later comparison
                    fanData.motorDataObject = FansBackend.BusinessLogic.MotorDataController.find(fanData.motorID);

                    double ImpellerMotorPeakPower = FanSelection.findImpellerMotorPeakPower(fanData.dataPointList);
                    double newImpellerMotorConsPower = getConsumedPowerAtAirflow(fanData.dataPointList, airflow) * PeakPowerIncreaseFactor;
                    double NewMotorRatedPower = newImpellerMotorConsPower / 1.1;

                    // if DefaultMotorPower > NewMotorRatedPower then keep Default Motor
                    // if DefaultMotorPower < NewMotorRatedPower then find smallest motor from motor table which can do NewMotorRatedPower
                    if (fanData.motorkW < NewMotorRatedPower)
                    {
                        // Find the smallest sufficient motor with the same number of poles as the standard one.
                        List<MotorData> motors = DB.MotorDBController.FindSmallestSufficientMotors(NewMotorRatedPower, Convert.ToInt32(fanData.motorDataObject.pole));

                        // If the new motor is different, copy its data into the fan object
                        if (motors[0].Kw != fanData.motorkW)
                        {
                            // fan.motorDataObject = motors[0];
                            fanData.motorID = motors[0].MotorDataId;
                            fanData.motorAmps = motors[0].FullLoadAmps;
                            fanData.motorkW = motors[0].Kw;
                        }
                        else
                        {
                            // If the new motor is the same, scale power up by 10%
                            fanData.motorAmps = fanData.motorAmps * 1.1;
                            fanData.motorkW = fanData.motorkW * 1.1;
                        }
                    }

                }

                fanData.motorDataObject = FansBackend.DB.motorDataDBController.find(fanData.motorID);
                fanData.fanObject = fan;

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
                selectedFanData.performanceCurve = GraphBuilder.CreatePerformanceSVG(fan, fanDataID, airflow, staticPressure, divPerfWidth, divPerfHeight, true, max.Item1, max.Item2);

                if (fanData.fanObject.rangeID == 32 || fanData.fanObject.rangeID == 33) // Skip the power curve if a Roof Cowl
                {
                    selectedFanData.powerCurve = "";
                }
                else
                {
                    selectedFanData.powerCurve = FansBackend.Utilities.GraphBuilder.CreatePowerCurveSVG(
                        fan, fanDataID, airflow, staticPressure, divPowerWidth, divPowerHeight, max.Item1, 0);
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

                fanData.intercept = new DataPoint();

                fanData.intercept.airflow = airflow;
                fanData.intercept.staticPressure = staticPressure;
                fanData.intercept.power = pwr;
                
                string nccCompliance = FanSelection.getNCCstatus(fanData, 0);
                pdfData.ncc2019 = nccCompliance;

                selectedFanData.nominalDataTable = buildNominalDataTable(fanData, fr, nccCompliance);

                // Build the table to the left of the graph.
                selectedFanData.performanceDataTable = buildPerformanceDataTable(fanData, airflow, addairflow, staticPressure, fr, defaultmotorkW);
                selectedFanData.fanName = fan.partNumber;
                selectedFanData.powerDataTable = buildPowerDataTable(fanData, airflow, staticPressure, pwr);
                selectedFanData.acousticTable = buildAcousticTable(fanData);

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
                pdfData.FanDataSpeed = Convert.ToString(fanData.RPM);
                pdfData.FanDataMass = Convert.ToString(fanData.mass);

                pdfData.PerformanceCurveSVG = selectedFanData.performanceCurve;
                pdfData.PowerCurveSVG = selectedFanData.powerCurve;




                pdfData.MotorType = fr.MotorType; // check this out later - from FanReference

                // If motor has been upgraded
                // The motor might have been upgraded, so don't rely on fandata.motor*
                // and fanData.motorDataObject does not have full load current
                if (motorid != -1)
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
        /// Finds what type of file the wire diagram is.  Returns an images if it is .png, .jpg or .gif.
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
            acousticTable.AppendLine("<table id='acousticTable' class='dataTable'>");
            acousticTable.AppendFormat("<tr><th colspan='9' style='text-align: center' >Sound Power Level SWL (dBA)</th><th>Weighted</th><th>SPL@3m</th></tr>");
            acousticTable.AppendLine("<tr><th>Spectrum (Hz)</th><th style='width:50px'>63</th><th style='width:50px'>125</th><th style='width:50px'>250</th>" +
                "<th style='width:50px'>500</th><th style='width:50px'>1k</th><th style='width:50px'>2k</th><th style='width:50px'>4k</th>" +
                "<th style='width:50px'>8k</th><th style='width:50px'>SWL (dBA)</th><th style='width:50px'>(dBA)</th></tr>");

            acousticTable.Append("<tr><th>Inlet (dBA)</th>");
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz63.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz125.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz250.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz500.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz1k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz2k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz4k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz8k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.totalLwAtotal.ToString());


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
            int mw = DB.FanDBController.IsMwFromRange(fanData.fanObject.rangeObject.rangeID);
            string bladeMaterial = "n/a";
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
        private string buildPowerDataTable(FansBackend.Entities.FanData fanData,  double airflow, double staticPressure, double pwr)
        {
            // FansBackend.Entities.DataPoint dpIntercept = FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList, 
                                                            // FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));
            
            System.Text.StringBuilder powerDataTable = new System.Text.StringBuilder();

            string phaseString = "";
            if (fanData.fanObject.motorPhase == 1)
            {
                phaseString = "1ph 240V 50Hz";
                pdfData.ElectricalSupply = phaseString;
            }
            if (fanData.fanObject.motorPhase == 3)
            {
                phaseString = "3ph 415V 50Hz";
                pdfData.ElectricalSupply = phaseString;
            }
            
            powerDataTable.AppendLine("<table id=\"powerDataTable\" class=\"dataTable\" style=\"width:300px\">");

            powerDataTable.AppendFormat("<tr><th colspan=\"2\" >Motor Data (at STP)</th></tr>").AppendLine();

            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Type:", "STD").AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Electrical Supply:", phaseString).AppendLine();

            if (fanData.motorDataObject != null)
            {
                double aompower = fanData.motorDataObject.kw * 1.1;
                double aomcurrent = fanData.motorDataObject.fullLoadAmps * 1.1;
               /*  if (fanData.motorDataObject.fullLoadAmps == 0)
                {
                    aomcurrent = fanData.motorAmps * 1.1;
                } */

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Frame:", fanData.motorDataObject.frame).AppendLine();

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Power:", fanData.motorDataObject.kw.ToString("0.00 kW")).AppendLine();

                // powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor AOM Power:", aompower.ToString("0.00kW")).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td ID='abspwr'>{1}</td></tr>", "Absorbed Power:", pwr.ToString("0.00kW")).AppendLine();


                if (fanData.motorDataObject.fullLoadAmps > 0)
                {
                    powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor FLC:", fanData.motorDataObject.fullLoadAmps.ToString("0.0 Amps")).AppendLine();
                    powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor AOM FLC:", aomcurrent.ToString("0.0 Amps")).AppendLine();
                }
                else
                {
                    powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor FLC:", "n/a").AppendLine();
                    powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor AOM FLC:", "n/a").AppendLine();
                }

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Speed:", fanData.motorDataObject.pole.ToString("0") + " pole" ).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Efficiency:", fanData.motorDataObject.efficiency.ToString("0.0") + "%" ).AppendLine();
            }
            else
            {
                //powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Frame:", "").AppendLine();

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Power:", fanData.motorkW.ToString("0.00 kW")).AppendLine();

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor FLC/Start:", fanData.motorAmps.ToString("0.0 Amps")).AppendLine();

                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Speed:",  fanData.RPM.ToString("0 RPM")).AppendLine();
                powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Efficiency:",  "n/a").AppendLine();

            }
            powerDataTable.AppendLine("</table>");
            return powerDataTable.ToString();
        }

        /// <summary>
        /// Builds a HTML table with performance data for a fanData object
        /// including required data from FanReference object
        /// </summary>
        /// <param name="fanData"></param>
        /// <param name="airflow"></param>
        /// <param name="staticPressure"></param>
        /// <returns></returns>
        private string buildPerformanceDataTable(FansBackend.Entities.FanData fanData, double airflow, double addairflow, double staticPressure, FanReference fr, double defaultmotorkW)
        {
            double adf = 0;
            double scc = 0;
            double ads = 0;
            bool cando_add = false;
            bool cando_req = false;

            FansBackend.Entities.DataPoint dpIntercept =
                FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));

            System.Text.StringBuilder performanceDataTable = new System.Text.StringBuilder();

            performanceDataTable.AppendLine("<table id='performanceDataTable' class='dataTable' style='margin-top: 0px; width:320px; '>");
            // Dynamic AF/SP table for blue dot
            performanceDataTable.AppendLine("<tr class=bluedottext style='border-bottom: 1px solid black;border-left: 1px solid black; border-right: 1px solid black;border-top: 1px solid black;' >" +
                "<td>Airflow (l/s) / Static Pressure (Pa) </td><td id=bluedotaf align=right><td id=bluedotsp align=right></td></tr>");

            // Spacer row
            performanceDataTable.AppendLine("<tr class=bluedottext style='background-color: #e3e3e3; border-color: #e3e3e3'>" +
                "<td colspan=3 style='background-color: #e3e3e3; border-color: #e3e3e3; padding-right: 0; background-color: #e3e3e3; " +
                "border-right-color:#e3e3e3; border-right-width: 1px; border-right-style: solid;'>&nbsp;</td></tr>");

            performanceDataTable.AppendLine("<style>th {text-align: left}</style>");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th style='width:45%; color:#007700'>" + fanData.fanObject.partNumber + "</th><th style='width:27%;'>Required</th><th>Actual</th>");
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.AppendFormat("<td style='color:#007700' colspan=3>{0}</td></tr>", fanData.fanObject.rangeObject.rangeDescription );

            // Suppress intercept values for roof cowls
            if (fanData.fanObject.rangeObject.rangeID == 32 || fanData.fanObject.rangeObject.rangeID == 33)
            {
                dpIntercept = null;
            }

            // Show Airflow and Static pressure reults in the table, for Standard duty
                if (addairflow > 0)
            {
                performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #0000cc'>Requested Duty</th></tr>");
            }
            if (dpIntercept == null)
            {
                // there is no cross-over point in
                performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td id=ac_af style='align:right'>{1}</td></tr>",
                    fr.AirFlow.ToString(), "N/A");
                performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td id=ac_sp>{0}</td ><td style='align:right'>{1}</td></tr>",
                    fr.StaticPressure.ToString(), "N/A");
            }
            else
            {
                cando_req = true;
                performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                    fr.AirFlow.ToString("0"), dpIntercept.airflow.ToString("0"));
                performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                    fr.StaticPressure.ToString("0"), dpIntercept.staticPressure.ToString("0"));
            }

            // Show Airflow and Static pressure reults in the table, for additional duty
            string workings = "";
            if (addairflow > 0.0)
            {
                performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #0000cc'>Additional Duty</th></tr>");

                adf = airflow + airflow * addairflow / 100;
                scc = staticPressure / airflow / airflow;
                ads = adf * adf * scc;

                FansBackend.Entities.DataPoint d =
                    FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList,
                            FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(adf, ads));

                if (d == null)
                {
                    // there is no cross-over point in
                    performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td id=ac_af style='align:right'>{1}</td></tr>",
                        fr.AirFlow.ToString(), "n/a");
                    performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td id=ac_sp>{0}</td ><td style='align:right'>{1}</td></tr>",
                        fr.StaticPressure.ToString(), "n/a");
                }
                else
                {
                    if (adf <= d.airflow) { cando_add = true; }
                    performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                        adf.ToString("0"), adf.ToString("0"));
                    performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                        ads.ToString("0"), ads.ToString("0"));
                }

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


            string frphaseString = "";
            if (fr.Phase == "1")
            {
                frphaseString = "1ph<br/>240V<br/>50Hz";
            }
            else if (fr.Phase == "3")
            {
                frphaseString = "3ph<br/>415V<br/>50Hz";
            }

            string phaseString = "";
            if (fanData.fanObject.motorPhase == 1)
            {
                phaseString = "1ph<br/>240V<br/>50Hz";
                pdfData.ElectricalSupply = phaseString;
            } else if (fanData.fanObject.motorPhase == 3)
            {
                phaseString = "3ph<br/>415V<br/>50Hz";
                pdfData.ElectricalSupply = phaseString;
            }


            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Elec. Supply (ph/V/Hz):", frphaseString, phaseString).AppendLine();

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td id=ac_sound>{2}</td></tr>", "Sound Pressure. dBA@3m:", fr.SoundPressure, fanData.SPL3m.ToString()).AppendLine();


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
            else
            {
                performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power (kW):", "", fanData.motorkW).AppendLine();
            }


            // If fan is fixed fan, use bm_description
            // If fan is multiwing fan, use blade_material
            int mw = DB.FanDBController.IsMwFromRange(fanData.fanObject.rangeObject.rangeID);
            string bladeMaterial = "";
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

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Material", fr.BladeMaterial, bladeMaterial);
            // performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Pitch", "", fanData.angle);
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Ancillaries", fr.Ancillaries, "");

            // Spacer row
            performanceDataTable.AppendLine("<tr class=bluedottext style='background-color: #e3e3e3; border-color: #e3e3e3'>" +
                "<td colspan=3 style='background-color: #e3e3e3; border-color: #e3e3e3; padding-right: 0; background-color: #e3e3e3; " +
                "border-right-color:#e3e3e3; border-right-width: 1px; border-right-style: solid;'>&nbsp;</td></tr>");

            #region Unused - find  info about other fans in the fan family

            /*
                        // Here is where we need info about fans in family
                        List<FanFamily> members = null;
                        members = FanDBController.getFamilyMembers(fanData.fanID);
                        StringBuilder otherfan = new StringBuilder();
                        StringBuilder otherfan2 = new StringBuilder();
                        int smallest_reqduty = 999;
                        int smallest_addduty = 999;
                        if (members.Count > 0)
                        {
                            foreach (FanFamily member in members)
                            {
                                // Search the fan's family to find
                                // a. the lowest pitch which does requested duty
                                // b. the lowest pitch which does additional duty

                                // find fan and fandata by fandataid
                                var fan2 = FansBackend.BusinessLogic.FanController.findFanWithAllDataByFanDataID(member.fandataID);
                                var fanData2 = fan2.fanDataList.Find(fd => fd.fanDataID == member.fandataID);

                                // Find the smallest pitch which can do requested duty
                                if (Convert.ToInt32(fanData2.angle) < smallest_reqduty)
                                {
                                    FansBackend.Entities.DataPoint dpIntercept2 = FansBackend.BusinessLogic.FanSelector.findIntercept(
                                        fanData2.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));
                                    if (dpIntercept2 != null)
                                    {
                                        // If intercept airflow > requested airflow and intercept static pressure > requested static pressure.
                                        if (dpIntercept2.airflow >= fr.AirFlow && dpIntercept2.staticPressure >= fr.StaticPressure)
                                        {
                                            // This fan is good, so truncate the string with last fan's info.
                                            otherfan.Length = 0;

                                            otherfan.AppendLine("<tr><th colspan=2 >" +
                                                "<a href = '#' onClick = 'updateFanCurve(" +
                                                member.fandataID.ToString() + "," + fanData2.motorID + ");'>" + fan2.partNumber + "</a></th>" +
                                               "<th><a href = '#'  onClick ='updateFanCurve(" +
                                               member.fandataID.ToString() + "," + fanData.motorID + ");' > Show Info</a></th></tr>");

                                            otherfan.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                                                fr.AirFlow.ToString("0"), dpIntercept2.airflow.ToString("0"));
                                            otherfan.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                                                fr.StaticPressure.ToString("0"), dpIntercept2.staticPressure.ToString("0"));
                                            otherfan.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Pitch", "", fanData2.angle);

                                            // highlight if motor is different
                                            string motorkW = "";
                                            if (fanData2.motorkW != fanData.motorkW)
                                            {
                                                motorkW = "<td style='background-color:#ffcccc'>" + fanData2.motorkW.ToString() + "</td>";
                                            }
                                            else
                                            {
                                                motorkW = "<td style='background-color:#ccffcc'>" + fanData2.motorkW.ToString() + "</td>";
                                            }
                                            otherfan.AppendFormat("<tr><th>{0}</th><td>{1}</td>{2}</tr>", "Motor Power:", "", motorkW);

                                            // This is now the smallest angle which does the duty
                                            smallest_reqduty = Convert.ToInt32(fanData2.angle);
                                        }
                                    }
                                }

                                // Find the smallest pitch which can do additional duty

                                // if this member fan's angle is less than smallest_addduty found
                                // if (Convert.ToInt32(fanData2.angle) < smallest_addduty && addairflow > 0.0 &&
                                //    (cando_add && Convert.ToInt32(fanData2.angle) < Convert.ToInt32(fanData.angle) || !cando_add))
                                if (Convert.ToInt32(fanData2.angle) < smallest_addduty && addairflow > 0.0)
                                {
                                    FansBackend.Entities.DataPoint dpIntercept2 = FansBackend.BusinessLogic.FanSelector.findIntercept(fanData2.dataPointList, scc);

                                    // If intercept airflow > additional airflow and intercept static pressure > additional static pressure.
                                    if (dpIntercept2 != null)
                                    {
                                        if (dpIntercept2.airflow >= adf && dpIntercept2.staticPressure >= ads)
                                        {
                                            // This fan is good, so truncate the string with last fan's info.
                                            otherfan2.Length = 0;

                                            otherfan2.AppendLine("<tr><th colspan=2 >" +
                                                "<a href='#' onClick ='updateFanCurve(" +
                                                member.fandataID.ToString() + "," + fanData2.motorID + ");' >" + fan2.partNumber + "</a></th>" +
                                               "<th><a href = '#' onClick ='updateFanCurve(" +
                                               member.fandataID.ToString() + "," + fanData2.motorID + ");' >Show Info</a></th></tr>");

                                            otherfan2.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                                                adf.ToString("0"), dpIntercept2.airflow.ToString("0"));
                                            otherfan2.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                                                ads.ToString("0"), dpIntercept2.staticPressure.ToString("0"));
                                            otherfan2.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Pitch", "", fanData2.angle);

                                            string motorkW = "";
                                            if (fanData2.motorkW != fanData.motorkW)
                                            {
                                                motorkW = "<td style='background-color:#ffcccc'>" + fanData2.motorkW.ToString() + "</td>";
                                            }
                                            else
                                            {
                                                motorkW = "<td style='background-color:#ccffcc'>" + fanData2.motorkW.ToString() + "</td>";
                                            }
                                            otherfan2.AppendFormat("<tr><th>{0}</th><td>{1}</td>{2}</tr>", "Motor Power:", "", motorkW);
                                            // This is now the smallest angle which does the additional duty
                                            smallest_addduty = Convert.ToInt32(fanData2.angle);
                                        }
                                    }
                                }

                            }
                        }
                        if (otherfan.Length > 0)
                        {
                            performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #2222aa'>Lowest pitch fan in this family that can do requested duty</th></tr>");
                            performanceDataTable.Append(otherfan);
                        }
                        else if (members.Count > 0)
                        {
                            performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #2222aa'>No lower pitch fans in this family can do requested duty</th></tr>");
                        }
                        if (otherfan2.Length > 0)
                        {
                            performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #2222aa'>Lowest pitch fan in this family that can do additional duty</th></tr>");
                            performanceDataTable.Append(otherfan2);
                        }
                        else if (members.Count > 0 && addairflow > 0.0)
                        {
                            performanceDataTable.AppendLine("<tr><th colspan=3 style='color: #2222aa'>No lower pitch fans in this family can do additional duty</th></tr>");
                        }
                        */
            #endregion


            // performanceDataTable.AppendLine("<tr><td colspan=3>" + workings + "</td></tr>");


            performanceDataTable.AppendLine("</table>");
            performanceDataTable.AppendLine("<style> tr.bluedottext td {color: #2222ee; font-weight: bold; border: none;}" +
                "th a {color: white; background-color: #004b9e; font-size: 10px;  padding: 1px 3px 1px 3px; border-radius: 5px; margin-bottom: 1px; text-decoration: none; } </style>");



            return performanceDataTable.ToString();
        }

        /// <summary>
        /// Finds motor power at airflow intercept by linear interpolation
        /// </summary>
        /// <param name="fan"></param>
        /// <returns></returns>
         private double getConsumedPowerAtAirflow(List<FansBackend.Entities.DataPoint> dataPointList, double airflow)
         {
            double lastaf = Double.NaN;
            double lastpw = Double.NaN;
            double increase = Double.NaN;
            double power = Double.NaN;
            

            foreach (DataPoint dp in dataPointList)
            {
                if (dp.airflow > airflow)
                {
                    // interpolate
                    increase = (airflow - lastaf) / (dp.airflow - lastaf);
                    power = lastpw + increase * (dp.power - lastpw);
                    break;
                }
                else
                {
                    lastaf = dp.airflow;
                    lastpw = dp.power;
                }
            }
            return power;
        }


    }
}
