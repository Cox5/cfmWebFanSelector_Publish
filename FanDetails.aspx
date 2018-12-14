<%@ Page Title="FanDetails" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FanDetails.aspx.cs" Inherits="CFM_Web.FanDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <h1>Fan Details</h1>
  <table>
    <tr>
      <td>Part Number</td>
      <td>
        <asp:Literal ID="litPartNumber" runat="server" /></td>
    </tr>
    <tr>
      <td>Motor Phase</td>
      <td>
        <asp:Literal ID="litMotorPhase" runat="server" /></td>
    </tr>
    <tr>
      <td>Motor Pole</td>
      <td>
        <asp:Literal ID="litMotorPole" runat="server" /></td>
    </tr>
    <tr>
      <td>Fan Size</td>
      <td>
        <asp:Literal ID="litFanSize" runat="server" /></td>
    </tr>
    <tr>
      <td>Image</td>
      <td>
        <asp:Literal ID="litImage" runat="server" /></td>
    </tr>
    <tr>
      <td>Dimensions</td>
      <td>
        <asp:Literal ID="litDimensions" runat="server" /></td>
    </tr>
    <tr>
      <td>Mass</td>
      <td>
        <asp:Literal ID="litMass" runat="server" /></td>
    </tr>
  </table>
  <asp:Button ID="btnEdit" Text="Edit" runat="server" OnClick="btnEdit_Click" />
  <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" />
</asp:Content>
