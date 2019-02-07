<%@ Page Title="Projects Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectsDashboard.aspx.cs" Inherits="CFM_Web.Projects.ProjectsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


  <div class="content-wrapper">

    <table style="width: 700px">
        <tr><td colspan="2" align="left" class="tabletitle">Projects</td><td colspan="2" align="right"><div class="buttons"><a href="/Projects/Project.aspx" >New Project</a></div></td></tr>
        <tr><td width="27%">Project</td><td width="27%">Location</td><td width="27%">Company</td><td></td></tr>

         <%= getProjects() %>

        <td>
            <td colspan="4" align="right"><div class="buttons"><a href="/Dashboard.aspx">Go Back</a></div></td>
        </td>
    </table>
  </div>
</asp:Content>

