<%@ Page Title="Edit Fan Reference" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EditFanLocation.aspx.cs" Inherits="CFM_Web.Projects.EditFanLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        #ddFanType1:focus {
            height:200px;
        } 
        .redborder {border: 1px solid red !important;}
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
                <td class="small-td" style="width: 35%">Fan Reference</td>
                <td class="small-td">
                    <asp:TextBox ID="txtDesignation"  CssClass="redborder" runat="server" AutoCompleteType="Disabled"/></td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fan Reference is empty" ForeColor="Red" ControlToValidate="txtDesignation"></asp:RequiredFieldValidator>
                </td>
            </tr>            
            <tr>
                <td class="small-td" style="width: 30%">Fan Reference Description</td>
                <td class="small-td">
                    <asp:TextBox ID="txtFRDescription"  runat="server" AutoCompleteType="Disabled"/></td>
                <td class="small-td">
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
                    <asp:DropDownList ID="ddFanType1"  CssClass="redborder" runat="server" AutoCompleteType="Disabled" AutoPostBack="true"  >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="small-td">Fan Model</td>
                <td class="small-td">
                    <asp:TextBox ID="txtModelNum" runat="server" AutoCompleteType="Disabled" ></asp:TextBox>
                    <asp:Label ID="lblModelNumMsg" runat="server" Visible="false"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td class="small-td">Airflow (l/s)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtAirflow"  CssClass="redborder" runat="server" AutoCompleteType="Disabled"  />
                </td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="AirflowRequiredValidator" runat="server"  
                        ErrorMessage="Airflow is empty" ForeColor="Red" ControlToValidate="txtAirflow"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Static Pressure (Pa)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtStPressure"  CssClass="redborder" runat="server"  AutoCompleteType="Disabled" />
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
                <td class="small-td">Sound pressure level @ 3m (dBA)</td>
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
                <td class="small-td"><strong>Sound Power (dB)</strong></td>
                <td class="small-td">
                
                </td>
            </tr>
            <tr ID="oem_row7" runat="server" visible="false">
                <td class="small-td" align="center">63Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz63" runat="server"  AutoCompleteType="Disabled" Width="15%" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row8" runat="server" visible="false">
                <td class="small-td" align="center"> 125Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz125" runat="server"  AutoCompleteType="Disabled" Width="15%"  /></td>
                <td>
                </td>
            </tr>

            <tr ID="oem_row9" runat="server" visible="false">
                <td class="small-td" align="center"> 250Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz250" runat="server"  AutoCompleteType="Disabled" Width="15%"  /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row10" runat="server" visible="false">
                <td class="small-td" align="center"> 500Hz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz500" runat="server"  AutoCompleteType="Disabled" Width="15%"  /></td>
                <td>
                </td>
            </tr>		
            <tr ID="oem_row11" runat="server" visible="false">
                <td class="small-td" align="center"> 1kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz1k" runat="server"  AutoCompleteType="Disabled" Width="15%"  /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row12" runat="server" visible="false">
                <td class="small-td" align="center"> 2kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz2k" runat="server"  AutoCompleteType="Disabled" Width="15%" /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row13" runat="server" visible="false">
                <td class="small-td" align="center"> 4kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz4k" runat="server"  AutoCompleteType="Disabled" Width="15%"  /></td>
                <td>
                </td>
            </tr>			
            <tr ID="oem_row14" runat="server" visible="false">
                <td class="small-td" align="center"> 8kHz</td>
                <td class="small-td">
                    <asp:TextBox ID="txtHz8k" runat="server"  AutoCompleteType="Disabled" Width="15%"  /></td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row15" runat="server" visible="false">
                <td class="small-td">Sound All Bands (dBW)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtAllBands" runat="server"  AutoCompleteType="Disabled"  Width="15%"  />
                    <asp:Label ID="lblAllBandsA" runat="server"></asp:Label>
                </td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row15b" runat="server" visible="false">
                <td class="small-td">Sound pressure level @ 3m (dBA)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtSpl3m" runat="server"  AutoCompleteType="Disabled"/>
                   
                </td>
                <td>
                </td>
            </tr>
            <tr ID="oem_row20" runat="server" visible="false">
                <td class="small-td" colspan="2" ><strong>Performance curve data points<br /><span style="color:#bb0000">Add 5 points, or leave all blank.</span></strong></td>
            </tr>
            </table>
        <table class="table table-form" style="width: 60%">
            <tr ID="oem_row20b" runat="server" visible="false">
                <td>&nbsp;</td>
                <td class="small-td"><strong>Airflow</strong></td>
                <td class="small-td"><strong>Static Pressure</strong></td>
            </tr>
            <tr ID="oem_row21" runat="server" visible="false">
                <td class="small-td" style="text-align:right">Point 1</td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtaf_1" runat="server"  AutoCompleteType="Disabled" /></td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtsp_1" runat="server"  AutoCompleteType="Disabled" /></td>
            </tr>
            <tr ID="oem_row22" runat="server" visible="false">
                <td class="small-td" style="text-align:right">Point 2</td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtaf_2" runat="server"  AutoCompleteType="Disabled" /></td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtsp_2" runat="server"  AutoCompleteType="Disabled" /></td>
            </tr>
            <tr ID="oem_row23" runat="server" visible="false">
                <td class="small-td" style="text-align:right">Point 3</td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtaf_3" runat="server"  AutoCompleteType="Disabled" /></td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtsp_3" runat="server"  AutoCompleteType="Disabled" /></td>
            </tr>
            <tr ID="oem_row24" runat="server" visible="false">
                <td class="small-td" style="text-align:right">Point 4</td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtaf_4" runat="server"  AutoCompleteType="Disabled" /></td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtsp_4" runat="server"  AutoCompleteType="Disabled" /></td>
            </tr>
            <tr ID="oem_row25" runat="server" visible="false">
                <td class="small-td" style="text-align:right">Point 5</td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtaf_5" runat="server"  AutoCompleteType="Disabled" /></td>
                <td class="small-td"><asp:TextBox Width="90%" ID="txtsp_5" runat="server"  AutoCompleteType="Disabled" /></td>
            </tr>

        </table>
        <div class="right-controls mt-medium mr-small">
            <asp:Button ID="btnSave"  class="button-main primary-btn" Text="Submit" runat="server" OnClick="btnSave_Click" />
        </div>

        <asp:Label class="mt-solid" ID="lblEditFanLocMsg" runat="server" />
    </div>

