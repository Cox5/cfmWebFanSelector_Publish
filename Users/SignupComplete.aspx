<%@ Page Title="" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="SignupComplete.aspx.cs" Inherits="CFM_Web.Users.SignupComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">
  <p class="paragraph-large">Hi <span class="bold"><asp:Literal ID="litUsername" Text="new user" runat="server"/></span>!</p>
  <p class="paragraph-large">Thank you for registering.<br />
      CFM staff will review your registration application as soon as possible.

          </div>
</asp:Content>
