<%@ Page Title="Add Fan Referemces" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="AddFanLocations.aspx.cs" Inherits="CFM_Web.Projects.AddFanLocations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        .txtLocation { width: 250px;}
        .txtAirflow { width: 100px;}
        .txtStaticPressure { width: 100px;}
        .txtDesignation { width: 250px;}
        .txtQuantity { width: 100px;}
        .table td, .table th {
            padding: 1px;
        }
        td.tiny-td select {
            padding: 2px;
        }
    </style>
    <div class="content-wrapper">
       
        
            <div class="mb-solid mt-solid">
                <div class="table-controls">
                    <div style="display: inline-block; float: left;">
                       <h1 class="table-title sub">Add Fan References</h1>
                   </div>
                   <div class="right-controls mt-medium mr-small" style="float: right;">
                       <asp:Button ID="Button1"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnCancel_Click" runat="server" />
                    </div>
                </div> 
                <div style="clear:both">
                    <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
                    </div>
            </div>
<style>
.sub div { visibility: hidden; }
.has-sub:hover > .sub div { visibility: visible; } 
.afl-tr {height: 19px; font-size: 14px;}
</style>
            <table class="table table-form" >
                <thead>
                    <tr >
                        <td style="width:10%">Fan Reference</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">Qty</td>
                        <td style="width:14%">Fan Type</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >Airflow (l/s)</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">Static<br />Pressure (Pa)</td>
                        <td style="width:5%; text-align:center">Diameter<br />(mm)</td>
                        <td style="width:5%; text-align:center" class="tiny-td" >Speed<br /> (RPM)</td>
                        <td style="width:5%; text-align:center" class="tiny-td" >Power</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >Sound Pressure<br />dBA @ 3m</td>
                        <td style="width:10%;text-align:center" class="tiny-td" >Motor<br />Type</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >Blade<br />Material</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >Ancill.</td>
                        <td style="text-align:left" class="tiny-td" >&nbsp;&nbsp;&nbsp;Selected Fan</td>                      
                    </tr>
                </thead>
            </table>
            <div id="dvScroll" style="overflow-x:hidden; overflow-y: scroll; height: 212px; width: 100%">
            <table class="table table-form">
                   <tbody>
                      <tr style="height: 1px;border-bottom: none !important; overflow: hidden; font-size: 1px;">
                        <td style="width:10%">&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">&nbsp;</td>
                        <td style="width:14%">&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">&nbsp;</td>
                        <td style="width:5%; text-align:center">&nbsp;</td>
                        <td style="width:5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:6%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:10%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="text-align:center" class="tiny-td" >&nbsp;</td>                      
                    </tr>
                <tr>
                     <%= getFanLocations() %>
                </tr>
              </table>
            </div>
              <table class="table table-form">
                   <tbody>
                      <tr style="height: 1px;border-bottom: none !important; overflow: hidden; font-size: 1px;">
                        <td style="width:10%">&nbsp;</td>
                        <td style="width: 4%; text-align:center" class="tiny-td">&nbsp;</td>
                        <td style="width:15%">&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">&nbsp;</td>
                        <td style="width:5%; text-align:center">&nbsp;</td>
                        <td style="width:5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:10%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="text-align:center" class="tiny-td" >&nbsp;</td>                      
                    </tr>
                <tr>
					<td class="tiny-td"><asp:TextBox ID="txtDesignation1" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity1" CssClass="txtQuantity" runat="server" Value="1" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType1" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow1" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure1" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtDiameter1" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed1" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase1" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtSound1" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddMotorType1" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddBlade1" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddAncill1" runat="server"></asp:DropDownList></td>
                    <td><asp:Label ID="lblMsg1" runat="server" ForeColor="Red"></asp:Label></td>
                    <td style="text-align:center" class="tiny-td" >&nbsp;</td>
                </tr>
                <tr>
                    <td class="tiny-td"><asp:TextBox ID="txtDesignation2" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity2" CssClass="txtQuantity" runat="server" Value="1" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType2" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow2" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure2" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtDiameter2" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed2" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase2" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtSound2" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddMotorType2" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddBlade2" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddAncill2" runat="server"></asp:DropDownList></td>
                    <td><asp:Label ID="lblMsg2" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>

                <tr>
                    <td class="tiny-td"><asp:TextBox ID="txtDesignation3" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity3" CssClass="txtQuantity" runat="server" Value="1" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType3" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow3" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure3" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtDiameter3" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed3" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase3" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtSound3" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddMotorType3" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddBlade3" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddAncill3" runat="server"></asp:DropDownList></td>
                    <td><asp:Label ID="lblMsg3" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>

                <tr>
                    <td class="tiny-td"><asp:TextBox ID="txtDesignation4" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity4" CssClass="txtQuantity" runat="server" Value="1" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType4" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow4" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure4" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtDiameter4" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed4" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase4" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtSound4" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddMotorType4" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddBlade4" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddAncill4" runat="server"></asp:DropDownList></td>
                    <td><asp:Label ID="lblMsg4" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td class="tiny-td"><asp:TextBox ID="txtDesignation5" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity5" CssClass="txtQuantity" runat="server" Value="1" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType5" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow5" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure5" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtDiameter5" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed5" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase5" runat="server"></asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtSound5" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddMotorType5" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddBlade5" runat="server"></asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddAncill5" runat="server"></asp:DropDownList></td>
                    <td><asp:Label ID="lblMsg5" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                </tbody>
                </table>

                <asp:Label ID="lblMessage" runat="server" />

                <div class="right-controls mt-medium mr-small">
                    <asp:Button ID="btnSubmit" class="button-main primary-btn" Text="Save" runat="server" OnClick="btnSubmit_Click" />
                </div>
        
    </div>

    <div >
        <table id="table1"></table>
    </div>


</asp:Content>
