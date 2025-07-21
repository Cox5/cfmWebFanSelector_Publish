<%@ Page Title="User Edit" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="CFM_Web.Users.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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

<asp:UpdatePanel ID="upnlCompany" runat="server">
    <ContentTemplate>
        <tr runat="server" id="trDdlCompany">
            <td>Company (select)</td>
            <td>
                <asp:DropDownList runat="server" ID="ddlCompanyName" AutoCompleteType="Disabled" Width="250px"></asp:DropDownList>
                
                <%-- BUTTON to show the panel --%>
                        <style>
                        .smaller-text {font-size: 12px !important;}
                        </style>
                <asp:Button ID="btnShowAddCompany" runat="server" class="button-main2 smaller-text primary-btn" 
                    CausesValidation="false" Text="Add New Company" OnClick="btnShowAddCompany_Click"  />
                 <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <%-- PANEL that will be shown/hidden --%>
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlAddCompany" runat="server" Visible="false" CssClass="add-company-panel" style="background-color: #f9f9f9; border: 1px solid #ccc; padding: 15px; margin-top: 10px;">
                    
                    <style>
                        /* Scoped styles for the new panel for clarity */
                        .add-company-panel td.optional {color: #888888;}
                        .add-company-panel td.required {color: #000000; font-weight: bold;}
                    </style>

                    <h3><i class="far fa-building"></i> Add New Company</h3>
                    <hr />
                    <table width="100%">
                        <tr>
                            <td class="required" style="width:150px;">Name</td>
                            <td class="required">
                                <asp:TextBox ID="txtNewCompanyName" runat="server" Width="250px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Address 1</td>
                            <td class="optional">
                                <asp:TextBox ID="txtNewCompanyAddr1" runat="server" Width="250px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Address 2</td>
                            <td class="optional">
                                <asp:TextBox ID="txtNewCompanyAddr2" runat="server" Width="250px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Suburb/City</td>
                            <td class="optional">
                                <asp:TextBox ID="txtNewCompanySubCity" runat="server" Width="250px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="required">State</td>
                            <td class="required">
                                <asp:TextBox ID="txtNewState" runat="server" Visible="false" />
                                <asp:DropDownList ID="ddlNewState" AppendDataBoundItems="true" runat="server">
                                    <asp:ListItem Value="">Please select...</asp:ListItem>
                                    <asp:ListItem Value="ACT">Australian Capital Territory</asp:ListItem>
                                    <asp:ListItem Value="NSW">New South Wales</asp:ListItem>
                                    <asp:ListItem Value="NT">Northern Territory</asp:ListItem>
                                    <asp:ListItem Value="QLD">Queensland</asp:ListItem>
                                    <asp:ListItem Value="SA">South Australia</asp:ListItem>
                                    <asp:ListItem Value="TAS">Tasmania</asp:ListItem>
                                    <asp:ListItem Value="VIC">Victoria</asp:ListItem>
                                    <asp:ListItem Value="WA">Western Australia</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Country</td>
                            <td class="optional">
                                <asp:DropDownList ID="ddlNewCountry" AutoPostBack="true" AppendDataBoundItems="true" runat="server"
                                    ><%-- onselectedindexchanged="ddlNewCountry_SelectedIndexChanged" --%>
                                    <%-- NOTE: The country list from CompanyEdit.aspx has been copied here --%>
                                    <asp:ListItem Text="Australia" Value="Australia" />
                    <asp:ListItem>Afghanistan</asp:ListItem>
                    <asp:ListItem>Albania</asp:ListItem>
                    <asp:ListItem>Algeria</asp:ListItem>
                    <asp:ListItem>American Samoa</asp:ListItem>
                    <asp:ListItem>Andorra</asp:ListItem>
                    <asp:ListItem>Angola</asp:ListItem>
                    <asp:ListItem>Anguilla</asp:ListItem>
                    <asp:ListItem>Antarctica</asp:ListItem>
                    <asp:ListItem>Antigua And Barbuda</asp:ListItem>
                    <asp:ListItem>Argentina</asp:ListItem>
                    <asp:ListItem>Armenia</asp:ListItem>
                    <asp:ListItem>Aruba</asp:ListItem>
                    <asp:ListItem>Austria</asp:ListItem>
                    <asp:ListItem>Azerbaijan</asp:ListItem>
                    <asp:ListItem>Bahamas</asp:ListItem>
                    <asp:ListItem>Bahrain</asp:ListItem>
                    <asp:ListItem>Bangladesh</asp:ListItem>
                    <asp:ListItem>Barbados</asp:ListItem>
                    <asp:ListItem>Belarus</asp:ListItem>
                    <asp:ListItem>Belgium</asp:ListItem>
                    <asp:ListItem>Belize</asp:ListItem>
                    <asp:ListItem>Benin</asp:ListItem>
                    <asp:ListItem>Bermuda</asp:ListItem>
                    <asp:ListItem>Bhutan</asp:ListItem>
                    <asp:ListItem>Bolivia</asp:ListItem>
                    <asp:ListItem>Bosnia And Herzegowina</asp:ListItem>
                    <asp:ListItem>Botswana</asp:ListItem>
                    <asp:ListItem>Bouvet Island</asp:ListItem>
                    <asp:ListItem>Brazil</asp:ListItem>
                    <asp:ListItem>British Indian Ocean Territory</asp:ListItem>
                    <asp:ListItem>Brunei Darussalam</asp:ListItem>
                    <asp:ListItem>Bulgaria</asp:ListItem>
                    <asp:ListItem>Burkina Faso</asp:ListItem>
                    <asp:ListItem>Burundi</asp:ListItem>
                    <asp:ListItem>Cambodia</asp:ListItem>
                    <asp:ListItem>Cameroon</asp:ListItem>
                    <asp:ListItem>Canada</asp:ListItem>
                    <asp:ListItem>Cape Verde</asp:ListItem>
                    <asp:ListItem>Cayman Islands</asp:ListItem>
                    <asp:ListItem>Central African Republic</asp:ListItem>
                    <asp:ListItem>Chad</asp:ListItem>
                    <asp:ListItem>Chile</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                    <asp:ListItem>Christmas Island</asp:ListItem>
                    <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                    <asp:ListItem>Colombia</asp:ListItem>
                    <asp:ListItem>Comoros</asp:ListItem>
                    <asp:ListItem>Congo</asp:ListItem>
                    <asp:ListItem>Cook Islands</asp:ListItem>
                    <asp:ListItem>Costa Rica</asp:ListItem>
                    <asp:ListItem>Cote D'Ivoire</asp:ListItem>
                    <asp:ListItem>Croatia (Local Name: Hrvatska)</asp:ListItem>
                    <asp:ListItem>Cuba</asp:ListItem>
                    <asp:ListItem>Cyprus</asp:ListItem>
                    <asp:ListItem>Czech Republic</asp:ListItem>
                    <asp:ListItem>Denmark</asp:ListItem>
                    <asp:ListItem>Djibouti</asp:ListItem>
                    <asp:ListItem>Dominica</asp:ListItem>
                    <asp:ListItem>Dominican Republic</asp:ListItem>
                    <asp:ListItem>East Timor</asp:ListItem>
                    <asp:ListItem>Ecuador</asp:ListItem>
                    <asp:ListItem>Egypt</asp:ListItem>
                    <asp:ListItem>El Salvador</asp:ListItem>
                    <asp:ListItem>Equatorial Guinea</asp:ListItem>
                    <asp:ListItem>Eritrea</asp:ListItem>
                    <asp:ListItem>Estonia</asp:ListItem>
                    <asp:ListItem>Ethiopia</asp:ListItem>
                    <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                    <asp:ListItem>Faroe Islands</asp:ListItem>
                    <asp:ListItem>Fiji</asp:ListItem>
                    <asp:ListItem>Finland</asp:ListItem>
                    <asp:ListItem>France</asp:ListItem>
                    <asp:ListItem>French Guiana</asp:ListItem>
                    <asp:ListItem>French Polynesia</asp:ListItem>
                    <asp:ListItem>French Southern Territories</asp:ListItem>
                    <asp:ListItem>Gabon</asp:ListItem>
                    <asp:ListItem>Gambia</asp:ListItem>
                    <asp:ListItem>Georgia</asp:ListItem>
                    <asp:ListItem>Germany</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Gibraltar</asp:ListItem>
                    <asp:ListItem>Greece</asp:ListItem>
                    <asp:ListItem>Greenland</asp:ListItem>
                    <asp:ListItem>Grenada</asp:ListItem>
                    <asp:ListItem>Guadeloupe</asp:ListItem>
                    <asp:ListItem>Guam</asp:ListItem>
                    <asp:ListItem>Guatemala</asp:ListItem>
                    <asp:ListItem>Guinea</asp:ListItem>
                    <asp:ListItem>Guinea-Bissau</asp:ListItem>
                    <asp:ListItem>Guyana</asp:ListItem>
                    <asp:ListItem>Haiti</asp:ListItem>
                    <asp:ListItem>Honduras</asp:ListItem>
                    <asp:ListItem>Hong Kong</asp:ListItem>
                    <asp:ListItem>Hungary</asp:ListItem>
                    <asp:ListItem>Iceland</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>Indonesia</asp:ListItem>
                    <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                    <asp:ListItem>Iraq</asp:ListItem>
                    <asp:ListItem>Ireland</asp:ListItem>
                    <asp:ListItem>Israel</asp:ListItem>
                    <asp:ListItem>Italy</asp:ListItem>
                    <asp:ListItem>Jamaica</asp:ListItem>
                    <asp:ListItem>Japan</asp:ListItem>
                    <asp:ListItem>Jordan</asp:ListItem>
                    <asp:ListItem>Kazakhstan</asp:ListItem>
                    <asp:ListItem>Kenya</asp:ListItem>
                    <asp:ListItem>Kiribati</asp:ListItem>
                    <asp:ListItem>Korea</asp:ListItem>
                    <asp:ListItem>Kuwait</asp:ListItem>
                    <asp:ListItem>Kyrgyzstan</asp:ListItem>
                    <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                    <asp:ListItem>Latvia</asp:ListItem>
                    <asp:ListItem>Lebanon</asp:ListItem>
                    <asp:ListItem>Lesotho</asp:ListItem>
                    <asp:ListItem>Liberia</asp:ListItem>
                    <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                    <asp:ListItem>Liechtenstein</asp:ListItem>
                    <asp:ListItem>Lithuania</asp:ListItem>
                    <asp:ListItem>Luxembourg</asp:ListItem>
                    <asp:ListItem>Macau</asp:ListItem>
                    <asp:ListItem>Macedonia</asp:ListItem>
                    <asp:ListItem>Madagascar</asp:ListItem>
                    <asp:ListItem>Malawi</asp:ListItem>
                    <asp:ListItem>Malaysia</asp:ListItem>
                    <asp:ListItem>Maldives</asp:ListItem>
                    <asp:ListItem>Mali</asp:ListItem>
                    <asp:ListItem>Malta</asp:ListItem>
                    <asp:ListItem>Marshall Islands</asp:ListItem>
                    <asp:ListItem>Martinique</asp:ListItem>
                    <asp:ListItem>Mauritania</asp:ListItem>
                    <asp:ListItem>Mauritius</asp:ListItem>
                    <asp:ListItem>Mayotte</asp:ListItem>
                    <asp:ListItem>Mexico</asp:ListItem>
                    <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                    <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                    <asp:ListItem>Monaco</asp:ListItem>
                    <asp:ListItem>Mongolia</asp:ListItem>
                    <asp:ListItem>Montserrat</asp:ListItem>
                    <asp:ListItem>Morocco</asp:ListItem>
                    <asp:ListItem>Mozambique</asp:ListItem>
                    <asp:ListItem>Myanmar</asp:ListItem>
                    <asp:ListItem>Namibia</asp:ListItem>
                    <asp:ListItem>Nauru</asp:ListItem>
                    <asp:ListItem>Nepal</asp:ListItem>
                    <asp:ListItem>Netherlands</asp:ListItem>
                    <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                    <asp:ListItem>New Caledonia</asp:ListItem>
                    <asp:ListItem>New Zealand</asp:ListItem>
                    <asp:ListItem>Nicaragua</asp:ListItem>
                    <asp:ListItem>Niger</asp:ListItem>
                    <asp:ListItem>Nigeria</asp:ListItem>
                    <asp:ListItem>Niue</asp:ListItem>
                    <asp:ListItem>Norfolk Island</asp:ListItem>
                    <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                    <asp:ListItem>Norway</asp:ListItem>
                    <asp:ListItem>Oman</asp:ListItem>
                    <asp:ListItem>Pakistan</asp:ListItem>
                    <asp:ListItem>Palau</asp:ListItem>
                    <asp:ListItem>Panama</asp:ListItem>
                    <asp:ListItem>Papua New Guinea</asp:ListItem>
                    <asp:ListItem>Paraguay</asp:ListItem>
                    <asp:ListItem>Peru</asp:ListItem>
                    <asp:ListItem>Philippines</asp:ListItem>
                    <asp:ListItem>Pitcairn</asp:ListItem>
                    <asp:ListItem>Poland</asp:ListItem>
                    <asp:ListItem>Portugal</asp:ListItem>
                    <asp:ListItem>Puerto Rico</asp:ListItem>
                    <asp:ListItem>Qatar</asp:ListItem>
                    <asp:ListItem>Reunion</asp:ListItem>
                    <asp:ListItem>Romania</asp:ListItem>
                    <asp:ListItem>Russian Federation</asp:ListItem>
                    <asp:ListItem>Rwanda</asp:ListItem>
                    <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                    <asp:ListItem>Saint Lucia</asp:ListItem>
                    <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                    <asp:ListItem>Samoa</asp:ListItem>
                    <asp:ListItem>San Marino</asp:ListItem>
                    <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                    <asp:ListItem>Senegal</asp:ListItem>
                    <asp:ListItem>Serbia</asp:ListItem>
                    <asp:ListItem>Seychelles</asp:ListItem>
                    <asp:ListItem>Sierra Leone</asp:ListItem>
                    <asp:ListItem>Singapore</asp:ListItem>
                    <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                    <asp:ListItem>Slovenia</asp:ListItem>
                    <asp:ListItem>Solomon Islands</asp:ListItem>
                    <asp:ListItem>Somalia</asp:ListItem>
                    <asp:ListItem>South Africa</asp:ListItem>
                    <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                    <asp:ListItem>Spain</asp:ListItem>
                    <asp:ListItem>Sri Lanka</asp:ListItem>
                    <asp:ListItem>St. Helena</asp:ListItem>
                    <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                    <asp:ListItem>Sudan</asp:ListItem>
                    <asp:ListItem>Suriname</asp:ListItem>
                    <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                    <asp:ListItem>Sw Aziland</asp:ListItem>
                    <asp:ListItem>Sweden</asp:ListItem>
                    <asp:ListItem>Switzerland</asp:ListItem>
                    <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                    <asp:ListItem>Taiwan</asp:ListItem>
                    <asp:ListItem>Tajikistan</asp:ListItem>
                    <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                    <asp:ListItem>Thailand</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                    <asp:ListItem>Tokelau</asp:ListItem>
                    <asp:ListItem>Tonga</asp:ListItem>
                    <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                    <asp:ListItem>Tunisia</asp:ListItem>
                    <asp:ListItem>Turkey</asp:ListItem>
                    <asp:ListItem>Turkmenistan</asp:ListItem>
                    <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                    <asp:ListItem>Tuvalu</asp:ListItem>
                    <asp:ListItem>Uganda</asp:ListItem>
                    <asp:ListItem>Ukraine</asp:ListItem>
                    <asp:ListItem>United Arab Emirates</asp:ListItem>
                    <asp:ListItem>United Kingdom</asp:ListItem>
                    <asp:ListItem>United States</asp:ListItem>
                    <asp:ListItem>United States Minor Is.</asp:ListItem>
                    <asp:ListItem>Uruguay</asp:ListItem>
                    <asp:ListItem>Uzbekistan</asp:ListItem>
                    <asp:ListItem>Vanuatu</asp:ListItem>
                    <asp:ListItem>Venezuela</asp:ListItem>
                    <asp:ListItem>Viet Nam</asp:ListItem>
                    <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                    <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                    <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                    <asp:ListItem>Western Sahara</asp:ListItem>
                    <asp:ListItem>Yemen</asp:ListItem>
                    <asp:ListItem>Zaire</asp:ListItem>
                    <asp:ListItem>Zambia</asp:ListItem>
                    <asp:ListItem>Zimbabwe</asp:ListItem> 
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Postcode</td>
                            <td class="optional">
                                <asp:TextBox ID="txtNewCompanyPostcode" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Telephone</td>
                            <td class="optional">
                                <asp:TextBox ID="txtNewCompanyTelephone" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="optional">Website</td>
                            <td class="optional">
                                <asp:TextBox ID="txtNewCompanyWebsite" runat="server" Placeholder="example.com" />
                                <asp:RegularExpressionValidator ID="regNewUrl" runat="server" ControlToValidate="txtNewCompanyWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$" ErrorMessage="Enter a valid URL" ForeColor="Red" Display="Dynamic" />
                            </td>
                        </tr>
                    </table>
                    <div class="center-text mb-medium" style="margin-top:20px;">
                        <asp:Label ID="lblNewCompanyMessage" runat="server" ForeColor="Red" /> <br />
                        
                        <%-- BUTTONS to save or cancel adding the new company --%>
                        <style>
                            .cbuttons {
                                width: 120px !important;
                                display: inline-block !important;
                                float: left;
                            }
                        </style>
                        <asp:Button class="button-main2 smaller-text primary-btn cbuttons" ID="btnSaveNewCompany" Text="Save Company" runat="server" OnClick="btnSaveNewCompany_Click" />
                        <asp:Button class="button-main2 smaller-text prevpage cbuttons" ID="btnCancelAddCompany" Text="Cancel" runat="server" OnClick="btnCancelAddCompany_Click" CausesValidation="false" />
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </ContentTemplate>
</asp:UpdatePanel>
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
          <asp:ListItem Text="Email only" Value="8"></asp:ListItem>
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
