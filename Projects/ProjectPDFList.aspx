<%@ Page Title="Project PDF List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectPDFList.aspx.cs" Inherits="CFM_Web.Projects.ProjectPDFList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">



        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">PDF List</h1>    
              <div class="right-controls mt-medium mr-small" style="float: right;">
                       <asp:Button ID="Button1"  class="button-main primary-btn prevpage" style="margin-left: 22px" Text="Finished" OnClick="btnFinish_Click" runat="server" />
              <div class="right-button clearfix" style="text-align:center"><a href="<%= getNewPDFURL() %>" class="button-main primary-btn"><i class="fas fa-file-pdf"></i> New PDF</a></div>
              </div> 

            </div>
            
            <div class="project-name" ><asp:Label ID="lblProjectName" runat="server" ></asp:Label></div>
            <div class="subtitle regular" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
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
        <%--<a class="button-main primary-btn" href="/Projects/ProjectsDashboard.aspx">Finished <i class="fas fa-chevron-right"></i></a>--%>
    </div>

  </div>
</asp:Content>
