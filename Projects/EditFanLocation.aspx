<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EditFanLocation.aspx.cs" Inherits="CFM_Web.Projects.EditFanLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
        <table>
            <tr>
                <td>Location Description</td>
                <td>
                    <asp:TextBox ID="txtLocation" runat="server" /></td>
            </tr>
            <tr>
                <td>Location Designation</td>
                <td>
                    <asp:TextBox ID="txtDesignation" runat="server" /></td>
            </tr>
            <tr>
                <td>Fan Model</td>
                <td>
                    <asp:TextBox ID="txtModelNum" runat="server"></asp:TextBox>
                    <asp:Label ID="lblModelNumMsg" runat="server"></asp:Label>
                </td>
                <td>

                </td>
                
            </tr>
            <tr>
                <td>Airflow</td>
                <td>
                    <asp:TextBox ID="txtAirflow" runat="server" /></td>
            </tr>
            <tr>
                <td>Static Pressure</td>
                <td>
                    <asp:TextBox ID="txtStPressure" runat="server" /></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server" /></td>
            </tr>
        </table>
        <asp:Button ID="btnSave" Text="Submit" runat="server" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" /><br />
        <asp:Label ID="lblEditFanLocMsg" runat="server" />
    </div>
</asp:Content>
