﻿<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportComponents.aspx.cs" Inherits="CFM_Web.ImportComponents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <h3>Upload components from Excel (.xls) file</h3>


        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
        <br />
        <%--<h4>Prices that were imported recently</h4>--%>
        <asp:Button ID="btnImportPrices" runat="server" Visible="false" Text="Import Components" OnClick="btnImportComponents_Click" />
        <br />
        <asp:Label ID="lblDBMessage" runat="server"></asp:Label>
        <br />
                <asp:GridView ID="gridView" runat="server">

        </asp:GridView>

        <h4>Components which are already imported:</h4>
        <asp:GridView ID="gridViewImported" runat="server"></asp:GridView>
    </div>

</asp:Content>
