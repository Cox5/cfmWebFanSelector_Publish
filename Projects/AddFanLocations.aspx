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
        
    </style>
    <div class="content-wrapper">
       
        
            <div class="mb-solid mt-solid">
                <div class="table-controls">
                    <div style="display: inline-block; float: left;">
                       <h1 class="table-title sub">Add Fan References</h1>
                   </div>
                   <div class="right-controls mt-medium mr-small" style="float: right;">
                       <asp:Button ID="Button1"  class="button-main primary-btn" Text="Finished" OnClick="btnCancel_Click" runat="server" />
                    </div>
                </div> 
                <div style="clear:both">
                    <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
                    </div>
            </div>

            <table class="table table-form">
               
                <thead>
                    <tr>
                        <td style="width:15%">Fan Reference</td>
                        <td style="width:10%">Fan Type</td>
                        <td>Selected Fan</td>
                        <td style="text-align:center" class="tiny-td" >Speed (RPM)</td>
                        <td style="text-align:center" class="tiny-td" >Phase</td>
                        <td style="text-align:center" class="tiny-td" >Poles</td>
                        <td style="text-align:center" class="tiny-td" >Airflow (l/s)</td>
                        <td style="text-align:center" class="tiny-td">Static<br />Pressure (Pa)</td>
                        <td style="text-align:center" class="tiny-td">Qty</td>
                    </tr>
                </thead>
                <tr>
                     <%= getFanLocations() %>
                </tr>
                <tr>
					<td class="tiny-td"><asp:TextBox ID="txtDesignation1" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
<td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType1" runat="server">
<asp:ListItem Value="Roof Axial Exhaust">Roof Axial Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Axial Supply">Roof Axial Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust">Roof Cen Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Supply">Roof Cen Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust with Grease Trap">Rf Cen Ex+GrTrap</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal TEFC Motor">Rf Cen TEFC Mtr</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Twin fan">Roof Cen Twin fan</asp:ListItem>
<asp:ListItem Value="Roof Mixflow">Roof Mixflow</asp:ListItem>
<asp:ListItem Value="Roof Smoke Spill">Roof Smoke Spill</asp:ListItem>
<asp:ListItem Value="Inline Axial">Inline Axial</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal">Inline Cen</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal TEFC Motor">Inline Cen TEFC</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal Twin fan">Inline Cen Twin</asp:ListItem>
<asp:ListItem Value="Inline Mixflow">Inline Mixflow</asp:ListItem>
<asp:ListItem Value="Inline Smoke Spill">Inline SS</asp:ListItem>
<asp:ListItem Value="SWSI Centrifugal">SWSI Cen</asp:ListItem>
<asp:ListItem Value="DWDI Centrifugal">DWDI Cen</asp:ListItem>
<asp:ListItem Value="Wall Mounted Smoke Spill">Wall Mount SS</asp:ListItem>
<asp:ListItem Value="Wall / Window Mounted">Wall/Window Mt</asp:ListItem>
<asp:ListItem Value="Ceiling Mounted">Ceiling Mount</asp:ListItem>
<asp:ListItem Value="Roof Cowl">Roof Cowl</asp:ListItem>
<asp:ListItem Value="Other fan">Other fan</asp:ListItem>
</asp:DropDownList>
</td>

                    <td></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed1" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="720">720</asp:ListItem>
                        <asp:ListItem Value="1440">1440</asp:ListItem>
                        <asp:ListItem Value="2880">2880</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase1" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPoles1" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow1" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure1" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity1" CssClass="txtQuantity" runat="server" Placeholder="1" AutoCompleteType="Disabled"/></td>
                    <td><asp:Label ID="lblMsg1" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
					<td class="tiny-td"><asp:TextBox ID="txtDesignation2" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td">
                        <asp:DropDownList ID="ddFanType2" runat="server">
