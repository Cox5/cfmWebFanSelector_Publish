<%@ Page Title="Multiwing Data Importer" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportMultiwingData.aspx.cs" Inherits="CFM_Web.Importers.ImportMultiwingData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        
        <asp:Label ID="folderPath" runat="server" Visible="false"></asp:Label>

        <h3>Upload Multiwing .ZIP archive</h3>


        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload .ZIP" OnClick="UploadButton_Click" class="button-main primary-btn"/>
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
        <br />
        <div runat="server" id="FilesListContainer">
        </div>
        


        <h4> Click the button to process the extracted XLSX files.</h4>
        <p> <em>Note:</em> processing time for a zip file with 20 files, each with 30 impeller variants/angles, for 2 fan prefixes (1200 fans in total) is approximately 2.5 minutes.</p>
        <asp:Button ID="btnParse" class="button-main primary-btn"  runat="server" Visible="false" Text="Process .XLSX files" OnClick="btnParse_Click" />
       
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>

    <h3>Results of last batch:</h3>
       <div runat="server" id="ProcessPointsContainer">
        <br />
    </div>
                </div>
</asp:Content>

        