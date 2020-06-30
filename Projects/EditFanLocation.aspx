<%@ Page Title="Edit Fan Reference" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EditFanLocation.aspx.cs" Inherits="CFM_Web.Projects.EditFanLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        #ddFanType1:focus {
            height:200px;
        } 
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
        <table class="table table-form" >
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
                    <asp:DropDownList ID="ddFanType1" runat="server" AutoCompleteType="Disabled">
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
                    <asp:TextBox ID="txtStPressure" runat="server"  AutoCompleteType="Disabled" /></td>
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
                <td class="small-td">Sound Pressure (dBA @ 3m)</td>
                <td class="small-td">
                    <asp:TextBox ID="txtSoundPressure" runat="server" AutoCompleteType="Disabled" /></td>
                </td>
            </tr>
            <tr>
                <td class="small-td">Motor Type</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddMotorType1" runat="server" ></asp:DropDownList>
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
        </table>
        <div class="right-controls mt-medium mr-small">
            <asp:Button ID="btnSave"  class="button-main primary-btn" Text="Submit" runat="server" OnClick="btnSave_Click" />
        </div>

        <asp:Label class="mt-solid" ID="lblEditFanLocMsg" runat="server" />
    </div>
</asp:Content>
