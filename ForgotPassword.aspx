<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CFM_Web.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
    
    <form id="formReset" runat="server">
      
            <div class="form-box">
                    <div class="center-text">
                        <h2 class="heading-secondary mb-medium">Password Reset</h2>
                    </div>
                    <p>Enter your email address and a new password will be emailed to you.</p>
    
                <asp:TextBox ID="txtEmailAddress" placeholder="Your Email Address" runat="server"></asp:TextBox>    

                <asp:RequiredFieldValidator class="mt-small" ID="requiredEmailValidator" runat="server" ErrorMessage="Email field is empty" ForeColor="Red" ControlToValidate="txtEmailAddress"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator class="mt-small" ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailAddress" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="lblResetMsg" runat="server"></asp:Label>

                <asp:Button ID="btnResetPassword" class="button-main bigger primary-btn login-btn" Text="Reset Password" runat="server" OnClick="btnResetPassword_Click"/>

                <div class="center-text">
                    <a href="index.aspx"> <i class="fas fa-angle-left"></i> Login</a>
                </div>

            </div>


                
            <div class="registration-info-box">
                    <p>To request access to the CFM Fan Selector you must first  <a href="/Users/Signup.aspx">register</a>.</p>
                    <p>Registration is free, but subject to approval.</p>
                    <div class="center-text">
                        <asp:Button ID="btnRegister" class="button-main biiger secondary-btn" Text="Register" runat="server" PostBackUrl="~/Users/Signup.aspx"/>
    
                    </div>
                </div>
        <%--<div class="homepagefl" style="display:block; color: #00dd00; font-weight: bold">
                   If your email address matches one already registered, a new password will be sent to you.
        </div>--%>
    </form>
    </div>
</asp:Content>