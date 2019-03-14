<%@ Page Title="Project PDF List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectPDFList.aspx.cs" Inherits="CFM_Web.Projects.ProjectPDFList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <div class="mt-solid mb-solid">
            <td colspan="2" align="left" class="tabletitle"><span class="table-title aside" id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td>
        
            <td id="addPDF" runat="server"><a href="<%= getNewPDFURL() %>" class="button-main primary-btn"><i class="fas fa-file-pdf"></i> New PDF</a></td>
        </div>
    

    <table style="width: 700px">
        <tr>
            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></tr>
       
            <td colspan="3"><asp:Label ID="lblWarningFan" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblWarningPrices" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
            
        <tr>
            <td >PDF Name</td><td>Options</td><td ></td><td>&nbsp;</td>
        </tr>
         <%= getProjectPDFs() %>
       
    </table>

    <div class="right-controls mt-medium mr-small">
        <a class="button-main primary-btn" href="/Projects/ProjectsDashboard.aspx">Finished <i class="fas fa-chevron-right"></i></a>
    </div>

  </div>
</asp:Content>
