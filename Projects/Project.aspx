<%@ Page Title="Create project" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CFM_Web.Projects.CreateProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
        <div class="content-wrapper">
            
            <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle"  id="h1" runat="server"></h1>    
              
            </div>
            
            <div class="project-name" ><asp:Label ID="lblProjectName" runat="server"  Visible="false"></asp:Label></div>
            <div class="subtitle regular" id="quoteNumberLine" runat="server" Visible="false" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
            <div class="right-controls mt-medium mr-small" style="float: right;">
                       <asp:Button ID="Button1"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnCancel_Click" runat="server" />
              </div> 

            </div>


            <h3>Project details</h3>
            <p><asp:Label ID="lblMessage" runat="server" /></p>
<style>
        td.optional {color: #000000;}
        td.required {color: #000000;}
        td.optional input[type="text"], td.optional select {
            color: #000000;
            border: 1px solid #eee;
        }
        input[type="text"].required,select.required {
            color: #000000 !important;
            border: 1px solid #ff0000 !important;
        }


</style>
           <div class="leftcolumn">
            
            <table class="table">

                <tr>
                    <td >Project Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtProjectname" runat="server" CssClass="required" AutoCompleteType="Disabled" />
                        <asp:HiddenField Value="" ID="hiddenProjectname" runat="server"/>

                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblCompany1" Visible="false" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCompany2" Visible="false" runat="server"></asp:Label>
                    </td>
                </tr>
                </tr>
                <%--<asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtProjectname" MinimumValue="2" MaximumValue="35" ErrorMessage="Enter a valid name" ForeColor="Red" /> --%>
                <asp:RequiredFieldValidator class="mt-small" ID="RequiredProjectNamevalidator" runat="server" ErrorMessage="Project name field is empty " ForeColor="Red" ControlToValidate="txtProjectname"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtProjectname" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{2,100}$" runat="server" ErrorMessage="Minimum 2 and maximum 100 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
  
                <tr>
                    <td class="optional">Project Address</td>
                    <td class="optional">
                        <asp:TextBox ID="txtAddress1" runat="server" AutoCompleteType="Disabled" />
                    </td>
                </tr>
                <!-- tr>
                    <td class="optional">Address 2</td>
                    <td class="optional">
                        <asp:TextBox ID="txtAddress2" runat="server" />
                    </td>
                </!-->
                <!-- tr>
                    <td class="optional">Suburb/City</td>
                    <td class="optional">
                        <asp:TextBox ID="txtSuburb" runat="server" />
                    </td>
                </!-->
                <tr>
                    <td class="required">Country</td>
                    <td>
                           <asp:DropDownList ID="ddlCountry" AutoPostBack="true" AppendDataBoundItems="true" runat="server"
                               onselectedindexchanged="ddlCountry_SelectedIndexChanged"  CssClass="required"  >
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
                    <td class="required">State</td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server"   />
                        <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" runat="server"  CssClass="required">
                            <asp:ListItem Value="unselected">Please select...</asp:ListItem>
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
                <!-- tr>
                    <td class="optional">Postcode</td>
                    <td>
                        <asp:TextBox ID="txtPostcode" runat="server" />
                    </td>
                </!-->
                <tr>
                    <td class="optional">Additional Airflow (%)</td>
                    <td>
                        <asp:TextBox ID="txtAddAirflow" runat="server" style="width: 50px"/>
                    </td>    
                 </tr>     
                <asp:RequiredFieldValidator class="mt-small" ID="countryReqValidator" runat="server" ErrorMessage="Country field is empty" ForeColor="Red" ControlToValidate="ddlCountry"></asp:RequiredFieldValidator>

                </table>
            </div>

            <div class="rightcolumn" id="rightCol" runat="server">
                <br />
                <table class="table">
                    <!-- Eng Comp, Sales Consultant, Quote Number, Status and PriceAdj should only appear if user is sales, admin or superadmin -->
                    <tr id="trEngComp" runat="server" >
                        <td>User's Company</td>
                        <td>
                            <asp:TextBox ID="txtEngineeringCompany" runat="server" />
                        </td>
                    </tr>
                   <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                    <tr id="trEngDropDown" runat="server">
                        <td class="optional">Quote for Company</td>
                        <td>
                            <asp:DropDownList ID="ddlEngComp" AutoPostBack="true" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlEngComp_SelectedIndexChanged">
                                
                            </asp:DropDownList><!-- <asp:ListItem Text="Please select..." Value="Null" /> -->
                        </td>
                    </tr>
                        
                    <tr id="trConsultingEng" runat="server" >
                        <td class="optional">Attention</td>
                        <td>
                            <asp:TextBox ID="txtConsultingEng" runat="server" />
                        </td>
                    </tr>

                    <tr id="trConsEngDropDown" runat="server">
                        <td class="optional">Attention</td>
                        <td>
                            <asp:DropDownList ID="ddlConsEng" AutoPostBack="true" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlConsEng_SelectedIndexChanged">
                                
                            </asp:DropDownList>
                            <!-- <asp:ListItem Text="Please select..." Value="Null" /> -->
                        </td>
                    </tr>
                
                    <tr id="trSalesConsultant" runat="server" >
                        <td class="optional">CFM Contact</td>
                        <td>
                            <%--  %><asp:TextBox ID="txtSalesConsultant" runat="server" /> --%>
                            <asp:DropDownList ID="ddlSalesCons" AutoPostBack="true" AppendDataBoundItems="true" runat="server">                              
                            </asp:DropDownList>
                            <asp:HiddenField ID="hiddenSalesID" runat="server" />
                            <!-- <asp:ListItem Text="Please select..." Value="Null" /> -->

                        </td>
                    </tr>
                    <tr id="trQuoteNumber" runat="server">
                        <td class="optional">Quote Number</td>
                        <td>
                            <asp:TextBox ID="txtQuoteNo" runat="server" Placeholder="Issued after Save" />
                        </td>
                    </tr>
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtQuoteNo" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Please enter a number" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                    <!-- 
                        < tr id="trStatus" >
                        <td class="optional">Status</td>
                        <td class="optional">
                            <asp:TextBox ID="txtStatus" runat="server" />
                        </td>
                    < -->
                    <!-- tr id="trPriceAdj" >
                        <td  class="optional">Price Adjustment</td>
                        <td class="optional">
                            <asp:TextBox ID="txtPriceAdj" runat="server" />
                        </td>
                    </!-->
                    <tr id="tr1" runat="server">
                        <td class="optional">Estimated Delivery Time</td>
                        <td class="optional">
                            &nbsp;<asp:TextBox ID="txtDeliveryTime" runat="server" size="5" style="width: auto" /> business days
                        </td>
                    </tr>
                    <tr id="trDelivery" runat="server">
                        <td  class="optional">Delivery cost (ex GST)</td>
                        <td class="optional">
                            $<asp:TextBox ID="txtDeliveryCost" size="5" style="width: auto"  runat="server" />
                        </td>
                    </tr>
                    <tr id="trPriceAdj" runat="server" Visible="false">
                        <td  class="optional">Price Adjustment</td>
                        <td class="optional">
                            <asp:HiddenField ID="hiddenPriceAdj"  runat="server" />
                            <asp:DropDownList ID="ddlPriceAdj" runat="server" AutoPostBack="true">
                                <asp:ListItem>Standard</asp:ListItem>
                                <asp:ListItem>Discount</asp:ListItem>
                                <asp:ListItem>Premium</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="PriceAdjOf" Visible="false" runat="server"> of </asp:Label>
                            <asp:TextBox ID="txtPriceAdjAmount" size="5" style="width: auto"  runat="server"  Visible="false"/>
                            <asp:Label ID="PriceAdjPC" Visible="false" runat="server"> percent. </asp:Label>
                        </td>
                    </tr>
                </table>

                <p class="validation-msg">
                    <asp:RequiredFieldValidator ID="valPriorityRequired" runat="server" ControlToValidate="ddlEngComp" Display="Dynamic" ErrorMessage="User's company required." ForeColor="Red" InitialValue="Null"></asp:RequiredFieldValidator>
                </p>

                <p class="validation-msg">
                    <asp:RequiredFieldValidator ID="valPriorityRequired2" runat="server" ControlToValidate="ddlConsEng" Display="Dynamic" ErrorMessage="Please select engineer from drop down list." ForeColor="Red" InitialValue="Null"></asp:RequiredFieldValidator>
                </p>

            </div>

            <div class="right-controls mt-medium mr-small">
                <asp:Button ID="btnSubmit" class="button-main primary-btn" Text="Create Project" runat="server" OnClick="btnSubmit_Click" />
            </div>

        </div>


</asp:Content>
