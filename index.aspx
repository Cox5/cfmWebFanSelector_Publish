﻿<%@ Page Title="CFM Airsystems Index" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CFM_Web.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
    <h2>Welcome to CFM Airsystems Fan Selection Tool</h2>
    <form id="formLogin" runat="server">
        <div class="homepagefl">
            <asp:Label ID="lblLoginMessage" runat="server" />
            <table>
                <tr><td>Email address:</td><td><asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox></td></tr>
                 <tr><td>Password:</td><td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox></td></tr>
                <tr><td><a href="ForgotPassword.aspx">Forgot password?</a></td></tr>
                <tr><td><asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click"/></td></tr>
                <tr>
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailAddress" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                </tr>
            </table>
        </div>
        <div class="homepagefl" style="border: 1px solid black; background-color:antiquewhite">
            <p>To request access to the CFM Fan Selector you must first register.</p>
            <p>Registration is free, but subject to approval.</p>
            <asp:Button ID="btnRegister" Text="Register" runat="server" PostBackUrl="~/Users/Signup.aspx"/>
        </div>
    </form>
    </div>
</asp:Content>
