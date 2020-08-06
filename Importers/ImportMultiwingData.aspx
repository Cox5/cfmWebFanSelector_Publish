<%@ Page Title="Multiwing Data Importer" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportMultiwingData.aspx.cs" Inherits="CFM_Web.Importers.ImportMultiwingData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        
        <asp:Label ID="folderPath" runat="server" Visible="false"></asp:Label>

        <h3>Upload Multiwing .ZIP archive</h3>


        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload .ZIP" OnClick="UploadButton_Click" class="button-main primary-btn"/>
        <asp:Button runat="server" ID="btnNew" Text="New Upload" OnClick="btnNew_Click" class="button-main primary-btn" Visible="false"/>
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
        <br />
        <div runat="server" id="FilesListContainer">
        </div>
        
        <asp:Button ID="btnAll" class="button-main primary-btn"  runat="server" Visible="true" Text="Process All uploaded .XLSX files" OnClick="btnAll_Click" />

        <h4> Click the button to process the extracted XLSX files.</h4>
        <p> <em>Note:</em> processing time for a zip file with 8 files, each with 31 impeller variants/angles (248 impellers) is approximately  </p>
        <ul>
            <li>2 minutes for 4 prefixes</li>
            <li>4.5 minutes for 9 prefixes</li>
        </ul>
        <asp:Button ID="btnParse" class="button-main primary-btn"  runat="server" Visible="false" Text="Process .XLSX files" OnClick="btnParse_Click" />

        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>

    <h3>Results of last batch:</h3>
       <div runat="server" id="ProcessPointsContainer">
        <br />
    </div>
                </div>
</asp:Content>

        