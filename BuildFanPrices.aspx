<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="BuildFanPrices.aspx.cs" Inherits="CFM_Web.BuildFanPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <h3>Calculated prices based on impeller for MUA fans</h3>
    <br />
    <asp:GridView ID="gridView" runat="server">
    </asp:GridView>

</asp:Content>
