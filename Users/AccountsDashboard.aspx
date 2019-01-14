<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="AccountsDashboard.aspx.cs" Inherits="CFM_Web.UserAccountsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-wrapper">

    <table style="min-width:50%">
        <tr><td colspan="2" align="left" class="tabletitle">User Accounts</td></tr>
        <tr><td width="35%">Name</td><td width="35%">Company</td><td width="20%">User class</td><td></td></tr>

        <%= getUsers() %>
    </table>
  </div>
</asp:Content>
