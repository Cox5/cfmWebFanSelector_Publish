<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportPrices.aspx.cs" Inherits="CFM_Web.ImportPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
        <h3>Upload fan pricelist from <asp:Label ID="lblFileName" runat="server"></asp:Label></h3>


<%--        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />--%>

        <h4>Pricelist ready for import</h4>
        <asp:Button ID="btnImportPrices" runat="server" Text="Import Prices" OnClick="btnImportPrices_Click" />
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <br />
        <asp:GridView ID="gridView" runat="server">

        </asp:GridView>

        <h4>Items that were not found in database</h4>
        <asp:GridView ID="gridViewNoMatch" runat="server"></asp:GridView>
        
    </div>

</asp:Content>
