<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="NewPDFInterface.aspx.cs" Inherits="CFM_Web.Projects.NewPDFInterface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
        <table>
            <tr>
                <td colspan="2" align="left" class="tabletitle"><span id="projectName" runat="server">
                    <asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td>
            </tr>
            <tr>
                <td>Cover Page</td>
                <td><asp:CheckBox ID="chkCoverPage" runat="server" /></td>
            </tr>
            <tr>
                <td>Project Fan list</td>
                <td><asp:CheckBox ID="chkProjectFanList" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Specifications tables</td>
                <td><asp:CheckBox ID="chkFanSpecTables" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Technical Datasheets</td>
                <td><asp:CheckBox ID="chkFanTechDatasheets" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Dimensional Diagrams</td>
                <td><asp:CheckBox ID="chkFanDimensDiagrams" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Wiring Diagrams</td>
                <td><asp:CheckBox ID="chkFanWiringDiagrams" runat="server" /></td>
            </tr>
            <tr>
                <td>Include Prices</td>
                <td><asp:CheckBox ID="chkIncludePrices" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Create" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>
