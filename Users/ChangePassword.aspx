<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CFM_Web.Users.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <h1>Change Password</h1>
  <asp:Label ID="lblMessage" runat="server" />
  <table>
    <tr id="rowOldPassword" runat="server">
      <td>Old Password:</td>
      <td>
        <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" />
      </td>
    </tr>
    <tr>
      <td>New Password:</td>
      <td>
        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Confirm Password:</td>
      <td>
        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" />
      </td>
    </tr>
  </table>
  <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
