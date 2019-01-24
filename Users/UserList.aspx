<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="CFM_Web.Users.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">
  <h1>Users</h1>
  <% if(canCreate())
     { %>
  <asp:Button ID="btnCreate" Text="Create" runat="server" OnClick="btnCreate_Click" />
  <% } %>
  <table id="tblUserList" runat="server">
    <tr>
      <th>Username</th>
      <th>Firstname</th>
      <th>Lastname</th>
      <th>Company</th>
      <th>Actions</th>
    </tr>
  </table>
  <% if(canCreate())
     { %>
  <asp:Button ID="btnCreate2" Text="Create" runat="server" OnClick="btnCreate_Click" />
  <% } %>
          </div>
</asp:Content>
