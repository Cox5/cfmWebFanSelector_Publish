<%@ Page Title="New PDF List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="NewPDFInterface.aspx.cs" Inherits="CFM_Web.Projects.NewPDFInterface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        <div class="table-controls mb-medium">
            <span class="table-title" id="projectName" runat="server">
                    <asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label>
            </span>
        </div>

        <table class="table project" style="width: 400px">
            <tr>
                <td>Cover Page</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkCoverPage" runat="server" /></td>
            </tr>
            <tr>
                <td>Project Fan list</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkProjectFanList" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Specifications tables</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanSpecTables" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Technical Datasheets</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanTechDatasheets" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Dimensional Diagrams</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanDimensDiagrams" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Wiring Diagrams</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanWiringDiagrams" runat="server" /></td>
            </tr>
            <tr>
                <td>Include Prices</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkIncludePrices" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div class="mt-medium">
            
            <asp:Button ID="btnSubmit" class="button-main primary-btn" runat="server" Text="Create" OnClick="btnSubmit_Click" />
        
    
            <asp:Button ID="btnCancel" class="button-main quarternary-btn" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            
        <div>
</asp:Content>
