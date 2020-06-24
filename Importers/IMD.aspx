<%@ Page Title="Multiwing Data Importer" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="IMD.aspx.cs" Inherits="CFM_Web.Importers.IMD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <asp:Button ID="btnParse2" class="button-main primary-btn"  runat="server" Visible="true" Text="Parse" OnClick="btnParse_Click2" />
       
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <div runat="server" id="ProcessPointsContainer">
        </div>

       
        <br />
    </div>
</asp:Content>

        