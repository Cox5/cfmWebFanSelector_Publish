<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="RegisterCompany.aspx.cs" Inherits="CFM_Web.Company.RegisterCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">

        <h3><i class="far fa-building"></i>Your company details</h3>
        <hr />
        <table width="50%">
            <tr>
                <td>Name</td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Address 1</td>
                <td>
                    <asp:TextBox ID="txtCompanyAddr1" runat="server" />
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
                    <asp:TextBox ID="txtCompanySubCity" runat="server" />
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
                    <asp:TextBox ID="txtCompanyCountry" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Telephone</td>
                <td>
                    <asp:TextBox ID="txtCompanyTelephone" runat="server" />
                </td>

            </tr>

            <tr>
                <td>Website</td>
                <td>
                    <asp:TextBox ID="txtCompanyWebsite" runat="server" Placeholder="example.com" />
                </td>
            </tr>

        </table>
        <asp:RegularExpressionValidator ID="regUrl" runat="server" ControlToValidate="txtCompanyWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$" ErrorMessage="Enter a valid URL" ForeColor="Red" />


    </div>

    <div class="center-text mb-medium">
        <asp:Label ID="lblMessage" runat="server" /><br />
        <asp:Button class="button-main bigger primary-btn mt-big" ID="btnSubmit" Text="Register" runat="server" OnClick="btnSubmit_Click" />
        <asp:Button class="button-main bigger primary-btn mt-big" ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" />

    </div>

</asp:Content>
