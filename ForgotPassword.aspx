<%@ Page Title="" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CFM_Web.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
    <h2>Password Reset</h2>
    <P>Enter your email address and a new password will be emailed to you.</P>
    <form id="formReset" runat="server">
        <div class="homepagefl" style="border: 1px solid white; background-color:white">
         
            <table>
                <tr><td>Email address:</td><td><asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox></td></tr>           
                <tr><td><asp:Button ID="btnLogin" Text="Reset Password" runat="server"/></td></tr>
            </table>
        </div>
        <div class="homepagefl" style="border: 1px solid black; background-color:antiquewhite">
            <p>To request access to the CFM Fan Selector you must first register.</p>
            <p>Registration is free, but subject to approval.</p>
            <asp:Button ID="btnRegister" Text="Register" runat="server"/>
        </div>
        <div class="homepagefl" style="display:block; color: #00dd00; font-weight: bold">
                   If your email address matches one already registered, a new password will be sent to you.
        </div>
    </form>
    </div>
</asp:Content>