<script>
        // Attach onblur event to each field
    window.onload = function () {
        const freqFields = [
            "body_txtHz63",
            "body_txtHz125",
            "body_txtHz250",
            "body_txtHz500",
            "body_txtHz1k",
            "body_txtHz2k",
            "body_txtHz4k",
            "body_txtHz8k"
        ];

        freqFields.forEach(fieldId => {
            const field = document.getElementById(fieldId);
            field.onblur = calculateSPL;
        });
    };

function calculateSPL() {
    // Array of input element IDs for sound power levels
    const inputIds = [
        "body_txtHz63",
        "body_txtHz125",
        "body_txtHz250",
        "body_txtHz500",
        "body_txtHz1k",
        "body_txtHz2k",
        "body_txtHz4k",
        "body_txtHz8k"
    ];

    // A-weighting factors for each frequency band
    const aWeightingFactors = [
        -26.2, // 63Hz
        -16.1, // 125Hz
        -8.6,  // 250Hz
        -3.2,  // 500Hz
        0,     // 1kHz
        1.2,   // 2kHz
        1,     // 4kHz
        -1.1   // 8kHz
    ];

    let validInputs = true; // Flag to track validation
    let totalSoundPower = 0;    // Sum of power for dB calculation
    let totalAWeightedPower = 0; // Sum of A-weighted power for dBA calculation

    // Loop through all input fields to validate and calculate
    inputIds.forEach((id, index) => {
        const inputElement = document.getElementById(id);
        const value = parseInt(inputElement.value, 10);

        if (isNaN(value) || value <= 0) {
            // Invalid input: Set border to red
            inputElement.style.borderColor = "red";
            validInputs = false;
        } else {
            // Valid input: Reset border and calculate power levels
            inputElement.style.borderColor = "";
            totalSoundPower += Math.pow(10, value / 10); // Raw dB calculation
            totalAWeightedPower += Math.pow(10, (value + aWeightingFactors[index]) / 10); // A-weighted calculation
        }
    });

    if (validInputs) {
        // Calculate total sound power levels
        const totalLevel = 10 * Math.log10(totalSoundPower); // Total in dB
        const totalALevel = 10 * Math.log10(totalAWeightedPower); // Total in dBA

        // Set the results in the appropriate fields
        document.getElementById("body_txtAllBands").value = Math.round(totalLevel); // dB
        document.getElementById("body_txtSoundPressure").value = Math.round(totalALevel-21); // dBA
        // Set the dBA result in the ASP Label
        const lblAllBandsA = document.getElementById('<%= lblAllBandsA.ClientID %>'); // Find the ASP Label
        if (lblAllBandsA) {
            lblAllBandsA.innerText = "(Calculated SPL@3m is "+Math.round(totalALevel-21)+" dBA)"; 
        }
    } 
    return false;
};
</script>
</asp:Content>
