<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="BuildFanPrices.aspx.cs" Inherits="CFM_Web.BuildFanPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">

        <h3>Calculated prices based on impeller code for MUA fans</h3>
        <br />

        <p>
            Notes: <br />
            1. Impeller Code, FanModelNumber columns are fethced from fan/fandata JOINED tables<br />
            2. Hub, BladeShape, BladeMaterial, ImpellerPrice are fethed from impeller_price table
        </p>

        <asp:GridView ID="gridView" runat="server">
        </asp:GridView>

    </div>
</asp:Content>
