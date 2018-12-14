<%@ Page Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FanEdit.aspx.cs" Inherits="CFM_Web.FanEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <h1>Fan Details</h1>
  <table>
    <tr>
      <td>Part Number</td>
      <td><asp:TextBox ID="txtPartNumber" runat="server" /></td>
    </tr>
    <tr>
      <td>Motor Phase</td>
      <td><asp:TextBox ID="txtMotorPhase" runat="server" /></td>
    </tr>
    <tr>
      <td>Motor Pole</td>
      <td><asp:TextBox ID="txtMotorPole" runat="server" /></td>
    </tr>
    <tr>
      <td>Fan Size</td>
      <td><asp:TextBox ID="txtFanSize" runat="server" /></td>
    </tr>
    <tr>
      <td>Image</td>
      <td><asp:TextBox ID="txtImage" runat="server" /></td>
    </tr>
    <tr>
      <td>Dimensions</td>
      <td><asp:TextBox ID="txtDimensions" runat="server" /></td>
    </tr>
    <tr>
      <td>Mass</td>
      <td><asp:TextBox ID="txtMass" runat="server" /></td>
    </tr>
  </table>
  <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
  <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
</asp:Content>