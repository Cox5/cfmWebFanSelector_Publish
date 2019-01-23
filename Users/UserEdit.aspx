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
      <td>Company</td>
      <td><asp:TextBox ID="txtCompany_Name" runat="server" /></td>
    </tr>
    <tr>
      <td>Mobile</td>
      <td><asp:TextBox ID="txtUser_Mobile" runat="server" /></td>
    </tr>
    <tr>
        <td>Email address</td>
        <td><asp:TextBox ID="txtEmail" runat="server"/></td>
    </tr>
    <tr>
      <td>User class</td>
      <td><asp:DropDownList runat="server" ID="ddlUserClass">
          <asp:ListItem Text="Administrator" Value="0"></asp:ListItem>
          <asp:ListItem Text="Sales" Value="1"></asp:ListItem>
          <asp:ListItem Text="Engineer" Value="2"></asp:ListItem>
          <asp:ListItem Text="Unapproved" Value="3"></asp:ListItem>
          <asp:ListItem Text="Deleted" Value="4"></asp:ListItem>
          <asp:ListItem Text="" Value="5"></asp:ListItem>
      </asp:DropDownList></td>
      <%--<td><asp:TextBox ID="txtUser_Class" runat="server" /></td>--%>
    </tr>
    <tr>
      <td>Admin</td>
      <td><asp:CheckBox ID="chkAdmin" runat="server" Enabled="False"  /></td>
    </tr>
  </table>
  <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
  <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" /><br />
  <asp:Label ID="lblEditUserMsg" runat="server" />
</asp:Content>
