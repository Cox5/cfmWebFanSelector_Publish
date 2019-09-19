<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="CompanyEdit.aspx.cs" Inherits="CFM_Web.Company.CompanyEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        td.optional {color: #888888;}
        td.required {color: #000000;}
        td.optional input[type="text"], td.optional select {
            color: #888888;
            border: 1px solid #eee;
        }
        td.required input[type="text"] {
            color: #000000;
            border: 1px solid #555;
        }
    </style>
    <div class="content-wrapper">

        <h3><i class="far fa-building"></i>User's company details</h3>
        <hr />
        <table width="50%">
            <tr>
                <td class="required">Name</td>
                <td class="required">
                    <asp:TextBox ID="txtCompany" runat="server" required="true" />
                </td>
            </tr>
            <tr>
                <td class="optional">Address 1</td>
                <td class="optional">
                    <asp:TextBox ID="txtCompanyAddr1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="optional">Address 2</td>
                <td class="optional">
                    <asp:TextBox ID="txtCompanyAddr2" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="optional">Suburb/City</td>
                <td class="optional">
                    <asp:TextBox ID="txtCompanySubCity" runat="server"  />
                </td>
            </tr>
            <tr>
                <td class="required">State</td>
                <td>
                    <asp:TextBox ID="txtCompanyState" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="optional">Postcode</td>
                <td class="optional">
                    <asp:TextBox ID="txtCompanyPostcode" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="required">Country</td>
                <td>
                    <asp:TextBox ID="txtCompanyCountry" runat="server" required="true" />
                </td>
            </tr>
            <tr>
                <td class="optional">Telephone</td>
                <td class="optional">
                    <asp:TextBox ID="txtCompanyTelephone" runat="server"  />
                </td>

            </tr>

            <tr>
                <td class="optional">Website</td>
                <td class="optional">
                    <asp:TextBox ID="txtCompanyWebsite" runat="server" Placeholder="example.com" />
                </td>
            </tr>

        </table>
        <asp:RegularExpressionValidator ID="regUrl" runat="server" ControlToValidate="txtCompanyWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$" ErrorMessage="Enter a valid URL" ForeColor="Red" />


    </div>

        <div class="center-text mb-medium">
        <asp:Label ID="lblMessage" runat="server" /><br />
        <asp:Button class="button-main bigger primary-btn mt-big" ID="btnSubmit" Text="Save" runat="server" OnClick="btnSubmit_Click" />
        <asp:Button class="button-main bigger primary-btn mt-big" ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" />

    </div>


</asp:Content>
