<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectsDashboard.aspx.cs" Inherits="CFM_Web.Projects.ProjectsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

  <div class="content-wrapper">

    <table style="width: 700px">
        <tr><td colspan="2" align="left" class="tabletitle">Projects</td><td colspan="2" align="right"><div class="buttons"><a href="/Projects/Project.aspx" >New Project</a></div></td></tr>
        <tr><td width="27%">Project</td><td width="27%">Location</td><td width="27%">Company</td><td></td></tr>
        <tr><td>Maffra Shopping Centre</td><td>Main St, Maffra</td><td>Maffra Developments</td>
            <td>
                    <a href="/Projects/Project.aspx?proj=1" ><img src="/icons/edit.png" height="20" width="20"/></a>
                    <a href="/Projects/Fans.aspx?proj=1" ><img src="/icons/fan.png" height="20" width="20"/></a>
                    <a href="/Projects/PDF.aspx?proj=1" ><img src="/icons/pdf.png" height="20" width="20"/></a>
                </td>

        </tr>
    </table>
  </div>
</asp:Content>

