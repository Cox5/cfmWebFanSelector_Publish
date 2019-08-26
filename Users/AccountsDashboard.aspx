<%@ Page Title="Accounts Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="AccountsDashboard.aspx.cs" Inherits="CFM_Web.UserAccountsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-wrapper">
       
        <div class="table-controls mb-medium">
          <h1 class="table-title">User Accounts</h1>
        </div>

         <a href="/Company/CompanyDetails.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-up"></i> Company Accounts</a>

         <div class="table-controls mt-solid mb-solid">
             <%--<asp:Button CssClass="button-main primary-btn" ID="btnAddUser" runat="server" Text="Add New User" OnClick="btnAddUser_Click" />--%>
             <a href="RegisterUser.aspx" id="addUserHref" class="button-main primary-btn" runat="server"><i class="fas fa-plus-circle"></i> Add New User</a>
         </div>

    <asp:HiddenField ID="howIsSortedName" runat="server" />
    <asp:HiddenField ID="howIsSortedClass" runat="server" />
    <asp:HiddenField ID="howIsSortedCompany" runat="server" />

    <table class="table project">
        <thead>
          <tr>
              <td width="35%">Name <asp:linkbutton ID="sortingNameButton" runat="server" onclick="SortName_Click" /></td>
              <td width="35%">Company <asp:linkbutton ID="sortingCompanyButton" runat="server" onclick="SortCompany_Click" /></td>
              <td width="20%">User class  <asp:linkbutton ID="sortingClassButton" runat="server" onclick="SortClass_Click" /></td>
              <td></td>
          </tr>
        </thead>

         <% foreach (var u in users) { %>
             <tr>
                 <td><%= u.FirstName + " " + u.LastName %></td>
                 <td><%= u.CompanyName %></td>
                 <td><%= u.UserClassString %></td>
                 <td class="icons"><%= getControls(u.ID) %></td>


             </tr>
         <% } %>
    </table>

    <div class="right-controls mt-medium">
      <a href="/Dashboard.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-left"></i> Go Back</a>
    </div>
    
  </div>
</asp:Content>
