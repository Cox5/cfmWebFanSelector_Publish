﻿<%@ Page Title="Registration" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CFM_Web.Users.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <form id="formSignUp" runat="server">
    <div class="content-wrapper">
        <div class="leftcolumn">
            <h1>Fan Selector User Registration</h1>
            <h3>Your details</h3>
            <table width="100%">
                <tr>
                    <td>First name</td>
                    <td>
                        <asp:TextBox ID="txtFirstname" runat="server" required="true" />
                    </td>
                </tr>
                <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtFirstname" ValidationExpression="^[a-zA-Z'.\s]{1,25}" ErrorMessage="Enter a valid name" ForeColor="Red" /> 
                <tr>
                    <td>Last name</td>
                    <td>
                        <asp:TextBox ID="txtLastname" runat="server" required="true" />
                    </td>
                </tr>
                <asp:RegularExpressionValidator ID="regLastName" runat="server" ControlToValidate="txtLastname" ValidationExpression="^[a-zA-Z'.\s]{1,30}" ErrorMessage="Enter a valid last name" ForeColor="Red" /> 
                <tr>
                    <td>Email address</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" required="true" />
                    </td>
                </tr>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                <tr>
                    <td>Confirm email address</td>
                    <td>
                        <asp:TextBox ID="txtEmailConfirm" runat="server" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>
                        <asp:TextBox ID="txtUserPhone" runat="server"  required="true"/>
                    </td>
                </tr>
                <%--<asp:RegularExpressionValidator ID="regexPhoneValid" runat="server" ErrorMessage="Enter valid Phone number" ControlToValidate="txtUserPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ForeColor="Red" ></asp:RegularExpressionValidator>--%>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CompareValidator runat="server" ID="Comp1" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal" Type="String" ErrorMessage="Password mismatch" Font-Size="11px" ForeColor="Red"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:CompareValidator runat="server" ID="Comp2" ControlToValidate="txtEmailConfirm" ControlToCompare="txtEmail" Operator="Equal" Type="String" ErrorMessage="Email mismatch" Font-Size="11px" ForeColor="Red"></asp:CompareValidator>
                    </td>
                   
                </tr>

            </table>
        </div>
        <div class="rightcolumn">
            <h1>&nbsp;</h1>
            <h3>Your company details</h3>

            <table width="100%">
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Address 1</td>
                    <td>
                        <asp:TextBox ID="txtCompanyAddr1" runat="server" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Address 2</td>
                    <td>
                        <asp:TextBox ID="txtCompanyAddr2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Suburb/City</td>
                    <td>
                        <asp:TextBox ID="txtCompanySubCity" runat="server" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <asp:TextBox ID="txtCompanyState" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Postcode</td>
                    <td>
                        <asp:TextBox ID="txtCompanyPostcode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <asp:TextBox ID="txtCompanyCountry" runat="server" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Telephone</td>
                    <td>
                        <asp:TextBox ID="txtCompanyTelephone" runat="server" required="true" />
                    </td>
                
                </tr>

                <tr>
                    <td>Website</td>
                    <td>
                        <asp:TextBox ID="txtCompanyWebsite" runat="server" required="true" Placeholder="example.com" />
                    </td>
                </tr>
                <asp:RegularExpressionValidator ID="regUrl" runat="server" ControlToValidate="txtCompanyWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$" ErrorMessage="Enter a valid URL" ForeColor="Red" /> 
            </table>
            <asp:Button ID="btnSubmit" Text="Register" runat="server" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </div>
 </form>

</asp:Content>
