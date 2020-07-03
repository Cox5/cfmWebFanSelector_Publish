using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using CFM_Web.DB;
using CFM_Web.Utilities;
using MySql.Data.MySqlClient;

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
        /// </summary>
        /// <param name="fanDataID">Selected Fan Data ID</param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public fanData GetFanData(int fanDataID, int projectfanid, double airflow, double addairflow, double staticPressure, int divPerfWidth, int divPerfHeight, int divPowerWidth, int divPowerHeight)
        {

            // find fan and fandata by fandataid
            var fan = FansBackend.BusinessLogic.FanController.findFanWithAllDataByFanDataID(fanDataID);
            var fanData = fan.fanDataList.Find(fd => fd.fanDataID == fanDataID);

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
            FanReference fr = null;

            if (projectfanid > 0)
            {
                fr = ProjectDBController.GetFanReference(projectfanid);
            }
            // Fetch the fan family data, if there is any, to get info on motor
            // and related fans.
            // FanFamily ff = FanDBController.getFanFamilyByFanID(fan.fanID);

            // If we have additional airflow, scale up the static pressure.

            fanData = FansBackend.BusinessLogic.FanController.FillRestOfFanData(fanData, airflow, staticPressure);
          
            Tuple<double, double> max = GetDataMax(fanData.dataPointList);
            fanData selectedFanData = new fanData();
            selectedFanData.performanceCurve = FansBackend.Utilities.GraphBuilder.CreatePerformanceSVG(fan, fanDataID, airflow, staticPressure, divPerfWidth, divPerfHeight, true, max.Item1, max.Item2);
            selectedFanData.powerCurve = FansBackend.Utilities.GraphBuilder.CreatePowerCurveSVG(fan, fanDataID, airflow, staticPressure, divPowerWidth, divPowerHeight, max.Item1, 0);

            if(System.IO.File.Exists(AppDomain.CurrentDomain.BaseDirectory.ToString() + "images/" + fan.fanImage))
            {
                selectedFanData.imageLocation = "images/" + fan.fanImage;
            }else{
                selectedFanData.imageLocation = CONST_IMAGE_UNAVALIABLE;
            }
            pdfData.FanImage = selectedFanData.imageLocation;

            selectedFanData.wireElement = getWireFrameDiagram(fanData);
            selectedFanData.nominalDataTable = buildNominalDataTable(fanData);

            // Build the table to the left of the graph.
            selectedFanData.performanceDataTable = buildPerformanceDataTable(fanData, airflow, addairflow, staticPressure, fr);
            selectedFanData.fanName = fan.partNumber;
            selectedFanData.powerDataTable = buildPowerDataTable(fanData, airflow, staticPressure);
            selectedFanData.acousticTable = buildAcousticTable(fanData);

            FanSelection.PartNumber = fan.partNumber;
            FanSelection.FanDataID = fanData.fanDataID;

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

            pdfData.MotorType = "Standard"; // check this out later
            pdfData.MotorPower = Convert.ToString(fanData.motorkW);
            pdfData.CurrentFLC = Convert.ToString(fanData.motorAmps);
            if (fanData.motorDataObject != null)
            {
                pdfData.MotorFrame = fanData.motorDataObject.frame;
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
            acousticTable.AppendLine("<table id=\"acousticTable\" class=\"dataTable\">");
            acousticTable.AppendFormat("<tr><th colspan=\"11\" >Sound Data</th></tr>");
            acousticTable.AppendLine("<tr><th>Spectrum (Hz)</th><th style=\"width:50px\">63</th><th style=\"width:50px\">125</th><th style=\"width:50px\">250</th><th style=\"width:50px\">500</th><th style=\"width:50px\">1k</th><th style=\"width:50px\">2k</th><th style=\"width:50px\">4k</th><th style=\"width:50px\">8k</th><th style=\"width:50px\">Total</th><th style=\"width:50px\">SPL 3m</th></tr>");
            acousticTable.Append("<tr><th>Inlet (dB)</th>");
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz63.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz125.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz250.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz500.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz1k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz2k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz4k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.hz8k.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.totalLwAtotal.ToString());
            acousticTable.AppendFormat("<td>{0}</td>", fanData.SPL3m.ToString());
            acousticTable.AppendLine("</tr>");
            acousticTable.AppendLine("</table>");
            return acousticTable.ToString();
        }
        /// <summary>
        /// Builds a HTML table with the nominal data in it.
        /// </summary>
        /// <param name="fanData"></param>
        /// <returns></returns>
        private string buildNominalDataTable(FansBackend.Entities.FanData fanData)
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

            string bladeMaterial = "n/a";
            if (fanData.fanObject != null && fanData.fanObject.bladeMaterialObject != null)
            {
                bladeMaterial = fanData.fanObject.bladeMaterialObject.description;
            }

            nominalDataTable.AppendLine("<table id=\"nominalDataTable\" class=\"dataTable\">");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Catalogue Code:</th><td colspan=\"3\" >{0} {1}</td></td>", fanData.fanObject.partNumber, fanData.fanObject.rangeObject.rangeName);
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Diameter (mm):</th><td>{0}</td><th>Pitch Angle</th><td>{1}</td>", fanData.fanObject.diameter, fanData.angle.Trim().Length > 0 ? fanData.angle : "&nbsp;");
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Impeller Type: </th><td>{0}</td><th>Blade Material</th><td>{1}</td>", impellerType, bladeMaterial);
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Speed: (rpm)</th><td>{0}</td><th>BCA 2009 Compliant</th><td>{1}</td>", fanData.RPM, fanData.bca2009 ? "Yes": "No");
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.Append("<tr>");
            nominalDataTable.AppendFormat("<th>Fan Weight: (kg)</th><td>{0}</td><th>BCA 2010 Compliant</th><td>{1}</td>", fanData.mass, fanData.bca2010 ? "Yes" : "No");
            nominalDataTable.AppendLine("</tr>");
            nominalDataTable.AppendLine("</table>");
            return nominalDataTable.ToString();
        }

        /// <summary>
        /// NOT USED - Builds a HTML table with performance data for a fanData object
        /// </summary>
        /// <param name="fanData"></param>
        /// <param name="airflow"></param>
        /// <param name="staticPressure"></param>
        /// <returns></returns>
        private string buildPerformanceDataTable_Old(FansBackend.Entities.FanData fanData,  double airflow, double staticPressure)
        {
            FansBackend.Entities.DataPoint dpIntercept = FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));
            
            System.Text.StringBuilder performanceDataTable = new System.Text.StringBuilder();

            performanceDataTable.AppendLine("<table id=\"performanceDataTable\" class=\"dataTable\" xstyle=\"width:300px\">");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th colspan=\"2\" >Required Performance</th>");
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th>Air Flow: (L/s)</th><td>{0}</td>", airflow.ToString());
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td>", staticPressure.ToString());
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th>Installation Type: </th><td>{0}</td>", fanData.fanObject == null ? "" : fanData.fanObject.rangeObject == null ? "" : fanData.fanObject.rangeObject.installationTypeObject == null ? "" : fanData.fanObject.rangeObject.installationTypeObject.description);
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th>Air Density: (kg/m³)</th><td>{0}</td>", FansBackend.BusinessLogic.FanSelector.AIR_DENSITY.ToString("0.000"));
            performanceDataTable.AppendLine("</tr>");
            performanceDataTable.AppendLine("</table>");

            performanceDataTable.AppendLine("<table id=\"performanceDataTable\" class=\"dataTable\" style=\"width:300px\">");
            performanceDataTable.Append("<tr>");
            performanceDataTable.AppendFormat("<th colspan=\"2\" >Actual Performance</th>");
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            if (dpIntercept == null) performanceDataTable.AppendFormat("<th>Air Flow: (L/s)</th><td>{0}</td>", "N/A");
            else performanceDataTable.AppendFormat("<th>Air Flow: (L/s)</th><td>{0}</td>", dpIntercept.airflow.ToString("0.00"));
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            if (dpIntercept == null) performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td>", "N/A");
            else performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td>", dpIntercept.staticPressure.ToString("0.00"));
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            if (dpIntercept == null)
            {
                performanceDataTable.AppendFormat("<th>Total Pressure: (Pa)</th><td>{0}</td>", "N/A");
            } else
            {
                performanceDataTable.AppendFormat("<th>Total Pressure: (Pa)</th><td>{0}</td>", FansBackend.BusinessLogic.FanSelector.CalculateTotalPressure(dpIntercept.staticPressure, fanData.fanObject.fanSize / 1000.0, dpIntercept.airflow / 1000.0).ToString("0.00"));

            }
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.Append("<tr>");
            if (dpIntercept == null)
            {
                performanceDataTable.AppendFormat("<th>Outlet Velocity: (m/s)</th><td>{0}</td>", "N/A");
            }
            else
            {
                performanceDataTable.AppendFormat("<th>Outlet Velocity: (m/s)</th><td>{0}</td>", FansBackend.BusinessLogic.FanSelector.calculateOutletVelocity(fanData.fanObject.fanSize / 1000.0, dpIntercept.airflow / 1000.0).ToString("0.00"));

            }
            performanceDataTable.AppendLine("</tr>");

            performanceDataTable.AppendLine("</table>");
            return performanceDataTable.ToString();
        }

        /// <summary>
        /// Builds a HTML table with power data for a fanData object
        /// </summary>
        /// <param name="fanData"></param>
        /// <param name="airflow"></param>
        /// <param name="staticPressure"></param>
        /// <returns></returns>
        private string buildPowerDataTable(FansBackend.Entities.FanData fanData,  double airflow, double staticPressure)
        {
            FansBackend.Entities.DataPoint dpIntercept = FansBackend.BusinessLogic.FanSelector.findIntercept(fanData.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));
            
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

            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Type:", "normal").AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Electrical Supply:", phaseString).AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Frame:", fanData.motorDataObject != null ? fanData.motorDataObject.frame : "").AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Power:", fanData.motorDataObject != null ? fanData.motorDataObject.kw.ToString("0.00kW") : fanData.motorkW.ToString("0.00kW")).AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor FLC/Start:", fanData.motorDataObject != null && fanData.motorDataObject.fullLoadAmps > 0 ? fanData.motorDataObject.fullLoadAmps.ToString("0.0Amps") : fanData.motorAmps.ToString("0.0Amps")).AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Speed:", fanData.motorDataObject != null ? fanData.motorDataObject.pole.ToString("0") + "pole": fanData.RPM.ToString("0 RPM")).AppendLine();
            powerDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td></tr>", "Motor Efficiency:", fanData.motorDataObject != null ? fanData.motorDataObject.efficiency.ToString("0.0") + "%" : "").AppendLine();
       
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
        private string buildPerformanceDataTable(FansBackend.Entities.FanData fanData, double airflow, double addairflow, double staticPressure, FanReference fr)
        {
            double adf = 0;
            double scc = 0;
            double ads = 0;

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
            performanceDataTable.AppendFormat("<th style='width:45%; color:#007700'>" + fanData.fanObject.partNumber + "</th><th>Required</th><th>Actual</th>");
            performanceDataTable.AppendLine("</tr>");
            performanceDataTable.AppendFormat("<th>Fan type:</th><td style='word-wrap:break-word;white-space: normal'>{0}</td><td id=ac_af style='word-wrap:break-word'>{1}</td></tr>",
                    fr.FanType, "N/A");

            // Show Airflow and Static pressure reults in the table, for Standard duty
            if( addairflow > 0)
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
                performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                    fr.AirFlow.ToString("0"), dpIntercept.airflow.ToString("0"));
                performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                    fr.StaticPressure.ToString("0"), dpIntercept.staticPressure.ToString("0"));
            }

            // Show Airflow and Static pressure reults in the table, for additional duty
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
                        fr.AirFlow.ToString(), "N/A");
                    performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td id=ac_sp>{0}</td ><td style='align:right'>{1}</td></tr>",
                        fr.StaticPressure.ToString(), "N/A");
                }
                else
                {
                    performanceDataTable.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                        adf.ToString("0"), d.airflow.ToString("0"));
                    performanceDataTable.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                        ads.ToString("0"), d.staticPressure.ToString("0"));
                }
            }

            performanceDataTable.AppendLine("<tr><th colspan=3>&nbsp;</th></tr>");

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Diameter (mm):", fr.Diameter, fanData.fanObject.diameter);

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Fan Speed (rpm):", 
                 fr.Speed == "0" ? "-": fr.Speed, fanData.motorDataObject != null ? fanData.motorDataObject.RPM.ToString() : fanData.RPM.ToString()).AppendLine();
               // fr.Speed = "0" ? "-" : fr.Speed, fanData.motorDataObject != null ? fanData.motorDataObject.pole.ToString("0") + "pole" : fanData.RPM.ToString("0")).AppendLine();


            string frphaseString = "";
            if (fr.Phase == "1")
            {
                frphaseString = "1ph 240V 50Hz";
            }
            else if (fr.Phase == "3")
            {
                frphaseString = "3ph 415V 50Hz";
            }

            string phaseString = "";
            if (fanData.fanObject.motorPhase == 1)
            {
                phaseString = "1ph 240V 50Hz";
                pdfData.ElectricalSupply = phaseString;
            } else if (fanData.fanObject.motorPhase == 3)
            {
                phaseString = "3ph 415V 50Hz";
                pdfData.ElectricalSupply = phaseString;
            }


            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Power phase (ph):", frphaseString, phaseString).AppendLine();

            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Sound pr. dBA@3m:", fr.SoundPressure, fanData.SPL3m.ToString()).AppendLine();


            // Motor
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Type:", fr.MotorType, "").AppendLine();
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Motor Power:", "", fanData.motorkW).AppendLine();

            string bladeMaterial = "n/a";
            if (fanData.fanObject != null && fanData.fanObject.bladeMaterialObject != null)
            {
                bladeMaterial = fanData.fanObject.bladeMaterialObject.description;
            }
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Material", fr.BladeMaterial, bladeMaterial);
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Pitch", "", fanData.angle);
            performanceDataTable.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Ancillaries", fr.Ancillaries, "");

            // Spacer row
            performanceDataTable.AppendLine("<tr class=bluedottext style='background-color: #e3e3e3; border-color: #e3e3e3'>" +
                "<td colspan=3 style='background-color: #e3e3e3; border-color: #e3e3e3; padding-right: 0; background-color: #e3e3e3; " +
                "border-right-color:#e3e3e3; border-right-width: 1px; border-right-style: solid;'>&nbsp;</td></tr>");



            // Here is where we need info about fans in family
            bool noteprinted = false;
            List<FanFamily> members = null ;
            members = FanDBController.getFamilyMembers(fanData.fanID);
            StringBuilder otherfan = new StringBuilder();

            if (members.Count > 0)
            {
                int lastangle = Convert.ToInt32(fanData.angle);
                foreach (FanFamily member in members)
                {
                    if (member.FanID != fanData.fanID)
                    {
                        // find fan and fandata by fandataid
                        var fan2 = FansBackend.BusinessLogic.FanController.findFanWithAllDataByFanDataID(member.fandataID);
                        var fanData2 = fan2.fanDataList.Find(fd => fd.fanDataID == member.fandataID);

                        // We only want other fans with blade pitch lower than selected
                        // We only want the data from the smallest angle
                        
                        if (lastangle > Convert.ToInt32(fanData2.angle))
                        {
                            otherfan.Length = 0;

                            FansBackend.Entities.DataPoint dpIntercept2 = FansBackend.BusinessLogic.FanSelector.findIntercept(
                                fanData2.dataPointList, FansBackend.BusinessLogic.FanSelector.findSystemCurveCoEff(airflow, staticPressure));

                            if (Convert.ToInt32(dpIntercept2.airflow) > fr.AirFlow && Convert.ToInt32(dpIntercept2.staticPressure) > fr.StaticPressure)
                            {
                                if (!noteprinted)
                                {
                                    otherfan.AppendLine("<tr><th colspan=3>Other fans in this family can do requested duty</th></tr>");
                                    noteprinted = true;
                                }
                                otherfan.AppendLine("<tr><th colspan=2 style='color:#007700'>" + fan2.partNumber + "</th>" +
                                   "<th><a href='#' onClick='updateFanCurve(" + member.fandataID.ToString() + ");' > Show Info</A></th></tr>");

                                otherfan.AppendFormat("<th>Airflow: (l/s)</th><td>{0}</td><td ID=ac_af style='align:right' >{1}</td></tr>",
                                    fr.AirFlow.ToString("0"), dpIntercept2.airflow.ToString("0"));
                                otherfan.AppendFormat("<th>Static Pressure: (Pa)</th><td>{0}</td><td ID=ac_sp style='align:right' >{1}</td></tr>",
                                    fr.StaticPressure.ToString("0"), dpIntercept2.staticPressure.ToString("0"));
                                otherfan.AppendFormat("<tr><th>{0}</th><td>{1}</td><td>{2}</td></tr>", "Blade Pitch", "", fanData2.angle);

                                string motorkW = "";
                                if (fanData2.motorkW != fanData.motorkW)
                                {
                                    motorkW = "<td style='background-color:#ffcccc'>" + fanData2.motorkW.ToString()+"</td>";
                                }
                                else
                                {
                                    motorkW = "<td style='background-color:#ccffcc'>" + fanData2.motorkW.ToString() + "</td>";
                                }
                                otherfan.AppendFormat("<tr><th>{0}</th><td>{1}</td>{2}</tr>", "Motor Power:", "", motorkW);
                            }
                            lastangle = Convert.ToInt32(fanData2.angle);
                        }

                    }
                }
            }
            if (!noteprinted && members.Count > 0)
            {
                performanceDataTable.AppendLine("<tr><th colspan=3>No other fans in this family can do requested duty</th></tr>");
                noteprinted = true;
            }
            else
            {
                performanceDataTable.Append(otherfan);
            }


            performanceDataTable.AppendLine("</table>");
            performanceDataTable.AppendLine("<style> tr.bluedottext td {color: #2222ee; font-weight: bold; border: none;}</style>");
            return performanceDataTable.ToString();
        }


    }
}
