<%@ Page Title="Fan List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FanList.aspx.cs" Inherits="CFM_Web.FanList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <h1>Fans</h1>
  <table>
    <tr>
      <th>Part Number</th>
      <th>Motor Pahse</th>
      <th>Motor Pole</th>
      <th>Fan Size</th>
      <th>Image</th>
      <th>Dimensions</th>
      <th>Mass</th>
      <th>Actions</th>
    </tr>
    <%= getFans() %>
  </table>
  <asp:Button ID="btnCreate" Text="Create" runat="server" />
</asp:Content>
