<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="CFM_Web.Users.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <table>
    <tr>
      <td>Firstname</td>
      <td><asp:TextBox ID="txtFirstname" runat="server" /></td>
    </tr>
    <tr>
      <td>Lastname</td>
      <td><asp:TextBox ID="txtLastname" runat="server" /></td>
    </tr>
    <tr>
      <td>Username</td>
      <td><asp:TextBox ID="txtUsername" runat="server" /></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><asp:TextBox ID="txtEmail" runat="server" /></td>
    </tr>
    <tr>
      <td>Company</td>
      <td><asp:TextBox ID="txtCompany" runat="server" /></td>
    </tr>
    <tr>
      <td>Admin</td>
      <td><asp:CheckBox ID="chkAdmin" runat="server" /></td>
    </tr>
  </table>
  <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
  <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
</asp:Content>
