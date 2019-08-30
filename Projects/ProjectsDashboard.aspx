<%@ Page Title="Projects Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectsDashboard.aspx.cs" Inherits="CFM_Web.Projects.ProjectsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


  <div class="content-wrapper projects-wrapper">

      <div class="table-controls mt-solid mb-solid">
        <h1 class="table-title maintitle">Projects</h1>
  
        <a href="/Projects/Project.aspx" class="button-main primary-btn"><i class="fas fa-plus-circle"></i> New Project</a>
      </div>

   

      
      <div class="table-controls center-text mb-medium">
          <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for quotation number, project name, company or address" Width="430px" Height="32px" class="mr-small"></asp:TextBox>
          <asp:Button ID="btnSearchProject" runat="server" Text="Search" OnClick="btnSearchForProject_Click" class="button-main primary-btn" />
      </div>

     
      
    <asp:HiddenField ID="howIsSortedProjectName" runat="server" />
    

    <table class="table project">
        <thead>
          <tr>
            <td width="10%">Quote No.</td>
            <td width="20%">Project <asp:linkbutton ID="sortingProjectNameButton" runat="server" onclick="SortProjectName_Click" /></td>
            <td width="21%">Location</td>
            <td width="17%">Company</td>
            <td width="12%">Contact</td>
            <td ></td>
          </tr>
        </thead>
          
         <% foreach (var p in projects) { %>
                 <tr>
                     <td> <%= p.QuoteNumber %> </td>
                     <td> <a href="<%= getSpecificProjectUrl(p.ProjectID) %>"> <%= p.ProjectName %> </a></td>
                     <td> <%= p.Address1 + ", " + p.Suburb + ", " + p.Postcode  %> </td>
                     <td> <%= p.EngineeringCompany  %> </td>
                     <td> <%= p.SalesConsultant  %> </td>
                     <td class="icons"> <%= getIcons(p.ProjectID, p.Status) %> </td>

                 </tr>
             <% } %>

        
    </table>

    <div class="right-controls mt-medium">
      <a href="/Dashboard.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-left"></i> Go Back</a>
    </div>
    

  </div>
</asp:Content>

