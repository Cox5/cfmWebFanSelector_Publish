<%@ Page Title="Fan Selection" Language="C#" AutoEventWireup="true" CodeBehind="FanSelection.aspx.cs" Inherits="CFM_Web.FanSelection" MasterPageFile="~/fanselectionNoStylesheet.Master" %>

<asp:Content ID="headerSection" ContentPlaceHolderID="head" runat="server">
    <%-- Local Style Sheets --%>
    <link href="Scripts/jquery-ui-1.12.1.smoothness/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/FanSelection.css" />

    <style>
        th {
            background-size: 1px;
        }

        #lit_message {
            color: red;
        }
        .ddlDia option { direction:rtl;}

    </style>

    <%-- Local Scripts --%>
    <script src="Scripts/jquery-1.8.2.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.smoothness/jquery-ui.js"></script>
    <script src="Scripts/jquery.tablesorter.min.js"></script>
    <script src="Scripts/jquery.tablesorter.widgets.min.js"></script>
    <script src="Scripts/fanSelection.js?v=20200119"></script>
    <script src="Scripts/fanTypeTree.js"></script>

    <asp:PlaceHolder ID="plcHeadingColor" runat="server" />

    <script>

        // puts POA values of "Price%" column on top
        $( document ).ready(function() {
            $("#fanTable").tablesorter({
                // initial sort of the 8th column
                sortList: [[8,0]],
                // sets the non-digit content to min, so it is placed on top when ordered asc 
                headers: { 8: { sorter: "digit", string: "min" }}

            });
        });

    </script>

   

</asp:Content>

