﻿<%@ Page Title="Multiwing Data Importer" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportMultiwingData.aspx.cs" Inherits="CFM_Web.Importers.ImportMultiwingData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        
        <asp:Label ID="folderPath" runat="server" Visible="false"></asp:Label>

        <h3>Upload Multiwing .ZIP archive</h3>


        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload .ZIP" OnClick="UploadButton_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
        <br />
        <div runat="server" id="FilesListContainer">
        </div>


        <asp:Button ID="btnParse" class="button-main primary-btn"  runat="server" Visible="false" Text="Parse .XLSX files" OnClick="btnParse_Click" />
       
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>


       
        <br />
    </div>
</asp:Content>

        