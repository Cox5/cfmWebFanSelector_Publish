<%@ Page Title="FanDetails" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CFM_Web._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <p>
    <asp:Button ID="btnSelect" Text="Fan Selection" runat="server" OnClick="btnSelect_Click" /></p>
  <p>
    <asp:Button ID="btnSchedule" Text="Saved Schedules" runat="server" OnClick="btnSchedule_Click" /></p>
  <p>
    <asp:Button ID="btnFans" Text="Browse Fans" runat="server" OnClick="btnFans_Click" /></p>
</asp:Content>
