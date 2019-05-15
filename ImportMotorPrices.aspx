<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportMotorPrices.aspx.cs" Inherits="CFM_Web.ImportMotorPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <h3>Upload motor prices from Excel (.xls) file</h3>


        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
        <br />
        <%--<h4>Prices that were imported recently</h4>--%>
        <asp:Button ID="btnImportMotorPrices" runat="server" Visible="false" Text="Import Motor Prices" OnClick="btnImportMotorPrices_Click" />
        <br />
        <asp:Label ID="lblDBMessage" runat="server"></asp:Label>
        <br />
                <asp:GridView ID="gridView" runat="server">

        </asp:GridView>

        <h4>Motor prices which are already imported:</h4>
        <asp:GridView ID="gridViewImported" runat="server"></asp:GridView>
    </div>

</asp:Content>
