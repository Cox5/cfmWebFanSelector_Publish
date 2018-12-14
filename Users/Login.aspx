<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CFM_Web.Users.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Login</title>
  <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <h1>Login</h1>
    <asp:Label ID="lblMessage" runat="server" />
    <table>
      <tr>
        <td>Username</td>
        <td>
          <asp:TextBox ID="txtUsername" runat="server" /></td>
      </tr>
      <tr>
        <td>Password</td>
        <td>
          <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" /></td>
      </tr>
    </table>
    <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" />
    <p>
      Don't have an account? You can signup for a free account <asp:HyperLink ID="lnkSignup" Text="Here" runat="server" />
    </p>
  </div>
  </form>
</body>
</html>
