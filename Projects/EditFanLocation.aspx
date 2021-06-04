<%@ Page Title="Edit Fan Reference" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EditFanLocation.aspx.cs" Inherits="CFM_Web.Projects.EditFanLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        #ddFanType1:focus {
            height:200px;
        } 
        .oem_row { visibility: hidden; display:none;}
    </style>
    <div class="content-wrapper" style ="max-width: 700px; margin: auto auto">

        <div class="mb-solid mt-solid">
                <div class="table-controls">
                    <div style="display: inline-block; float: left;">
                       <h1 class="table-title sub">Edit Fan Reference</h1>
                   </div>
                   <div class="right-controls mt-medium mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Cancel" OnClick="btnCancel_Click" runat="server" />
                    </div>
                </div> 
                <div style="clear:both">
                    <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
                    </div>
            </div>
        <asp:TextBox ID="txtPriceType" runat="server" AutoCompleteType="Disabled" Visible="false"></asp:TextBox>
        <asp:HiddenField ID="hiddenFandataid" runat="server" />
        <table class="table table-form" >
            <tr>
           <td class="small-td">Fan Manufacturer</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddFanManufacturer" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="ddFanManufacturer_Change">
                        <asp:ListItem value="CFM">CFM</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblManufChange" runat="server"></asp:Label>
                    <asp:Button ID="btnCancel2"  class="button-main primary-btn prevpage" Text="Cancel" OnClick="btnCancel2_Click" runat="server" Visible="false"/>
                    <asp:Button ID="btnConfirm" class="button-main primary-btn " Text="Confirm" OnClick="btnConfirm_Click" runat="server" Visible="false"/>
                </td>
            </tr>
            
            <tr>
                <td class="small-td" style="width: 30%">Fan Reference</td>
                <td class="small-td">
                    <asp:TextBox ID="txtDesignation" runat="server" AutoCompleteType="Disabled"/></td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="regLocDescValidator" runat="server" ErrorMessage="Fan Reference is empty" ForeColor="Red" ControlToValidate="txtDesignation"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Quantity</td>
                <td class="small-td">
                    <asp:TextBox ID="txtQuantity" runat="server" AutoCompleteType="Disabled"/>
                </td>
                <td class="small-td">
                    <asp:RangeValidator ID="rangeQtyValidator" runat="server" ControlToValidate="txtQuantity" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Please enter valid quantity number" ForeColor="Red"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Fan Type</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddFanType1" runat="server" AutoCompleteType="Disabled" AutoPostBack="true"  >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="small-td">Fan Model</td>
                <td class="small-td">
                    <asp:TextBox ID="txtModelNum" runat="server" AutoCompleteType="Disabled" ReadOnly="true"></asp:TextBox>
                    <asp:Label ID="lblModelNumMsg" runat="server" Visible="false"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td class="small-td">Airflow (l/s)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtAirflow" runat="server" AutoCompleteType="Disabled"  />
                </td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="AirflowRequiredValidator" runat="server"  
                        ErrorMessage="Airflow is empty" ForeColor="Red" ControlToValidate="txtAirflow"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Static Pressure (Pa)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtStPressure" runat="server"  AutoCompleteType="Disabled" />
                </td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="StPressRequiredValidator" runat="server"  
                        ErrorMessage="Static Pressure is empty" ForeColor="Red" ControlToValidate="txtStPressure"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Diameter (mm)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtDiameter" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
             <tr>
                <td class="small-td">Sound pressure (dBA @ 3m)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtSoundPressure" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="small-td">Speed (RPM)</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddSpeed1" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="small-td">Phase</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddPhase1" runat="server" ></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="small-td">Motor Type</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddMotorType1" runat="server" AutoPostBack="true"  ></asp:DropDownList><br />
                    <asp:Label ID="lblSmokeSpill" runat="server" Visible="false" ForeColor="DarkRed">Fan type is smoke spill, but motor type is not.</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="small-td">Blade Material</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddBlade1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="small-td">Ancillaries</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddAncill1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr ID="oem_row1" runat="server" visible="false"><td colspan="2"><strong>OEM Fan extra info</strong></td></tr>
            <tr ID="oem_row2" runat="server"  visible="false">
                <td class="small-td">Description</td>
                <td class="small-td">
                    <asp:TextBox  ID="txtDescription" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
           <tr ID="oem_row16" runat="server"  visible="false">
                <td class="small-td">Fan Model</td>
                <td class="small-td">
                    <asp:TextBox ID="txtAngle" runat="server"  AutoCompleteType="Disabled" />
                </td>
            </tr>
            <tr ID="oem_row17" runat="server"  visible="false">
                <td class="small-td">Actual Airflow (l/s)</td>
                <td class="small-td">
                    <asp:TextBox  ID="txtAcAF" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row18" runat="server"  visible="false">
                <td class="small-td">Actual Static Pressure (Pa)</td>
                <td class="small-td">
                    <asp:TextBox  ID="txtAcSP" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row3" runat="server" visible="false">
                <td class="small-td">Fan Weight (kg) </td>
                <td class="small-td">
                    <asp:TextBox ID="txtFanWeight" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>		
            <tr ID="oem_row4" runat="server" visible="false">
                <td class="small-td">Motor Power (kW)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtMotorPower" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row5" runat="server" visible="false">
                <td class="small-td">Motor AOM Power (kW)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtMotorAOMPower" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row6" runat="server" visible="false">
                <td class="small-td">Motor FLC (Amps)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtMotorFLC" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row6b" runat="server" visible="false">
                <td class="small-td">Motor AOM FLC (Amps)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtMotorAOMFLC" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row7a" runat="server" visible="false">
                <td class="small-td"><strong>Sound Power (dBA)</strong></td>
                <td class="small-td">
                
                </td>
            </tr>
            <tr ID="oem_row7" runat="server" visible="false">
                <td class="small-td" align="center">63Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz63" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row8" runat="server" visible="false">
                <td class="small-td" align="center"> 125Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz125" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>

            <tr ID="oem_row9" runat="server" visible="false">
                <td class="small-td" align="center"> 250Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz250" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row10" runat="server" visible="false">
                <td class="small-td" align="center"> 500Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz500" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>		
            <tr ID="oem_row11" runat="server" visible="false">
                <td class="small-td" align="center"> 1kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz1k" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row12" runat="server" visible="false">
                <td class="small-td" align="center"> 2kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz2k" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row13" runat="server" visible="false">
                <td class="small-td" align="center"> 4kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz4k" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>			
            <tr ID="oem_row14" runat="server" visible="false">
                <td class="small-td" align="center"> 8kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz8k" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row15" runat="server" visible="false">
                <td class="small-td">Sound All Bands (dBA)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtAllBands" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row15b" runat="server" visible="false">
                <td class="small-td">Sound pressure (dBA @ 3m)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtSpl3m" runat="server"  AutoCompleteType="Disabled" /></td>
                <td>
                </td>
            </tr>



        </table>
        <div class="right-controls mt-medium mr-small">
            <asp:Button ID="btnSave"  class="button-main primary-btn" Text="Submit" runat="server" OnClick="btnSave_Click" />
        </div>

        <asp:Label class="mt-solid" ID="lblEditFanLocMsg" runat="server" />
    </div>
</asp:Content>
