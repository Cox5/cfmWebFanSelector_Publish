<%@ Page Title="Edit Fan Reference" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EditFanLocation.aspx.cs" Inherits="CFM_Web.Projects.EditFanLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper" style ="max-width: 700px; margin: auto auto">

        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title sub">Edit Fan Reference</h1>
            </div>
        </div>
        <table class="table table-form" >
            <tr>
                <td class="small-td" style="width: 30%">Fan Reference</td>
                <td class="small-td">
                    <asp:TextBox ID="txtDesignation" runat="server" /></td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="regLocDescValidator" runat="server" ErrorMessage="Fan Reference is empty" ForeColor="Red" ControlToValidate="txtDesignation"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Quantity</td>
                <td class="small-td">
                    <asp:TextBox ID="txtQuantity" runat="server" />
                </td>
                <td class="small-td">
                    <asp:RangeValidator ID="rangeQtyValidator" runat="server" ControlToValidate="txtQuantity" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Please enter valid quantity number" ForeColor="Red"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Fan Type</td>
                <td class="small-td">
                    <asp:DropDownList ID="ddFanType1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="small-td">Fan Model</td>
                <td class="small-td">
                    <asp:TextBox ID="txtModelNum" runat="server" ></asp:TextBox>
                    <asp:Label ID="lblModelNumMsg" runat="server"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td class="small-td">Airflow</td>
                <td class="small-td">
                    <asp:TextBox ID="txtAirflow" runat="server" />
                </td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="AirflowRequiredValidator" runat="server" ErrorMessage="Airflow is empty" ForeColor="Red" ControlToValidate="txtAirflow"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Static Pressure</td>
                <td class="small-td">
                    <asp:TextBox ID="txtStPressure" runat="server" /></td>
                <td class="small-td">
                    <asp:RequiredFieldValidator class="mt-small"  ID="StPressRequiredValidator" runat="server" ErrorMessage="Static Pressure is empty" ForeColor="Red" ControlToValidate="txtStPressure"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="small-td">Diameter</td>
                <td class="small-td">
                    <asp:TextBox ID="txtDiameter" runat="server" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="small-td">Speed / Phase / Motor Type</td>
                <td class="small-td"><asp:DropDownList ID="ddSpeed1" runat="server" >
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddPhase1" runat="server" >
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddMotorType1" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="small-td">Sound Pressure</td>
                <td class="small-td">
                    <asp:TextBox ID="txtSoundPressure" runat="server" /></td>
                
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
            <asp:Button ID="btnCancel"  class="button-main quarternary-btn" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" /><br />
        </div>

        <asp:Label class="mt-solid" ID="lblEditFanLocMsg" runat="server" />
    </div>
</asp:Content>
