<%@ Page Title="Create project" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CFM_Web.Projects.CreateProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
        <div class="content-wrapper">
            <h1 id="h1" runat="server"></h1>
            <h3>Project details</h3>
               <h4><asp:Label ID="lblMessage" runat="server" /></h4>
           <div class="leftcolumn">
            
            <table >
                <tr>
                    <td>Project Name</td>
                    <td>
                        <asp:TextBox ID="txtProjectname" runat="server" />
                    </td>
                </tr>
                <%--<asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtProjectname" MinimumValue="2" MaximumValue="35" ErrorMessage="Enter a valid name" ForeColor="Red" /> --%>
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
                    <td>Suburb/City</td>
                    <td>
                        <asp:TextBox ID="txtSuburb" runat="server" />
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
                </table>
               </div>
            <div class="rightcolumn" id="rightCol" runat="server">
                <table>
                 <!-- Eng Comp, Sales Consultant, Quote Number, Status and PriceAdj should only appear if user is sales, admin or superadmin -->
                <tr id="trEngComp" runat="server" >
                    <td>User's Company</td>
                    <td>
                        <asp:TextBox ID="txtEngineeringCompany" runat="server" />
                    </td>
                </tr>
                <tr id="trEngDropDown" runat="server">
                    <td>User's Company</td>
                    <td>
                        <asp:DropDownList ID="ddlEngComp" AutoPostBack="true" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlEngComp_SelectedIndexChanged">
                            <asp:ListItem Text="Please select..." Value="0" />
                        </asp:DropDownList>
                    </td>
                </tr>
                    <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlEngComp" ValueToCompare="0" Operator="Equal" Type="Integer" ErrorMessage="Please select a value" ForeColor="Red" />--%>
                <tr id="trConsultingEng" runat="server" >
                    <td>Project Owner</td>
                    <td>
                        <asp:TextBox ID="txtConsultingEng" runat="server" />
                    </td>
                </tr>

                <tr id="trConsEngDropDown" runat="server">
                    <td>Project Owner</td>
                    <td>
                        <asp:DropDownList ID="ddlConsEng" AutoPostBack="true" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlConsEng_SelectedIndexChanged">
                            <asp:ListItem Text="Please select..." Value="0" />
                        </asp:DropDownList>
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
                        <asp:TextBox ID="txtQuoteNo" runat="server" Placeholder="1000.00" />
                    </td>
                </tr>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtQuoteNo" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Please enter a number" ForeColor="Red"></asp:RegularExpressionValidator>
                <tr id="trStatus" runat="server">
                    <td>Status</td>
                    <td>
                        <asp:TextBox ID="txtStatus" runat="server" />
                    </td>
                </tr>
                <tr id="trPriceAdj" runat="server">
                    <td>Price Adjustment</td>
                    <td>
                        <asp:TextBox ID="txtPriceAdj" runat="server" />
                    </td>
                </tr>
            </table>

               </div>
               <asp:Button ID="btnSubmit" Text="Create Project" runat="server" OnClick="btnSubmit_Click" />
               <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" />
            </div>


</asp:Content>
