﻿<%@ Page Title="User Edit" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="CFM_Web.Users.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        <div class="table-controls mb-medium">
            <h1 class="table-title">User Edit</h1>
        </div>

  <table class="table">
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
        <td>Password</td>
        <td>
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Placeholder="leave blank or type new password" />
        </td>
    </tr>
    <tr>
        <td>Confirm Password</td>
        <td>
            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" Placeholder="leave blank or type new password"/>
        </td>
        <td>
            <asp:CompareValidator runat="server" ID="Comp1" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal" Type="String" ErrorMessage="Password mismatch" Font-Size="11px" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
      <td>User class</td>
      <td><asp:DropDownList runat="server" ID="ddlUserClass">
          <asp:ListItem Text="Superadmin" Value="0"></asp:ListItem>
          <asp:ListItem Text="Administrator" Value="1"></asp:ListItem>
          <asp:ListItem Text="Sales" Value="2"></asp:ListItem>
          <asp:ListItem Text="User" Value="3"></asp:ListItem>
          <asp:ListItem Text="Unapproved" Value="4"></asp:ListItem>
          <asp:ListItem Text="Deleted" Value="5"></asp:ListItem>
      </asp:DropDownList></td>
      <%--<td><asp:TextBox ID="txtUser_Class" runat="server" /></td>--%>
    </tr>
    <tr>
      <td>Is company owner</td>
      <td><asp:CheckBox ID="chkCompanyOwner" runat="server" /></td>
    </tr>
  </table>

  <div class="mt-medium">
    <asp:Button ID="btnSave" class="button-main primary-btn" Text="Submit" runat="server" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" class="button-main quarternary-btn" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
  </div>

  
  
  <br />
  <asp:Label ID="lblEditUserMsg" runat="server" />
  <asp:Label ID="lblRedirectMsg" runat="server" Visible="false"><br /><a href="AccountsDashboard.aspx">Return to Accounts Dashboard page</a></asp:Label>
  </div>

</asp:Content>
