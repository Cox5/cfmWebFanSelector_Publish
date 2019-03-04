<%@ Page Title="CFM Airsystems Index" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CFM_Web.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
        <h2 class="welcome-text center-text">Welcome to <span class="bolder">CFM Airsystems Fan Selection</span> Tool!</h2>
        <form id="formLogin" runat="server">
        

            <div class="form-box">

                <div class="center-text">
                    <h2 class="heading-secondary mb-medium"><i class="fas fa-user fa-user-title"></i> Member Login</h2>
                </div>

                <div class="f-group">
                    <div class="f-ctrl">
                        <asp:TextBox ID="txtEmailAddress" placeholder="Email Address" runat="server"></asp:TextBox>
                    </div>
                   
                    
                </div>
                
                <div class="f-group">
                    <div class="f-ctrl">
                        <asp:TextBox ID="txtPassword" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                    
                </div>

                <asp:RegularExpressionValidator class="mt-small" ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailAddress" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>


                <div class="f-group">
                    <div class="f-ctrl cene">
                        
                        <asp:Label ID="lblLoginMessage" runat="server" class="bold error-msg" />
                    </div>
                </div>

                <div class="f-group">
                    <div class="f-ctrl center-text">
                        <asp:Button class="button-main primary-btn login-btn" text="Login" runat="server" OnClick="btnLogin_Click">
                            
                        </asp:Button>
                    </div>       
                </div>


              

                <div class="f-group">
                    <div class="f-ctrl center-text">
                        
                    <a href="ForgotPassword.aspx">Forgot password?</a>
                    </div>       
                </div>
    

            </div>
            
            <div class="registration-info-box responsive-width">
                <p>To request access to the CFM Fan Selector you must first  <a href="/Users/Signup.aspx">register</a>.</p>
                <p>Registration is free, but subject to approval.</p>
                <div class="center-text">
                    <asp:Button ID="btnRegister" class="button-main secondary-btn" Text="Register" runat="server" PostBackUrl="~/Users/Signup.aspx"/>

                </div>
            </div>
        </form>
    </div>
</asp:Content>