<asp:ListItem Value="Roof Axial Exhaust">Roof Axial Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Axial Supply">Roof Axial Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust">Roof Cen Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Supply">Roof Cen Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust with Grease Trap">Rf Cen Ex+GrTrap</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal TEFC Motor">Rf Cen TEFC Mtr</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Twin fan">Roof Cen Twin fan</asp:ListItem>
<asp:ListItem Value="Roof Mixflow">Roof Mixflow</asp:ListItem>
<asp:ListItem Value="Roof Smoke Spill">Roof Smoke Spill</asp:ListItem>
<asp:ListItem Value="Inline Axial">Inline Axial</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal">Inline Cen</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal TEFC Motor">Inline Cen TEFC</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal Twin fan">Inline Cen Twin</asp:ListItem>
<asp:ListItem Value="Inline Mixflow">Inline Mixflow</asp:ListItem>
<asp:ListItem Value="Inline Smoke Spill">Inline SS</asp:ListItem>
<asp:ListItem Value="SWSI Centrifugal">SWSI Cen</asp:ListItem>
<asp:ListItem Value="DWDI Centrifugal">DWDI Cen</asp:ListItem>
<asp:ListItem Value="Wall Mounted Smoke Spill">Wall Mount SS</asp:ListItem>
<asp:ListItem Value="Wall / Window Mounted">Wall/Window Mt</asp:ListItem>
<asp:ListItem Value="Ceiling Mounted">Ceiling Mount</asp:ListItem>
<asp:ListItem Value="Roof Cowl">Roof Cowl</asp:ListItem>
<asp:ListItem Value="Other fan">Other fan</asp:ListItem>
</asp:DropDownList>
</td>
                   <td></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed2" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="720">720</asp:ListItem>
                        <asp:ListItem Value="1440">1440</asp:ListItem>
                        <asp:ListItem Value="2880">2880</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase2" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPoles2" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="tiny-td"><asp:TextBox ID="txtAirflow2" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure2" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity2" CssClass="txtQuantity" runat="server" Placeholder="1" AutoCompleteType="Disabled"/></td>
                    <td><asp:Label ID="lblMsg2" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
					<td class="tiny-td"><asp:TextBox ID="txtDesignation3" CssClass="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType3" runat="server">
<asp:ListItem Value="Roof Axial Exhaust">Roof Axial Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Axial Supply">Roof Axial Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust">Roof Cen Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Supply">Roof Cen Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust with Grease Trap">Rf Cen Ex+GrTrap</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal TEFC Motor">Rf Cen TEFC Mtr</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Twin fan">Roof Cen Twin fan</asp:ListItem>
<asp:ListItem Value="Roof Mixflow">Roof Mixflow</asp:ListItem>
<asp:ListItem Value="Roof Smoke Spill">Roof Smoke Spill</asp:ListItem>
<asp:ListItem Value="Inline Axial">Inline Axial</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal">Inline Cen</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal TEFC Motor">Inline Cen TEFC</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal Twin fan">Inline Cen Twin</asp:ListItem>
<asp:ListItem Value="Inline Mixflow">Inline Mixflow</asp:ListItem>
<asp:ListItem Value="Inline Smoke Spill">Inline SS</asp:ListItem>
<asp:ListItem Value="SWSI Centrifugal">SWSI Cen</asp:ListItem>
<asp:ListItem Value="DWDI Centrifugal">DWDI Cen</asp:ListItem>
<asp:ListItem Value="Wall Mounted Smoke Spill">Wall Mount SS</asp:ListItem>
<asp:ListItem Value="Wall / Window Mounted">Wall/Window Mt</asp:ListItem>
<asp:ListItem Value="Ceiling Mounted">Ceiling Mount</asp:ListItem>
<asp:ListItem Value="Roof Cowl">Roof Cowl</asp:ListItem>
<asp:ListItem Value="Other fan">Other fan</asp:ListItem>
</asp:DropDownList>
                        </td>
                    <td></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed3" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="720">720</asp:ListItem>
                        <asp:ListItem Value="1440">1440</asp:ListItem>
                        <asp:ListItem Value="2880">2880</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase3" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPoles3" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem> 
                        <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList></td>

                    <td class="tiny-td"><asp:TextBox ID="txtAirflow3" CssClass="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure3" CssClass="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity3" CssClass="txtQuantity" runat="server" Placeholder="1" AutoCompleteType="Disabled"/></td>
                    <td><asp:Label ID="lblMsg3" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
					<td class="tiny-td"><asp:TextBox ID="txtDesignation4" class="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
