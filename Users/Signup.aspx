<%@ Page Title="Registration" Language="C#" MasterPageFile="~/FanHome.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CFM_Web.Users.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <form id="formSignUp" runat="server">
    <div class="content-wrapper">

        <div class="center-text">
            <h1 class="heading-primary mb-medium">Fan Selector User Registration</h1>
        </div>
        <style>.red {
                color: #dd0000;
            }
        </style>
            <div class="form-box">
                    <h3><i class="fas fa-user-alt"></i> Your details</h3>
                    <hr/>
                    <table width="100%">
                        <tr>
                            <td class="red"> First name</td>
                            <td>
                                <asp:TextBox ID="txtFirstname" runat="server" required="true" />
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td class="red">Last name</td>
                            <td>
                                <asp:TextBox ID="txtLastname" runat="server" required="false" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="red"> Email address</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" required="true" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="red"> Confirm email address</td>
                            <td>
                                <asp:TextBox ID="txtEmailConfirm" runat="server" required="true" AutoComplete="off" />
                            </td>
                        </tr>
                        <tr>
                            <td>Phone (optional)</td>
                            <td>
                                <asp:TextBox ID="txtUserPhone" runat="server" />
                            </td>
                        </tr>
                        <tr>
                        <td class="red"> Company/Business Name</td>
                        <td>
                            <asp:TextBox ID="txtCompany" required="true" runat="server" />
                        </td>
                        </tr>
            <tr>
                        <td class="required red" ID="tdState" runat="server">State</td>
                        <td class="required">
                            <asp:TextBox ID="txtState" runat="server" Visible="false" />
                            <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" runat="server">
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
                    <td class="red">Country</td>
                    <td  >
                           <asp:DropDownList ID="ddlCountry" AutoPostBack="true" AppendDataBoundItems="true" runat="server"
                               onselectedindexchanged="ddlCountry_SelectedIndexChanged">
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
                    </table>
                   <div class="center-text mb-medium">
                       <div style="float: left;">
                              <asp:Button class="button-main bigger primary-btn mt-big prevpage" ID="btnCancel" UseSubmitBehavior="false" CausesValidation="false" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
                       </div>
                       <div style="float: right;">
                              <asp:Button class="button-main bigger secondary-btn mt-big" ID="btnSubmit" Text="Register" runat="server" OnClick="btnSubmit_Click" />
                       </div>

                    <asp:Label ID="lblMessage" runat="server" />
                </div>

                    <p class="validation-msg">
                        <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtFirstname" ValidationExpression="^[a-zA-Z'.\s\-]{1,25}" ErrorMessage="Enter a valid name" ForeColor="Red" /> 
                        <asp:RegularExpressionValidator ID="regLastName" runat="server" ControlToValidate="txtLastname" ValidationExpression="^[a-zA-Z'.\s\-]{1,30}" ErrorMessage="Enter a valid last name" ForeColor="Red" /> 
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                       <%--<asp:CompareValidator runat="server" ID="Comp2" ControlToValidate="txtEmailConfirm" ControlToCompare="txtEmail" Operator="Equal" Type="String" ErrorMessage="Email mismatch" ForeColor="Red"></asp:CompareValidator>--%>
                    </p>
                    
<%--                    <p class="validation-msg">
                        <asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="txtUserPhone" ValidationExpression="" ErrorMessage="Enter a valid phone number" ForeColor="Red" /> 
                    </p>--%>
                   

                    
            </div>
                    <div class="rightcolumn" style="display:none">
                <h3><i class="far fa-building"></i> Your company details</h3>
                <hr/>
                <table width="100%">
                    <tr>
                        <td>Name</td>
                        <td>
                            <asp:TextBox ID="txtCompany_hidden" runat="server"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Address 1</td>
                        <td>
                            <asp:TextBox ID="txtCompanyAddr1" runat="server"  />
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
                            <asp:TextBox ID="txtCompanySubCity" runat="server"/>
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
                            <asp:TextBox ID="txtCompanyCountry" runat="server"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Telephone</td>
                        <td>
                            <asp:TextBox ID="txtCompanyTelephone" runat="server"  />
                        </td>
                    
                    </tr>
    
                    <tr>
                        <td>Website</td>
                        <td>
                            <asp:TextBox ID="txtCompanyWebsite" runat="server"  Placeholder="example.com" />
                        </td>
                    </tr>
                   
                </table>

                <%--<asp:RegularExpressionValidator ID="regUrl" runat="server" ControlToValidate="txtCompanyWebsite" ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$" ErrorMessage="Enter a valid URL" ForeColor="Red" /> 
                 --%>
                
            </div>


    </div>
 </form>

</asp:Content>
