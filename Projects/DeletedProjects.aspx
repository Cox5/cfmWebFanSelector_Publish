<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="DeletedProjects.aspx.cs" Inherits="CFM_Web.Projects.DeletedProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="content-wrapper">
    
    <table class="table project">
        <thead>
          <tr>
            <td width="10%">Quote No.</td>
            <td width="20%">Project </td>
            <td width="21%">Location</td>
            <td width="17%">Company</td>
            <td width="12%">Contact</td>
            <td ></td>
          </tr>
        </thead>
          
         <% foreach (var p in deletedProjects) { %>
                 <tr>
                     <td> <%= p.QuoteNumber %> </td>
                     <td> <%= p.ProjectName %> </td>
                     <td> <%= p.Address1 + ", " + p.Suburb + ", " + p.Postcode  %> </td>
                     <td> <%= p.EngineeringCompany  %> </td>
                     <td> <%= p.SalesConsultant  %> </td>
                     <td class="icons"><%= getRestoreIcon(p.ProjectID) %> </td>

                 </tr>
             <% } %>

        
    </table>

    <div class="right-controls mt-medium">
      <a href="Projects/ProjectsDashboard.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-left"></i> Go Back</a>
    </div>
    </div>
</asp:Content>