<td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType4" runat="server">
<asp:ListItem Value="Roof Axial Exhaust">Roof Axial Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Axial Supply">Roof Axial Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust">Roof Cen Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Supply">Roof Cen Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust with Grease Trap">Rf Cen Ex+GrTrap</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal TEFC Motor">Rf Cen TEFC Mtr</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Twin fan">Roof Cen Twin fan</asp:ListItem>
<asp:ListItem Value="Roof Mixflow">Roof Mixflow</asp:ListItem>
<asp:ListItem Value="Roof Smoke Spill">Roof Smoke Spill</asp:ListItem>
<asp:ListItem Value="Inline Axial">Inline Axial</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal">Inline Cen</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal TEFC Motor">Inline Cen TEFC</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal Twin fan">Inline Cen Twin</asp:ListItem>
<asp:ListItem Value="Inline Mixflow">Inline Mixflow</asp:ListItem>
<asp:ListItem Value="Inline Smoke Spill">Inline SS</asp:ListItem>
<asp:ListItem Value="SWSI Centrifugal">SWSI Cen</asp:ListItem>
<asp:ListItem Value="DWDI Centrifugal">DWDI Cen</asp:ListItem>
<asp:ListItem Value="Wall Mounted Smoke Spill">Wall Mount SS</asp:ListItem>
<asp:ListItem Value="Wall / Window Mounted">Wall/Window Mt</asp:ListItem>
<asp:ListItem Value="Ceiling Mounted">Ceiling Mount</asp:ListItem>
<asp:ListItem Value="Roof Cowl">Roof Cowl</asp:ListItem>
<asp:ListItem Value="Other fan">Other fan</asp:ListItem>
</asp:DropDownList>
</td>
                    <td></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed4" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="720">720</asp:ListItem>
                        <asp:ListItem Value="1440">1440</asp:ListItem>
                        <asp:ListItem Value="2880">2880</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase4" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPoles4" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList></td>

                    <td class="tiny-td"><asp:TextBox ID="txtAirflow4" class="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure4" class="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity4" class="txtQuantity" runat="server" Placeholder="1" AutoCompleteType="Disabled"/></td>
                    <td><asp:Label ID="lblMsg4" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
					<td class="tiny-td"><asp:TextBox ID="txtDesignation5" class="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddFanType5" runat="server">
<asp:ListItem Value="Roof Axial Exhaust">Roof Axial Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Axial Supply">Roof Axial Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust">Roof Cen Exhaust</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Supply">Roof Cen Supply</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Exhaust with Grease Trap">Rf Cen Ex+GrTrap</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal TEFC Motor">Rf Cen TEFC Mtr</asp:ListItem>
<asp:ListItem Value="Roof Centrifugal Twin fan">Roof Cen Twin fan</asp:ListItem>
<asp:ListItem Value="Roof Mixflow">Roof Mixflow</asp:ListItem>
<asp:ListItem Value="Roof Smoke Spill">Roof Smoke Spill</asp:ListItem>
<asp:ListItem Value="Inline Axial">Inline Axial</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal">Inline Cen</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal TEFC Motor">Inline Cen TEFC</asp:ListItem>
<asp:ListItem Value="Inline Centrifugal Twin fan">Inline Cen Twin</asp:ListItem>
<asp:ListItem Value="Inline Mixflow">Inline Mixflow</asp:ListItem>
<asp:ListItem Value="Inline Smoke Spill">Inline SS</asp:ListItem>
<asp:ListItem Value="SWSI Centrifugal">SWSI Cen</asp:ListItem>
<asp:ListItem Value="DWDI Centrifugal">DWDI Cen</asp:ListItem>
<asp:ListItem Value="Wall Mounted Smoke Spill">Wall Mount SS</asp:ListItem>
<asp:ListItem Value="Wall / Window Mounted">Wall/Window Mt</asp:ListItem>
<asp:ListItem Value="Ceiling Mounted">Ceiling Mount</asp:ListItem>
<asp:ListItem Value="Roof Cowl">Roof Cowl</asp:ListItem>
<asp:ListItem Value="Other fan">Other fan</asp:ListItem>
</asp:DropDownList>
</td>
                    <td></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddSpeed5" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="720">720</asp:ListItem>
                        <asp:ListItem Value="1440">1440</asp:ListItem>
                        <asp:ListItem Value="2880">2880</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPhase5" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:center" class="tiny-td"><asp:DropDownList ID="ddPoles5" runat="server">
                        <asp:ListItem Value="0">Any</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList></td>

                    <td class="tiny-td"><asp:TextBox ID="txtAirflow5" class="txtAirflow" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtStaticPressure5" class="txtStaticPressure" runat="server" AutoCompleteType="Disabled"/></td>
                    <td class="tiny-td"><asp:TextBox ID="txtQuantity5" class="txtQuantity" runat="server" Placeholder="1" AutoCompleteType="Disabled"/></td>
                    <td><asp:Label ID="lblMsg5" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
               
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
