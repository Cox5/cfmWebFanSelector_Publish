<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="BuildFanPrices.aspx.cs" Inherits="CFM_Web.BuildFanPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">

        <h3>Calculated prices based on impeller code, motor info and case info for MUA fans</h3>
        <br />

        <div class="right-button clearfix"><asp:Button id="csvBtn" runat="server" Text="Download as CSV" OnClick="csvBtn_Click" class="button-main primary-btn"/></div>
        
        <p>
            Notes: <br />
            1. Impeller Code, FanModelNumber columns are fetched from fan/fandata JOINED tables<br />
            2. Hub, BladeShape, BladeMaterial, ImpellerPrice are fetched from impeller_price table
        </p>

           
           

        <asp:GridView ID="gridView" runat="server"   CssClass="table project">
        </asp:GridView>

    </div>
</asp:Content>
