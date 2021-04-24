<%@ Page Title="User Edit" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="CFM_Web.Users.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        <div class="table-controls mb-medium">
            <h1 class="table-title">User Edit</h1>
        </div>

  <table class="table">
    <tr>
      <td>Firstname</td>
      <td><asp:TextBox ID="txtFirstname" runat="server" AutoCompleteType="Disabled"/></td>
        <td>
            <asp:RegularExpressionValidator ID="regName" runat="server" Display="Dynamic" ControlToValidate="txtFirstname" ValidationExpression="^[a-zA-Z'.\s\-]{1,25}" ErrorMessage="Enter a valid name" ForeColor="Red" />
            <br /><asp:RequiredFieldValidator class="mt-small" Display="Dynamic" ID="firstNameRequiredValidator" runat="server" ErrorMessage="Name field is empty" ForeColor="Red" ControlToValidate="txtFirstname"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
      <td>Lastname</td>
      <td><asp:TextBox ID="txtLastname" runat="server" AutoCompleteType="Disabled" /></td>
        <td>
            <asp:RegularExpressionValidator ID="regLastName" runat="server" ControlToValidate="txtLastname" ValidationExpression="^[a-zA-Z'.\s\-]{1,25}" ErrorMessage="Enter a valid last name" ForeColor="Red" />
            <br /><asp:RequiredFieldValidator class="mt-small"  ID="regLastNameRequired" runat="server" ErrorMessage="Last name field is empty" ForeColor="Red" ControlToValidate="txtLastname"></asp:RequiredFieldValidator>
      
        </td>
    </tr>
<%--    <tr runat="server" id="trTxtCompanyName">
      <td>Company</td>
      <td><asp:TextBox ID="txtCompany_Name" runat="server" /></td>
    </tr>--%>
    <tr runat="server" id="trDdlCompany">
          <td>Company (select)</td>
          <td><asp:DropDownList runat="server" ID="ddlCompanyName" AutoCompleteType="Disabled">
              </asp:DropDownList> 

          </td>
      </tr>
    <tr>
      <td>Mobile</td>
      <td><asp:TextBox ID="txtUser_Mobile" runat="server" AutoCompleteType="Disabled" MaxLength="20"/></td>
    </tr>
    <tr>
        <td>Email address</td>
        <td><asp:TextBox ID="txtEmail" runat="server" AutoCompleteType="Disabled" /></td>
        <td>
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator class="mt-small"  ID="regEmailRequiredValidator" runat="server" ErrorMessage="Email field is empty" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Password</td>
        <td>
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Placeholder="Leave blank or type new password"   autocomplete="new-password"/>
        </td>
    </tr>
    <tr>
        <td>Confirm Password</td>
        <td>
            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" Placeholder="leave blank or type new password"  autocomplete="new-password"/>
        </td>
        <td>
            <asp:CompareValidator runat="server" ID="Comp1" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal" Type="String" ErrorMessage="Password mismatch" Font-Size="11px" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
      <td>User class</td>
      <td><asp:DropDownList runat="server" ID="ddlUserClass">
          <asp:ListItem Text="Superadmin" Value="0"></asp:ListItem>
          <asp:ListItem Text="Administrator" Value="1"></asp:ListItem>
          <asp:ListItem Text="Sales" Value="2"></asp:ListItem>
          <asp:ListItem Text="User" Value="3"></asp:ListItem>
          <asp:ListItem Text="Deleted" Value="5"></asp:ListItem>
          <asp:ListItem Text="Pending" Value="6"></asp:ListItem>
          <asp:ListItem Text="Rejected" Value="7"></asp:ListItem>
      </asp:DropDownList></td>
      <%--<td><asp:TextBox ID="txtUser_Class" runat="server" /></td>--%>
    </tr>
    <tr>
      <td>Is company owner</td>
      <td><asp:CheckBox ID="chkCompanyOwner" runat="server" visible="false" /></td>
    </tr>
  </table>

<%--        <asp:ValidationSummary ID="vsSample" runat="server"
            DisplayMode="BulletList" ShowMessageBox="false"
            ShowSummary="true" ForeColor="Red"
            HeaderText="Correct the following errors." />--%>

  <div class="mt-medium">
    <div style="float:left; "><asp:Button ID="btnSave" class="button-main primary-btn" Text="Submit" runat="server" OnClick="btnSave_Click" /></div>
      <div style="float:left; "><asp:Button ID="btnApproval" class="button-main primary-btn" Text="Send Approval Email" runat="server" OnClick="btnApproval_Click" Visible="false" /></div>
      <div style="float:left; "><asp:Button ID="btnRejection" class="button-main primary-btn" Text="Send Rejection Email" runat="server" OnClick="btnRejection_Click" Visible="false" /></div>
   <div style="float:left; margin-left: 20px"><asp:Button ID="btnCancel" class="button-main quarternary-btn prevpage" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" /></div>
  </div>
        <div style="clear:both"></div>

  
  
  <br />
  <asp:Label ID="lblEditUserMsg" runat="server" />
  <asp:Label ID="lblRedirectMsg" runat="server" Visible="false"><br /><a href="AccountsDashboard.aspx">Return to Accounts Dashboard page</a></asp:Label>
  </div>

</asp:Content>
