<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="CFM_Web.Users.RegisterUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <%--<form id="formSignUp" runat="server">--%>
        <div class="content-wrapper">

            <div class="center-text">
                <h1 class="heading-primary mb-medium">New User Registration</h1>
            </div>
            <div class="leftcolumn">
                <h3><i class="fas fa-user-alt"></i>User details</h3>
                <hr />
                <table width="100%">
                    <tr>
                        <td>First name</td>
                        <td>
                            <asp:TextBox ID="txtFirstname" runat="server" required="true" />
                        </td>
                    </tr>


                    <tr>
                        <td>Last name</td>
                        <td>
                            <asp:TextBox ID="txtLastname" runat="server" required="true" />
                        </td>
                    </tr>

                    <tr>
                        <td>Email address</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" required="true" />
                        </td>
                    </tr>

                    <tr>
                        <td>Confirm email address</td>
                        <td>
                            <asp:TextBox ID="txtEmailConfirm" runat="server" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>Telephone</td>
                        <td>
                            <asp:TextBox ID="txtUserPhone" runat="server" required="true" />
                        </td>
                    </tr>

                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td>
                            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" required="true" />
                        </td>
                    </tr>
                        <tr>
                      <td>User class</td>
                      <td><asp:DropDownList runat="server" ID="ddlUserClass">
                          <asp:ListItem Text="Unapproved" Value="4"></asp:ListItem>
                          <asp:ListItem Text="User" Value="3"></asp:ListItem>
                          <asp:ListItem Text="Sales" Value="2"></asp:ListItem>
                          <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                      </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>

                    </tr>

                </table>
                <p class="validation-msg">
                    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtFirstname" ValidationExpression="^[a-zA-Z'.\s]{1,25}" ErrorMessage="Enter a valid name" ForeColor="Red" />
                    <asp:RegularExpressionValidator ID="regLastName" runat="server" ControlToValidate="txtLastname" ValidationExpression="^[a-zA-Z'.\s]{1,30}" ErrorMessage="Enter a valid last name" ForeColor="Red" />
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:CompareValidator runat="server" ID="Comp2" ControlToValidate="txtEmailConfirm" ControlToCompare="txtEmail" Operator="Equal" Type="String" ErrorMessage="Email mismatch" ForeColor="Red"></asp:CompareValidator>
                    <%--<asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="txtUserPhone" ValidationExpression="" ErrorMessage="Enter a valid phone number" ForeColor="Red" />--%>
                    <asp:CompareValidator runat="server" ID="Comp1" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal" Type="String" ErrorMessage="Password mismatch" ForeColor="Red"></asp:CompareValidator>
                </p>
            </div>
            <div class="rightcolumn">
                <h3><i class="far fa-building"></i>User's company details</h3>
                <hr />
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

                </table>
                <asp:RegularExpressionValidator ID="regUrl" runat="server" ControlToValidate="txtCompanyWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$" ErrorMessage="Enter a valid URL" ForeColor="Red" />
            </div>

            <div class="center-text mb-medium">
                <div class="success-lbl">
                    <asp:Label ID="lblMessage" runat="server" />
                </div>

                <asp:Button class="button-main bigger primary-btn mt-big" ID="btnSubmit" Text="Register" runat="server" OnClick="btnSubmit_Click" />
                <a href="AccountsDashboard.aspx" id="dashHref" runat="server" class="button-main bigger primary-btn mt-big">Cancel</a>
                <a href="AccountsDashboard.aspx" id="dashFinishedHref" runat="server" class="button-main bigger primary-btn mt-big" visible="false">Finished</a>
                <%--<asp:Button class="button-main bigger primary-btn mt-big" ID="btnFinished" Text="Cancel" runat="server" CausesValidation="false" OnClick="btnFinished_Click" />--%>

            </div>

        </div>
    <%--</form>--%>

</asp:Content>
