<%@ Page Title="Projects Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectsDashboard.aspx.cs" Inherits="CFM_Web.Projects.ProjectsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


  <div class="content-wrapper">

      <div class="table-controls mt-solid mb-solid">
        <h1 class="table-title">Projects</h1>
  
        <a href="/Projects/Project.aspx" class="button-main primary-btn"><i class="fas fa-plus-circle"></i> New Project</a>
      </div>

      <table style="margin: auto;">
          <tr>
             
              <td>
                  <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for project name, company or address"></asp:TextBox></td>
              <td>
                  <asp:Button ID="btnSearchProject" runat="server" Text="Search" OnClick="btnSearchForProject_Click" class="button-main primary-btn" /></td>
          </tr>
      </table>

     

    

    <table class="table project">
        <thead>
          <tr>
            <td width="25%">Project</td>
            <td width="27%">Location</td>
            <td width="29%">Company</td>
            <td ></td>
          </tr>
        </thead>
          
         <%= getProjects() %>

        
    </table>

    <div class="right-controls mt-medium">
      <a href="/Dashboard.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-left"></i> Go Back</a>
    </div>
    

  </div>
</asp:Content>

