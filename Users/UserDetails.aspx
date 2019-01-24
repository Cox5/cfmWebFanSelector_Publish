<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="CFM_Web.Users.UserDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">
  <table>
    <tr>
      <td>First name</td>
      <td><asp:Literal ID="litFirstname" runat="server"/></td>
    </tr>
    <tr>
      <td>Last name</td>
      <td><asp:Literal ID="litLastanme" runat="server"/></td>
    </tr>
    <tr>
      <td>Username</td>
      <td><asp:Literal ID="litUsername" runat="server"/></td>
    </tr>
    <tr>
      <td>Email address</td>
      <td><asp:Literal ID="litEmail" runat="server"/></td>
    </tr>
    <tr>
      <td>Company</td>
      <td><asp:Literal ID="litCompany" runat="server"/></td>
    </tr>
    <tr>
      <td>Admin</td>
      <td><asp:Literal ID="litAdmin" runat="server"/></td>
    </tr>
  </table>
  <% if(canWrite())
     { %>
  <asp:Button ID="btnEdit" Text="Edit" runat="server" OnClick="btnEdit_Click" />
  <% }
     if(canDelete())
     { %>
  <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click"
     OnClientClick="confirm('Are you sure you want to delete this user?')"/>
  <% }
     if(canWrite())
     { %>
  <asp:Button ID="btnPassword" Text="Change Password" runat="server" OnClick="btnPassword_Click" />
  <% } %>
          </div>
</asp:Content>
