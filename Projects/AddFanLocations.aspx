<%@ Page Title="Add Fan Locations" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="AddFanLocations.aspx.cs" Inherits="CFM_Web.Projects.AddFanLocations" %>
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
                    <h1 class="table-title sub">Add Fan Locations</h1>
                </div>
                
                <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
            </div>

            <table class="table table-form">
               
                <thead>
                    <tr>
                        <td>Location Description*</td>
                        <td class="medium-td">Location Designation</td>
                        <td class="medium-td" >Airflow*</td>
                        <td class="small-td">Static<br />Press.*</td>
                        <td class="small-td">Qty</td>
                    </tr>
                </thead>
                <tr>
                     <%= getFanLocations() %>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtLocation1" class="txtLocation" runat="server" /></td>
					<td><asp:TextBox ID="txtDesignation1" class="txtDesignation" runat="server" /></td>
                    <td><asp:TextBox ID="txtAirflow1" class="txtAirflow" runat="server" /></td>
                    <td><asp:TextBox ID="txtStaticPressure1" class="txtStaticPressure" runat="server" /></td>
                    <td><asp:TextBox ID="txtQuantity1" class="txtQuantity" runat="server" Placeholder="1"/></td>
                    <td><asp:Label ID="lblMsg1" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtLocation2" class="txtLocation" runat="server" /></td>
					<td><asp:TextBox ID="txtDesignation2" class="txtDesignation" runat="server" /></td>
                    <td><asp:TextBox ID="txtAirflow2" class="txtAirflow" runat="server" /></td>
                    <td><asp:TextBox ID="txtStaticPressure2" class="txtStaticPressure" runat="server" /></td>
                    <td><asp:TextBox ID="txtQuantity2" class="txtQuantity" runat="server" Placeholder="1" /></td>
                    <td><asp:Label ID="lblMsg2" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtLocation3" class="txtLocation" runat="server" /></td>
					<td><asp:TextBox ID="txtDesignation3" class="txtDesignation" runat="server" /></td>
                    <td><asp:TextBox ID="txtAirflow3" class="txtAirflow" runat="server" /></td>
                    <td><asp:TextBox ID="txtStaticPressure3" class="txtStaticPressure" runat="server" /></td>
                    <td><asp:TextBox ID="txtQuantity3" class="txtQuantity" runat="server" Placeholder="1" /></td>
                    <td><asp:Label ID="lblMsg3" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtLocation4" class="txtLocation" runat="server" /></td>
					<td><asp:TextBox ID="txtDesignation4" class="txtDesignation" runat="server" /></td>
                    <td><asp:TextBox ID="txtAirflow4" class="txtAirflow" runat="server" /></td>
                    <td><asp:TextBox ID="txtStaticPressure4" class="txtStaticPressure" runat="server" /></td>
                    <td><asp:TextBox ID="txtQuantity4" class="txtQuantity" runat="server" Placeholder="1" /></td>
                    <td><asp:Label ID="lblMsg4" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtLocation5" class="txtLocation" runat="server" /></td>
					<td><asp:TextBox ID="txtDesignation5" class="txtDesignation" runat="server" /></td>
                    <td><asp:TextBox ID="txtAirflow5" class="txtAirflow" runat="server" /></td>
                    <td><asp:TextBox ID="txtStaticPressure5" class="txtStaticPressure" runat="server" /></td>
                    <td><asp:TextBox ID="txtQuantity5" class="txtQuantity" runat="server" Placeholder="1" /></td>
                    <td><asp:Label ID="lblMsg5" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr><td colspan="4" align="right">
               <asp:Button ID="btnSubmit" class="button-main primary-btn" Text="Add Locations" runat="server" OnClick="btnSubmit_Click" />
                    </td>
                    <td align="right">
                        <asp:Button ID="btnCancel"  class="button-main primary-btn" Text="Finished" OnClick="btnCancel_Click" runat="server" style="width: 100%"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right"><asp:Button ID="btnAddMore" Text="Add More" runat="server" OnClick="btnAddMore_Click" /></td>
                    <td colspan="5" align="right"><asp:Button ID="btnFinish" Text="Finish" runat="server" OnClick="btnFinish_Click" /></td>
                </tr>
                <tr><td><asp:Label ID="lblMessage" runat="server" /></td></tr>
                </table>
        
    </div>

    <div >
        <table id="table1"></table>
    </div>


</asp:Content>
