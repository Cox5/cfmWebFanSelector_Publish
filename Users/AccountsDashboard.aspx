﻿<%@ Page Title="Accounts Dashboard" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="AccountsDashboard.aspx.cs" Inherits="CFM_Web.UserAccountsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-wrapper">
       
        <div class="table-controls mb-medium">
          <h1 class="table-title">User Accounts</h1>
        </div>

    <table class="table project">
        <thead>
          <tr><td width="35%">Name</td><td width="35%">Company</td><td width="20%">User class</td><td></td></tr>
        </thead>

        <%= getUsers() %>
    </table>

    <div class="right-controls mt-medium">
      <a href="/Dashboard.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-left"></i> Go Back</a>
    </div>
    
  </div>
</asp:Content>