<asp:Content ID="bodySection" ContentPlaceHolderID="body" runat="server">
    <div id="printDialog" title="Print dialog">
        <p>Please select which data sheets you would like to include in the printout.</p>

        <input type="checkbox" id="IncludeWire" name="IncludeDataSheet" value="Wire" />Include Wire Diagram<br />
        <input type="checkbox" id="IncludeDim" name="IncludeDataSheet" value="Dim" />Include Dimensional Diagram<br />

    </div>

    <div id="div_body">
        <div id="div_message">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <div id="div_left">
            <div id="div_topLeft" runat="server">
                <div class="sectionBorder">
                    <div id="div_select">
                        <div class="flfs-container">
                            <%= getFanLocation()  %>
                        </div>
                        <br />
                        <table id="selectTable" style="width: 100%;">
                           <tr>
                                <td colspan="2">Fan type
                                    <asp:Label ID="lblFanType" runat="server" />
                                </td>
                            </tr>
                                <td style="padding-right: 0">Fan Diameter (mm)</td>
                                <td style="padding-right: 20px; text-align: right">
                                    <asp:Label ID="lblDiameter" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblDiameterFrom" runat="server" Visible="true">From:</asp:Label>
                                    <asp:DropDownList ID="ddl_fanDiameterMin" runat="server" CssClass="ddlInput ddlDia">
                                    </asp:DropDownList><br />
                                    <asp:Label ID="lblDiameterTo" runat="server" Visible="true">To:</asp:Label>
                                    <asp:DropDownList ID="ddl_fanDiameterMax" runat="server" CssClass="ddlInput ddlDia">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                         <tr><td colspan="2">Current Selection</td>
                         </tr>
                         <tr><td colspan="2" align="right">
                        <select onchange="location = this.options[this.selectedIndex].value;" >
                            <%= getFanOptions()  %>
                        </select>
                                </td>
                                </tr>

                            <tr>
                                <td>Fan Model</td>
                                <td>
                                    <asp:TextBox ID="txt_modelName" runat="server" Width="90" CssClass="txtInput" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td >Airflow (l/s)</td>
                                <td><asp:TextBox ID="txt_airFlow" runat="server" Width="35" CssClass="txtInput" autocomplete="off" /></td>
                            </tr>
                            <tr>
                                <td >Additional Airflow (%)</td>
                                <td><asp:TextBox ID="txt_percentage" runat="server" Width="25" CssClass="txtInput" autocomplete="off" /></td>
                            </tr>
                            <tr>
                                <td>Static Pressure (Pa)</td>
                                <td>
                                    <asp:TextBox ID="txt_static" runat="server" Width="35" CssClass="txtInput" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td>Fan Speed (RPM)</td>
                                <td>
                                    <asp:DropDownList ID="ddl_fanSpeedMin" runat="server" CssClass="ddlInput">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblFanSpeedTo" runat="server" ></asp:Label>
                                    <asp:DropDownList ID="ddl_fanSpeedMax" runat="server" CssClass="ddlInput">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblFanSpeed" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Power Phase (ph)</td>
                                <td>
                                    <asp:DropDownList ID="ddl_motorPhase" runat="server" CssClass="ddlInput" Visible="false">
                                    </asp:DropDownList>
                                    <asp:Label id="lblPhase" Text="" runat="server" />

                                </td>
                            </tr>
                            <tr>
                                <td>Sound Pressure (dBA)</td>
                                <td>
                                    <asp:Label id="lblSoundPressure" Text="" runat="server" /><br />
                                </td>
                            </tr>                            
                            <%--  <tr>
                                <td>Max sound for search (dBA)</td>
                                <td>
                                     <asp:DropDownList ID="ddSound" runat="server" CssClass="ddlInput">
                                    </asp:DropDownList>
                                </td>
                              </tr>
                            --%>
                            <tr>
                                <td>Motor type</td>
                                <td>
                                    <asp:Label id="lblMotorType" Text="" runat="server" />

                                </td>
                            </tr>
                            <tr>
                                <td>Blade material</td>
                                <td>
                                    <asp:Label id="lblBladeMaterial" Text="" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Ancillaries</td>
                                <td>
                                    <asp:Label id="lblAncillaries" Text="" runat="server" />
                                </td>
                            </tr>
                            <%--<tr>
                <td colspan="2">
                  <asp:CheckBox ID="ckb_isBCAComplaint" Text=" Is BCA Complaint" runat="server" />
                </td>
              </tr>--%>
                            <tr>
                                <td colspan="2" style="padding-top: 10px; padding-bottom:0px"> Selection Envelope</td>
                            </tr>
                            <%-- <tr>
                                <td style="mpadding-bottom:0px">Below:
                                </td>
                                <td style="padding-bottom:0px">
                                    <asp:TextBox ID="txtLowerLimit" Width="40" Text="0" runat="server" />
                                    %
                                </td>
                            </tr> --%>
                            <tr>
                                <td style="padding-bottom:0px">Above: </td>
                                <td style="padding-bottom:0px">
                                    <asp:TextBox ID="txtUpperLimit" Width="40" Text="10" runat="server" autocomplete="off" />
                                    %
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Literal ID="lit_invalidAirflow" Visible="false" runat="server">Invalid Airflow</asp:Literal><br />
                                    <asp:Literal ID="lit_invalidStatic" Visible="false" runat="server">Invalid Static Pressure</asp:Literal><br />
                                    <asp:Literal ID="lit_invalidFanType" Visible="false" runat="server">No Fan Type Selected</asp:Literal>
                                    <asp:Literal ID="lit_message" runat="server" />
                                    <asp:Label ID="lblInfo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            
                        </table>
                        </div>
                    <script>
                        // Shows Searching box after Search button click
                        function showpleasewait() {
                            document.getElementById('pleasewait').style.visibility = 'visible';
                            document.getElementById('body_div_bottomLeft').style.backgroundColor = '#ffffff';
                            
                            document.getElementById('body_div_hideRight').style.visibility = 'hidden';
                            document.getElementById('body_div_hideBottomLeft').style.visibility = 'hidden';
                        }
                     </script>


