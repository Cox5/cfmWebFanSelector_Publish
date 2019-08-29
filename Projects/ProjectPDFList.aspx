<%@ Page Title="Project PDF List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectPDFList.aspx.cs" Inherits="CFM_Web.Projects.ProjectPDFList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <div class="mt-solid mb-solid">
            <td colspan="2" align="left" class="tabletitle"><span class="table-title aside" id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td>
        
            <td id="addPDF" runat="server"><a href="<%= getNewPDFURL() %>" class="button-main primary-btn"><i class="fas fa-file-pdf"></i> New PDF</a></td>
        </div>
    
            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblWarningPrices" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblWarningFan" runat="server" ForeColor="Red"></asp:Label>

    <table class="table project">  

        <thead>
            <tr>
                <td >PDF Name</td><td>Options</td><td ></td><td>&nbsp;</td>
            </tr>
        </thead>
            
        
         <%= getProjectPDFs() %>
       
    </table>

    <div class="right-controls mt-medium mr-small">
        <asp:LinkButton runat="server" CommandName="Finish" OnClick="btnFinish_Click" CausesValidation="false" class="button-main primary-btn" >Finished <i class="fas fa-chevron-right"></i></asp:LinkButton>
        <%--<a class="button-main primary-btn" href="/Projects/ProjectsDashboard.aspx">Finished <i class="fas fa-chevron-right"></i></a>--%>
    </div>

  </div>
</asp:Content>
