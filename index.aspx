<%@ Page Title="" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CFM_Web.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
    <h2>Welcome to CFM Airsystems Fan Selection Tool</h2>
    <form id="formLogin" runat="server">
        <div class="homepagefl">
            <asp:Label ID="lblLoginMessage" runat="server" />
            <%--<p id="pLoginError" style="display:block; color: #dd0000;"></p>--%>
            <table>
                <tr><td>Email address:</td><td><asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox></td></tr>
                 <tr><td>Password:</td><td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox></td></tr>
                <tr><td><a href="ForgotPassword.aspx">Forgot password?</a></td></tr>
                <tr><td><asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click"/></td></tr>
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
