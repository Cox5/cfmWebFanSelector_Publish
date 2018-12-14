<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CFM_Web.Users.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <asp:Label ID="lblMessage" runat="server" />
  <table>
    <tr>
      <td>Firstname</td>
      <td>
        <asp:TextBox ID="txtFirstname" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Lastname</td>
      <td>
        <asp:TextBox ID="txtLastname" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Email</td>
      <td>
        <asp:TextBox ID="txtEmail" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Company</td>
      <td>
        <asp:TextBox ID="txtCompany" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Username</td>
      <td>
        <asp:TextBox ID="txtUsername" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Password</td>
      <td>
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
      </td>
    </tr>
    <tr>
      <td>Confirm Password</td>
      <td>
        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" />
      </td>
    </tr>
  </table>
  <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
