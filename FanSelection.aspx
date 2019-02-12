<%@ Page Title="Fan Selection" Language="C#" AutoEventWireup="true" CodeBehind="FanSelection.aspx.cs" Inherits="CFM_Web.FanSelection" MasterPageFile="~/fanselection.Master" %>

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
    </style>

    <%-- Local Scripts --%>
    <script src="Scripts/jquery-1.8.2.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.smoothness/jquery-ui.js"></script>
    <script src="Scripts/jquery.tablesorter.min.js"></script>
    <script src="Scripts/jquery.tablesorter.widgets.min.js"></script>
    <script src="Scripts/fanSelection.js"></script>
    <script src="Scripts/fanTypeTree.js"></script>

    <asp:PlaceHolder ID="plcHeadingColor" runat="server" />

    <script>
        $(document).ready(function () {
            var options = {
                widthFixed: true,
                showProcessing: true,
            };

            $("#fanTable").tablesorter(options);
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
        <div id="div_logo">
        </div>
        <div id="div_left">
            <div id="div_topLeft" runat="server">
                <div class="sectionBorder">
                    <div id="div_select">
                        <br />
                        <table id="selectTable" style="width: 100%;">
                            <tr>
                                <td>Fan Model Number</td>
                                <td>
                                    <asp:TextBox ID="txt_partno" runat="server" Width="90" CssClass="txtInput" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20px">Airflow</td>
                                <td>
                                    <asp:TextBox ID="txt_airFlow" runat="server" Width="35" CssClass="txtInput" />
                                    L/s
                  <asp:TextBox ID="txt_percentage" runat="server" Width="25" CssClass="txtInput" />
                                    %
                                </td>
                            </tr>
                            <tr>
                                <td>Static Pressure</td>
                                <td>
                                    <asp:TextBox ID="txt_static" runat="server" Width="35" CssClass="txtInput" />
                                    Pa
                                </td>
                            </tr>
                            <tr>
                                <td>Fan Speed</td>
                                <td>
                                    <asp:DropDownList ID="ddl_fanSpeedMin" runat="server" CssClass="ddlInput">
                                    </asp:DropDownList>
                                    &nbsp;to&nbsp;
                  <asp:DropDownList ID="ddl_fanSpeedMax" runat="server" CssClass="ddlInput">
                  </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Fan Diameter</td>
                                <td>
                                    <asp:DropDownList ID="ddl_fanDiameterMin" runat="server" CssClass="ddlInput">
                                    </asp:DropDownList>
                                    &nbsp;to&nbsp;
                  <asp:DropDownList ID="ddl_fanDiameterMax" runat="server" CssClass="ddlInput">
                  </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Electrical Supply</td>
                                <td>
                                    <asp:DropDownList ID="ddl_motorPhase" runat="server" CssClass="ddlInput">
                                        <asp:ListItem Text="Any" Value="Any"></asp:ListItem>
                                        <asp:ListItem Text="Single" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="3 Phase" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <%--<tr>
                <td colspan="2">
                  <asp:CheckBox ID="ckb_isBCAComplaint" Text=" Is BCA Complaint" runat="server" />
                </td>
              </tr>--%>
                            <tr>
                                <td colspan="2">Selection Envelope</td>
                            </tr>
                            <tr>
                                <td>Below:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLowerLimit" Width="40" Text="5" runat="server" />
                                    %
                                </td>
                            </tr>
                            <tr>
                                <td>Above:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUpperLimit" Width="40" Text="20" runat="server" />
                                    %
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Literal ID="lit_invalidAirflow" Visible="false" runat="server">Invalid Airflow</asp:Literal><br />
                                    <asp:Literal ID="lit_invalidStatic" Visible="false" runat="server">Invalid Static Pressure</asp:Literal><br />
                                    <asp:Literal ID="lit_invalidFanType" Visible="false" runat="server">No Fan Type Selected</asp:Literal>
                                    <asp:Literal ID="lit_message" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="div_clearButton" style="bottom: 0px; position: absolute">
                        <asp:Button ID="btn_clear" Text="Clear" runat="server" OnClientClick="return false" />
                        <asp:Label ID="lbl_versionNumber" Text="" runat="server" ForeColor="DarkGray" Style="bottom: 0px; position: absolute; right: 10px; left: auto; text-align: right" />
                    </div>

                    <div id="div_ranges">
                        <table>
                            <tr>
                                <th style="vertical-align: top">Fan Type</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TreeView ID="tv_categories" runat="server" ShowCheckBoxes="All" ShowExpandCollapse="false" />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="div_selectButton">
                        <asp:Button ID="btn_select" Text="Select" OnClick="btn_select_Click" runat="server" />
                    </div>

                    <div class="div_heading">
                        <label class="lbl_number" style="left: 30px; width: 46px;">1</label>
                        <label class="lbl_text" style="left: 80px">Fan Specs</label>
                        <svg height="50px">
                            <use href="#triangle" />
                        </svg>
                    </div>
                </div>
            </div>
            <div id="div_bottomLeft" runat="server">
                <div id="div_hideBottomLeft" class="hideBeforeSelect" runat="server">
                    <div class="sectionBorder">
                        <div id="div_selectFan">
                            <div id="div_fanTable">
                                <table id="fanTable" class="tablesorter-default" style="table-layout: fixed">
                                    <thead>
                                        <tr>
                                            <th style="width: 60px">Prod</th>
                                            <!-- <th>Type</th> -->
                                            <th>Dia</th>
                                            <th>Spd</th>
                                            <th>MkW</th>
                                            <th>Vts</th>
                                            <th>TEff%</th>
                                            <th>dBA</th>
                                            <th>W/(..</th>
                                            <th>Price%</th>
                                            <!--<th style="width:5%">Motor Pole</th>-->
                                            <!--<th style="width:5%">Motor Phase</th>-->
                                            <!--<th style="width:5%">Angle</th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (var fanData in fanDataList)
                                            {  %>
                                        <tr data-fandataid="<%= fanData.fanDataID.ToString() %>">
                                            <td><%= truncateString(fanData.fanObject.partNumber, 12) %></td>
                                            <!-- <td><%= truncateString(fanData.fanObject.fanType.category + " " + fanData.fanObject.fanType.description, 12) %></td> -->
                                            <td><%= fanData.fanObject.diameter %></td>
                                            <td><%= fanData.RPM %></td>
                                            <td><%= fanData.motorkW %></td>
                                            <td><%= getVoltage(fanData.fanObject) %></td>
                                            <td><%= getEfficiency(fanData) %></td>
                                            <td><%= getNoise(fanData) %></td>
                                            <td><%= getConsumedPowerOverAirflow(fanData) %></td>
                                            <!--<td><%= fanData.fanObject.motorPole.ToString()  %></td> -->
                                            <!--<td><%= fanData.fanObject.motorPhase.ToString() %></td> -->
                                            <!--<td><%= fanData.angle.ToString() %></td> -->
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="div_heading">
                            <label style="left: 30px; width: 46px">2</label>
                            <label style="left: 80px">Select Fan</label>
                            <svg height="50px">
                                <use href="#triangle" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div_right">
            <div id="div_hideRight" class="hideBeforeSelect" runat="server">
                <div class="sectionBorder">
                    <div id="div_fanData">
                        <div id="div_fanName">
                            <h3></h3>
                        </div>

                        <div id="div_buttons">
                            <asp:Button ID="btn_fanPDF" runat="server" Text="Get Fan PDF" OnClick="btn_getFanPdf_Click" />
                            <%--<asp:Button ID="btn_print" runat="server" Text="Print" OnClientClick="return false" OnClick="btn_print_Click" />--%>
                            <asp:Button ID="btn_addToSchedule" runat="server" Text="Add to Schedule" OnClick="btn_addToSchedule_Click" Width="150px"  />
                            <asp:Button ID="btn_Finished_Schedule" runat="server" Text="Finished" OnClick="btn_Finish_Click" Width="120px" />
                            <asp:Label ID="lblScheduleMsg" runat="server" ForeColor="Red"></asp:Label>
                        </div>

                        <div id="div_schedule" style="display: none">
                            Location:<asp:TextBox ID="txt_location" runat="server" />
                            Designation:<asp:TextBox ID="txt_designation" runat="server" />
                            <asp:CheckBox Text="Alternative" ID="ckb_alternative" runat="server" />
                        </div>

                        <div id="div_nominalData" style="background-color: #E3E3E3; padding: 20px;">
                            Nominal Data
                        <hr />
                            <div id="div_fanImage" style="display: inline-block"></div>
                            <div id="div_nominalDataTable" style="display: inline-block; vertical-align: top;"></div>
                        </div>

                        <div id="div_performanceData" style="background-color: #E3E3E3; padding: 20px;">
                            Performance Data
                        <hr />
                            <div id="div_performanceCurve" style="height: 500px; width: 70%; display: inline-block; vertical-align: top; min-width: 500px">
                                <asp:Literal ID="lit_performanceCurve" runat="server" />
                            </div>
                            <div id="div_performanceDataTable" style="display: inline-block; padding-top: 30px;"></div>
                        </div>

                        <div id="div_powerData" style="background-color: #E3E3E3; padding: 20px;">
                            Motor/Power Data
                        <hr />
                            <div id="div_powerCurve" style="height: 500px; width: 70%; display: inline-block; vertical-align: top; min-width: 500px">
                                <asp:Literal ID="lit_powerCurve" runat="server" />
                            </div>
                            <div id="div_powerRight" style="display: inline-block; vertical-align: top; padding-top: 30px; width: 25%;">
                                <div id="div_powerDataTable" style="display: inline-block; vertical-align: top; min-width: 500px"></div>
                                <div id="div_wiring" style="padding-top: 20px;"></div>
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

