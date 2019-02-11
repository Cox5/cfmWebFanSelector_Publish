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
                        <asp:TextBox ID="txtProjectname" runat="server" Required="true"/>
                    </td>
                </tr>
                <%--<asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtProjectname" MinimumValue="2" MaximumValue="35" ErrorMessage="Enter a valid name" ForeColor="Red" /> --%>
                <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtProjectname" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{2,30}$" runat="server" ErrorMessage="Minimum 2 and maximum 30 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
  
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
                            <asp:ListItem Text="Please select..." Value="Null" />
                        </asp:DropDownList>
                    </td>
                </tr>
                    <asp:RequiredFieldValidator ID="valPriorityRequired" runat="server" ControlToValidate="ddlEngComp" Display="Dynamic" ErrorMessage="User's company required." ForeColor="Red" InitialValue="Null"></asp:RequiredFieldValidator>
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
                            <asp:ListItem Text="Please select..." Value="Null" />
                        </asp:DropDownList>
                    </td>
                </tr>
               <asp:RequiredFieldValidator ID="valPriorityRequired2" runat="server" ControlToValidate="ddlConsEng" Display="Dynamic" ErrorMessage="Please select engineer from drop down list." ForeColor="Red" InitialValue="Null"></asp:RequiredFieldValidator>
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
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtQuoteNo" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Please enter a number" ForeColor="Red"></asp:RegularExpressionValidator>--%>
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
               <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" OnClientClick="javascript:window.location.href='ProjectsDashboard.aspx'; return false;" />
            </div>


</asp:Content>
