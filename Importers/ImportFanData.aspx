<%@ Page Title="Fan Data Importer" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportFanData.aspx.cs" Inherits="CFM_Web.Importers.ImportFanData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
        <h3>Upload FanData from Excel (.xls) file</h3>


        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
        <br />


        <asp:Button ID="btnDownloadCSV" class="button-main primary-btn"  runat="server" Visible="false" Text="Download as CSV" OnClick="btnDownloadCSV_Click"/>
        <asp:Button ID="btnImportFanData" class="button-main primary-btn" runat="server" Visible="false" Text="Import Components" OnClick="btnImportFanData_Click" />
        <br />
        <asp:Label ID="lblDBMessage" runat="server"></asp:Label>

       
        <br />
               

        
    </div>
</asp:Content>
