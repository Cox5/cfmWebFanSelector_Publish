<%@ Page Title="" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="SignupComplete.aspx.cs" Inherits="CFM_Web.Users.SignupComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">
  <p class="paragraph-large">Hi <span class="bold"><asp:Literal ID="litUsername" Text="new user" runat="server"/></span>!</p>
  <p class="paragraph-large">Thank you for registering.<br />
      We have sent an email to you with your registration details.</p>
          <p>Please check your inbox for the registration email, which contains your login password.</p>

  <p><a href="http://www.cfmairsystems.com.au/"><i class="fas fa-angle-right"></i>Go to CFM Airsystems Website</a></p>
          <p><a href="http://www.cfmairsystems.com.au/"><i class="fas fa-angle-right"></i>Return to Login page.</a></p>
          </div>
</asp:Content>