<!--                    <div id="div_clearButton" style="bottom: 0px; position: absolute">
                        <asp:Button ID="btn_clear" Text="Clear" runat="server" OnClientClick="return false" class="fs-ctrl"/>
                        <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClientClick="return false" class="fs-ctrl" />
                        <asp:Label ID="lbl_versionNumber" Text="" runat="server" ForeColor="DarkGray" Style="bottom: 0px; position: absolute; right: 10px; left: auto; text-align: right" />
                    </div>
                    -->
                    <div id="div_ranges">
                        <table>
                            <tr>
                                <th style="vertical-align: top">Fan Type</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TreeView ID="tv_categories" runat="server" ShowCheckBoxes="All" ShowExpandCollapse="false"  />
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div id="div_selectButton">
                        <asp:Button ID="btn_editfan" Text="Edit this fan" OnClick="btn_Edit_Click" runat="server" />
                        <asp:Button ID="btn_select" Text="Search" OnClick="btn_select_Click" onClientClick="showpleasewait();" runat="server" />
                    </div>

                    <div class="div_heading">
                        <label class="lbl_number" style="left: 30px; width: 46px;">1</label>
                        <label class="lbl_text" style="left: 80px">Fan Specs</label>
                        <svg height="50px">
                            <use href="#triangle" />
                        </svg>
                    </div>
                </div>
            </div> <!-- end top left -->
        </div><!-- end  div_left -->
        <style>
.header-fixed {
    width: 100% 
}

.header-fixed > thead,
.header-fixed > tbody,
.header-fixed > thead > tr,
.header-fixed > tbody > tr,
.header-fixed > thead > tr > th,
.header-fixed > tbody > tr > td {
    display: block;
}

.header-fixed > tbody > tr:after,
.header-fixed > thead > tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
}

.header-fixed > tbody {
    overflow-y: auto;
    height: 100px;
    width: 100%;
}

