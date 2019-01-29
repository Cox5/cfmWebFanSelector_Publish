<%@ Page Title="Not Authorized" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="NotAuthorized.aspx.cs" Inherits="CFM_Web.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="content-wrapper" style="text-align:center">
  
            <h2 >You are not authorized to access the page you have requested.</h2>
            <a href="Dashboard.aspx">Return to the dashboard.</a>
        

   </div>
</asp:Content>
