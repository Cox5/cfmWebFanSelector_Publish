<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CFM_Web.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Welcome <asp:Label ID="lbl_logged_user" runat="server"></asp:Label></h1>
    <asp:Button ID="btnLogout" Text="Logout" runat="server" OnClick="btnLogout_Click"/>
    <div class="content-wrapper">
    <table class="dashboard">
        <tr><td><a href="/Projects/ProjectsDashboard.aspx">Projects</a></td></tr>
        <tr><td><a href="/Users/AccountsDashboard.aspx">User accounts</a></td></tr>
        <tr><td><a href="/projects">Company info</a></td></tr>
        <tr><td><a href="/projects">Quotations</a></td></tr>
        <tr><td><a href="/FanSelection.aspx">Browse fans</a></td></tr>
    </table>
        </div>
</asp:Content>
