<%@ Page Title="" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="SignupComplete.aspx.cs" Inherits="CFM_Web.Users.SignupComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">
  <p class="paragraph-large">Hi <span class="bold"><asp:Literal ID="litUsername" Text="new user" runat="server"/></span>!</p>
  <p class="paragraph-large">Thank you for registering.<br />
      We have sent an email to you with your registration details</p>

  <p class="paragraph-large">We will confirm your registration as soon as it is approved.</p>
  <p><a href="/index.aspx"><i class="fas fa-angle-left"></i> Return to Index</a></p>
          </div>
</asp:Content>
