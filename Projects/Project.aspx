<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CFM_Web.Projects.CreateProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="content-wrapper">
           <div class="leftcolumn">
            <h1 id="h1" runat="server"></h1>
            <h3>Project details</h3>
            <asp:Label ID="lblMessage" runat="server" />
            <table width="100%">
                <tr>
                    <td>Project Name</td>
                    <td>
                        <asp:TextBox ID="txtProjectname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address 1</td>
                    <td>
                        <asp:TextBox ID="txtAddress1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Address 2</td>
                    <td>
                        <asp:TextBox ID="txtAddress2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Postcode</td>
                    <td>
                        <asp:TextBox ID="txtPostcode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <asp:TextBox ID="txtCountry" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Engineering Company</td>
                    <td>
                        <asp:TextBox ID="txtEngineeringCompany" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Sales Consultant</td>
                    <td>
                        <asp:TextBox ID="txtSalesConsultant" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Quote Number</td>
                    <td>
                        <asp:TextBox ID="txtQuoteNo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" />
                    </td>
                </tr>
                
                </table>

               <asp:Button ID="btnSubmit" Text="Create Project" runat="server" OnClick="btnSubmit_Click" />


</asp:Content>
