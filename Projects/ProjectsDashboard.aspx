<%@ Page Title="Projects Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectsDashboard.aspx.cs" Inherits="CFM_Web.Projects.ProjectsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


  <div class="content-wrapper projects-wrapper">

      <div class="table-controls mt-solid mb-solid">
        <h1 ID="h1Projects" runat="server" class="table-title maintitle">Projects</h1>
  <p id="myHeader" runat="server"></p>
        <a href="/Projects/Project.aspx" class="button-main primary-btn inline"><i class="fas fa-plus-circle"></i> New Project</a>
      </div>
        <style>
                .fleft {float:left;  margin-left: 10px; margin-top: 5px}
                .smbtn {  width: 90px !important;  }
            </style>
      <div class="table-controls center-text mb-medium">
          <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for quotation number, project name, company or address" Width="300px" Height="32px" class="mr-small" Autocomplete="off"></asp:TextBox>
          <asp:Button ID="btnSearchProject" runat="server" Text="Search" OnClick="btnSearchForProject_Click" class="button-main primary-btn inline smbtn" />
          <asp:Button ID="btnSearchAll" runat="server" Text="All" OnClick="btnSearchForProject_Click" class="button-main primary-btn inline smbtn" />
          <asp:Button ID="btnShowPriceReq" runat="server" Text="Pricing Req" OnClick="btnShowPriceReq_Click" class="button-main green-btn inline smbtn" Visible="false" />

       <asp:Button ID="btnRestore" runat="server" Text="View deleted" OnClick="btnRestore_Click" class="button-main primary-btn inline smbtn" Visible="true" />
       <asp:Button ID="btnNoRestore" runat="server" Text="View current" OnClick="btnNoRestore_Click" class="button-main primary-btn inline smbtn" Visible="false" />
       <asp:Button ID="btnQreport" runat="server" Text="View quote report" OnClick="btnQreport_Click" class="button-main primary-btn inline smbtn" Visible="true" />
      </div>

     
    <asp:HiddenField ID="howIsSortedQuote" runat="server" />
    <asp:HiddenField ID="howIsSortedProjectName" runat="server" />
    <asp:HiddenField ID="howIsSortedComp" runat="server" />
    <asp:HiddenField ID="howIsSortedContact" runat="server" />
    <asp:HiddenField ID="lastSort1" runat="server" />
    <asp:HiddenField ID="lastSort2" runat="server" />

    

    <table class="table project">
        <thead>
          <tr>
            <td width="10%">Quote No. <asp:linkbutton ID="sortingQuoteButton" runat="server" onclick="SortQuote_Click" /></td>
            <td width="40%">Project <asp:linkbutton ID="sortingProjectNameButton" runat="server" onclick="SortProjectName_Click" /></td>
            <td width="17%">Company <asp:linkbutton ID="sortingCompButton" runat="server" onclick="SortComp_Click" /></td>
            <td width="12%">Sales Contact <asp:linkbutton ID="sortingContactButton" runat="server" onclick="SortContact_Click" /></td>
            <td ></td>
          </tr>
        </thead>
          
         <% if (projects != null)
                                     {
                                         foreach (var p in projects)
                                         { %>
                 <tr>
                     <td> <%= p.QuoteNumber %> </td>
                     <td> <a href="<%= getSpecificProjectUrl(p.ProjectID) %>"> <%= p.ProjectName %> </a></td>
                     <td> <%= p.EngineeringCompany  %> </td>
                     <td> <%= p.SalesConsultant  %> </td>
                     <td class="icons"> <%= getIcons(p.ProjectID, p.Status) %> </td>

                 </tr>
             <% }
                                     }%>

        
    </table>

    

  </div>
</asp:Content>

