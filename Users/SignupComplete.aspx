<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="SignupComplete.aspx.cs" Inherits="CFM_Web.Users.SignupComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  Hi <asp:Literal ID="litUsername" Text="new user" runat="server"/>
  <p>Thank you for registering.<br />We have sent an email to you with your registration details</p>
  <p>We will confirm your registration as soon as it is approved.</p>
</asp:Content>
