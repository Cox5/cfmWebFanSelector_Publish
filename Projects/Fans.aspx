<%@ Page Title="Fan Locations" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="CFM_Web.Projects.Fans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">

    <table style="width: 700px">
        <tr><td colspan="2" align="left" class="tabletitle">Fan Locations</td><td colspan="4"><span id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td><td id="addFanCol" align="right" runat="server"><div class="buttons"><a href="<%= getAddFanLocationsURL() %>">Add Fan Locations</a></div></td></tr>
        <tr>
            <td >Description</td><td>Designation</td><td >Airflow</td><td >St.Pr.</td><td>CFM Fan</td><td align="right">Qty</td><td align="right">Price</td><td>&nbsp;</td>
        </tr>
        <%--<tr>
            <td >Car park west</td><td>CP-West</td><td >7000</td><td >80</td><td>MVL7K-70</td><td align="right">2</td><td align="right">$4.95</td>
            <td>
                    <a href="/Projects/EditLocation.aspx?proj=1&fanloc=2" ><img src="/icons/edit.png" height="20" width="20"/></a>
                    <a href="/Projects/FanSelection.aspx?proj=1&fanloc=2" ><img src="/icons/fan.png" height="20" width="20"/></a>
            </td>
            
        </tr>--%>
         <%= getProjectFans() %>
        <tr>
            <td colspan="7" align="right">
                <div class="buttons"><a href="/Projects/ProjectsDashboard.aspx">Finished</a></div>
            </td>
        </tr>
    </table>
  </div>
</asp:Content>
