<%@ Page Title="Accounts Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="AccountsDashboard.aspx.cs" Inherits="CFM_Web.UserAccountsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-wrapper">

    <table style="min-width:50%">
        <tr><td colspan="2" align="left" class="tabletitle">User Accounts</td></tr>
        <tr><td width="35%">Name</td><td width="35%">Company</td><td width="20%">User class</td><td></td></tr>

        <%= getUsers() %>

        <tr><td colspan="4" align="right"><div class="buttons"><a href="/Dashboard.aspx">Go Back</a></div></td></tr>
    </table>
  </div>
</asp:Content>
