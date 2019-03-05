<%@ Page Title="Fan Locations" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="CFM_Web.Projects.Fans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">

    <table id="fanLocationsTable" style="width: 700px">
        <tr><td colspan="2" align="left" class="tabletitle">Fan Locations</td><td colspan="4"><span id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td><td id="addFanCol" align="right" runat="server"><div class="buttons"><a href="<%= getAddFanLocationsURL() %>">Add Fan Locations</a></div></td></tr>
        <tr>
            <td >Description</td><td>Designation</td><td >Airflow</td><td >St.Pr.</td><td>CFM Fan</td><td align="right">Qty</td><td id="tdPrice" align="right"><asp:Label ID="lblPrice" runat="server" >Price</asp:Label></td><td>&nbsp;</td>
        </tr>
         <%= getProjectFans() %>
        <tr>
            <td colspan="2" align="left"><asp:Label ID="lblSuccessMsg" runat="server"></asp:Label></td>
            <td colspan="7" align="right">
                <div class="buttons"><a href="/Projects/ProjectsDashboard.aspx">Finished</a></div>
            </td>
        </tr>
    </table>
  </div>
</asp:Content>
