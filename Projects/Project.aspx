<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CFM_Web.Projects.CreateProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="content-wrapper">
           <div class="leftcolumn">
            <h1 id="h1" runat="server"></h1>
            <h3>Project details</h3>
               <p>Enter the details of your new construction project</p>
            <asp:Label ID="lblMessage" runat="server" />
            <table >
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
                 <!-- Eng Comp, Sales Consultant, Quote Number, Status and PriceAdj should only appear if user is admin or superadmin -->
                <tr id="trEngComp" runat="server" >
                    <td>Engineering Company</td>
                    <td>
                        <asp:TextBox ID="txtEngineeringCompany" runat="server" />
                    </td>
                </tr>
               
                <tr id="trSalesConsultant" runat="server" >
                    <td>Sales Consultant</td>
                    <td>
                        <asp:TextBox ID="txtSalesConsultant" runat="server" />
                    </td>
                </tr>
                <tr id="trQuoteNumber" runat="server">
                    <td>Quote Number</td>
                    <td>
                        <asp:TextBox ID="txtQuoteNo" runat="server" />
                    </td>
                </tr>
                <tr id="trStatus" runat="server">
                    <td>Status</td>
                    <td>
                        <asp:TextBox ID="txtStatus" runat="server" />
                    </td>
                </tr>
                <tr id="trPriceAdj" runat="server">
                    <td>PriceAdjustment</td>
                    <td>
                        <asp:TextBox ID="txtPriceAdj" runat="server" />
                    </td>
                </tr>
 
                
                </table>

               <asp:Button ID="btnSubmit" Text="Create Project" runat="server" OnClick="btnSubmit_Click" />

               </div>


</asp:Content>