.header-fixed > tbody > tr > td,
.header-fixed > thead > tr > th {
    float: left;
	width: 6%;
}
.header-fixed > thead > tr > th:hover {
    cursor: pointer;
}
        </style>
               <div id="div_bottomLeft" runat="server">
                <div id="div_hideBottomLeft" class="hideBeforeSelect" runat="server">
                    <div class="sectionBorder">
                        <div id="div_selectFan">
                            <div id="div_fanTable">
                                <style>th.noscroll { position: sticky; top: 0; background-color: #ffffff; }</style>
                                <table id="fanTable" class="header-fixed tablesorter-default">
                                    <thead>
                                        <tr style="font-size: 12px">
                                            <th style="width: 15%; text-align: left;">Product</th>
                                            <th style="width: 10%; text-align: left;">Type</th>
                                            <th style="width: 5%;">Diameter</th>
                                            <th  style="width: 5%;">dBA @ 3m</th>
                                            <th  style="width: 5%;">RPM</th>
                                            <th  style="width: 5%;">Volts</th>
                                            <th class="string-max " style="width: 5%;text-align: right;">Price %</th>
                                            <th  style="width: 5%;">MkW</th>
                                            <th  style="width: 5%;">W/(l/s)</th>
                                            <th  style="width: 5%;">AP kW</th>
                                            <th  style="width: 5%;">TEff %</th>
                                            <th  style="width: 5%;">Airflow</th>
                                            <th style="width: 5%;">Static Pr.</th>
                                            <!--<th style="width:5%">Motor Pole</th>-->
                                            <!--<th style="width:5%">Motor Phase</th>-->
                                            <!--<th style="width:5%">Angle</th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (var fanData in fanDataList)
                                            {  %>
                                        <tr data-fandataid="<%= fanData.fanDataID.ToString() %>"  data-motorid="<%= fanData.motorID %>"
                                            style="<%= getProdbgcolor(fanData.fanDataID.ToString()) %>" >
                                            <td title="<%=fanData.fanObject.partNumber  %>"
                                                 style="text-align: left;width: 15%; "> 
                                                 <%= truncateString(fanData.fanObject.partNumber, 12) %>
                                            </td> 
                                            <td title="<%=fanData.fanObject.rangeObject.rangeDescription  %>"
                                                 style="text-align: left;width: 10%; overflow: hidden"><%= truncateString(fanData.fanObject.rangeObject.rangeDescription, 15) %></td>
                                            <td style="width: 5%;text-align: center"><%= fanData.fanObject.diameter %></td>
                                            <td style="width: 5%;text-align: center;">&nbsp;<%= getNoise(fanData) %></td>
                                            <td style="width: 5%;text-align: center;">&nbsp;<%= fanData.RPM %></td>
                                            <td style="width: 5%;text-align: center;">&nbsp;<%= getVoltage(fanData.fanObject) %></td>
                                            <td style="width: 5%;text-align: right;"><%= CalculatePricePercentage(fanData) %></td>

                                            <td style="width: 5%;text-align: center;"><%= getMotorkWString(fanData) %></td>
                                            <td style="width: 5%;text-align: center;">&nbsp;<%= getStringFromDouble(getConsumedPowerOverAirflow(fanData), "0.00") %></td>
                                            <td style="width: 5%;text-align: center;">&nbsp;<%= getStringFromDouble(getConsumedPowerAtAirflow(fanData), "0.00") %></td>
                                            <td style="width: 5%;text-align: center;">&nbsp;<%= getEfficiency(fanData) %></td>
                                            <!--<td><%= fanData.fanObject.motorPole.ToString()  %></td> -->
                                            <!--<td><%= fanData.fanObject.motorPhase.ToString() %></td> -->
                                            <!--<td><%= fanData.angle.ToString() %></td> -->
                                            <td style='<%= fanData.intercept != null ? getAFbgcolor(fanData.intercept.airflow) : getAFbgcolor(0)%>'>
                                                <%= fanData.intercept != null ? Math.Floor(fanData.intercept.airflow).ToString() : "-" %>
                                            </td>
                                            <td style='<%= fanData.intercept != null ? getSPbgcolor(fanData.intercept.staticPressure) : getSPbgcolor(0)%>'>
                                                <%= fanData.intercept != null ? Math.Floor(fanData.intercept.staticPressure).ToString() : "-" %>
                                            </td>
                                            

                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="div_heading">
                            <label style="left: 30px; width: 46px">2</label>
                            <label style="left: 80px">Select Fan</label>
                            <svg style="height: 30px; overflow: visible">
                                <use href="#triangle" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div> <!-- end bottom left -->
        <div id="div_right">
           <div id="pleasewait" style="width: 100%; height: 100%; 
font-size: 20px; text-align:center; background-color: white; visibility: hidden"><img style="margin: auto auto" src="/Images/loading-ring2.gif" /></div>

            <div id="div_hideRight" class="hideBeforeSelect" runat="server">

                <div class="sectionBorder">
                    <div id="div_fanData" style="padding-top: 0px">
                        <div id="div_fanName">
                            <h3></h3>
                        </div>



                        <div id="div_schedule" style="display: none">
                            Location:<asp:TextBox ID="txt_location" runat="server" />
                            Designation:<asp:TextBox ID="txt_designation" runat="server" />
                            <asp:CheckBox Text="Alternative" ID="ckb_alternative" runat="server" />
                        </div>

                        <div id="div_performanceData" style="background-color: #E3E3E3; padding: 5px; min-width:1250px" comment="1250px causes overflow (horizontal scroll bar) on smaller screens, but stops the graph from wrapping downwards" >
                            Performance Data
                        <hr />
                            <div id="div_performanceDataTable" style="height: 480px; display: inline-block; padding-top: 0;"></div>
                            <div id="div_performanceCurve" style="float: right; height: 500px; margin-top: -30px; width: 70%; display: inline-block; vertical-align: top">
                                <asp:Literal ID="lit_performanceCurve" runat="server" />
                            </div>

                        </div>

                        <div id="div_nominalData" style="background-color: #E3E3E3; padding-left: 0px 20px 0px 20px ; margin-top: 0;">
                            Nominal Data
                        <hr />
                            <div id="div_fanImage" style="display: inline-block"></div>
                            <div id="div_nominalDataTable" style="display: inline-block; vertical-align: top; margin-left: 28px;"></div>
                        </div>

                        <div id="div_powerData" style="background-color: #E3E3E3; padding: 20px;">
                            Motor/Power Data
                        <hr />
                            
                            <div id="div_powerRight" style="display: inline-block; vertical-align: top; padding-top: 30px; width: 25%;">
                                <div id="div_powerDataTable" style="display: inline-block; vertical-align: top; min-width: 500px"></div>
                                <div id="div_wiring" style="padding-top: 20px;"></div>
                            </div>
                            <div id="div_powerCurve" style="height: 500px; width: 70%; display: inline-block; vertical-align: top; min-width: 500px">
                                <asp:Literal ID="lit_powerCurve" runat="server" />
                            </div>
                        </div>

                        <div id="div_acousticData" style="background-color: #E3E3E3; padding: 20px">
                            Acoustic/Noise Data
                        <hr />
                            <div id="div_acousticDataTable"></div>
                        </div>
                    </div>

                    <div class="div_heading">
                        <label style="left: 30px; width: 46px">3</label>
                        <label style="left: 80px">Fan Data: </label>
                        <label id="fanName" style="left: 160px"></label>
                        <svg height="50px">
                            <use href="#triangle" />
                        </svg>
                          <div id="div_buttons" style="position: absolute; top: -1px; left: 400px">
                            <asp:Button ID="btn_fanPDF" runat="server" Text="Get Fan PDF" OnClick="btn_getFanPdf_Click" Width="150px" class="button-main2 primary-btn"/>
                            <%--<asp:Button ID="btn_print" runat="server" Text="Print" OnClientClick="return false" OnClick="btn_print_Click" class="button-main primary-btn"/>--%>
                            <asp:Button ID="btn_addToSchedule" runat="server" Text="Add to Schedule" OnClick="btn_addToSchedule_Click" Width="150px"  class="button-main2 primary-btn"/>
                            <!-- <asp:Button ID="btn_Finished_Schedule" runat="server" Text="Finished" OnClick="btn_Finish_Click" Width="120px" class="button-main2 primary-btn" /> -->
                            <asp:Label ID="lblScheduleMsg" runat="server" ForeColor="Red"></asp:Label>

                            <asp:HiddenField ID="hiddenProjectID" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hiddenProjectFansID" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hidden_ac_af" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hidden_ac_sp" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hidden_ac_tp" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hidden_ac_ov" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hidden_next" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hidden_motorid" runat="server"></asp:HiddenField>
                             <asp:HiddenField ID="hidden_ac_sound" runat="server"></asp:HiddenField>

                          </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="div_perfCurve_width" runat="server" />
    <asp:HiddenField ID="div_perfCurve_height" runat="server" />
    <asp:HiddenField ID="div_powerCurve_width" runat="server" />
    <asp:HiddenField ID="div_powerCurve_height" runat="server" />
    <asp:HiddenField ID="selectedFanID" runat="server" />
    <asp:HiddenField ID="hf_printOptions" runat="server" />

    <svg>
        <defs>
            <polygon id="triangle" fill="#EE2F21" stroke-width="0" points="30,0 53,40 76,0" filter="url(#dropshadow)" />
            <filter id="dropshadow" height="130%">
                <feGaussianBlur in="SourceAlpha" stdDeviation="3" />
                <feOffset dx="2" dy="2" result="offsetblur" />
                <feMerge>
                    <feMergeNode />
                    <feMergeNode in="SourceGraphic" />
                </feMerge>
            </filter>
        </defs>
    </svg>


</asp:Content>
