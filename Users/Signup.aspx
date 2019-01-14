<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CFM_Web.Users.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
    var check = function() {
  if (document.getElementById('txtPassword').value ==
    document.getElementById('txtConfirmPassword').value) {
    document.getElementById('lblMessage').style.color = 'green';
    document.getElementById('lblMessage').innerHTML = 'matching';
  } else {
    document.getElementById('lblMessage').style.color = 'red';
    document.getElementById('lblMessage').innerHTML = 'not matching';
  }
}
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        <div class="leftcolumn">
            <h1>Fan Selector User Registration</h1>
            <h3>Your details</h3>
            <table width="100%">
                <tr>
                    <td>Firstname</td>
                    <td>
                        <asp:TextBox ID="txtFirstname" runat="server" required />
                    </td>
                </tr>
                <tr>
                    <td>Lastname</td>
                    <td>
                        <asp:TextBox ID="txtLastname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>
                        <asp:TextBox ID="txtUserPhone" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" onkeyup="check();" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" onkeyup="check();" />
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
                        <asp:TextBox ID="txtCompanyWebsite" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnSubmit" Text="Register" runat="server" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </div>

</asp:Content>
