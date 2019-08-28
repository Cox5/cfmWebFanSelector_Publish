<%@ Page Title="Edit Fan Location" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EditFanLocation.aspx.cs" Inherits="CFM_Web.Projects.EditFanLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title sub">Edit Fan Location</h1>
            </div>
        </div>

        <table class="table table-form">
            <tr>
                <td>Fan Location</td>
                <td>
                    <asp:TextBox ID="txtDesignation" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator class="mt-small"  ID="regLocDescValidator" runat="server" ErrorMessage="Fan Location is empty" ForeColor="Red" ControlToValidate="txtDesignation"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Fan Model</td>
                <td>
                    <asp:TextBox ID="txtModelNum" runat="server" ReadOnly></asp:TextBox>
                    <asp:Label ID="lblModelNumMsg" runat="server"></asp:Label>
                </td>
                <td>

                </td>
                
            </tr>
            <tr>
                <td>Airflow</td>
                <td>
                    <asp:TextBox ID="txtAirflow" runat="server" />

                </td>
                <td>
                    <asp:RequiredFieldValidator class="mt-small"  ID="AirflowRequiredValidator" runat="server" ErrorMessage="Airflow is empty" ForeColor="Red" ControlToValidate="txtAirflow"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td>Static Pressure</td>
                <td>
                    <asp:TextBox ID="txtStPressure" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator class="mt-small"  ID="StPressRequiredValidator" runat="server" ErrorMessage="Static Pressure is empty" ForeColor="Red" ControlToValidate="txtStPressure"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server" />

                </td>
                <td>
                    <asp:RangeValidator ID="rangeQtyValidator" runat="server" ControlToValidate="txtQuantity" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Please enter valid quantity number" ForeColor="Red"></asp:RangeValidator>
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
