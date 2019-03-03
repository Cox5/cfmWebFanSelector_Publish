<%@ Page Title="Project PDF List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectPDFList.aspx.cs" Inherits="CFM_Web.Projects.ProjectPDFList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

    <table style="width: 700px">
        <tr><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></tr>
        <tr><td colspan="2" align="left" class="tabletitle"><span id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td><td id="addPDF" align="right" runat="server"><div class="buttons"><a href="<%= getNewPDFURL() %>">New PDF</a></div></td></tr>
        <tr>
            <td><asp:Label ID="lblWarningFan" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblWarningPrices" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
            
        <tr>
            <td >PDF Name</td><td>Options</td><td ></td><td>&nbsp;</td>
        </tr>
         <%= getProjectPDFs() %>
        <tr>
            <td colspan="7" align="right">
                <div class="buttons"><a href="/Projects/ProjectsDashboard.aspx">Finished</a></div>
            </td>
        </tr>
    </table>
  </div>
</asp:Content>
