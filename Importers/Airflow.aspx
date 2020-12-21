<%@ Page Title="Catalogue Fan Editor" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Airflow.aspx.cs" Inherits="CFM_Web.Importers.Airflow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

        <h3>Set Max Airflow and curve SP values.</h3>
        Select number of fans to process
<div class="table-controls mb-medium">
        <asp:DropDownList ID="ddlCount" runat="server">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>

            <asp:ListItem Value="100">100</asp:ListItem>
            <asp:ListItem Value="1000">1000</asp:ListItem>
            <asp:ListItem Value="10000">10000</asp:ListItem>
            <asp:ListItem Value="25000">25000</asp:ListItem>
            <asp:ListItem Value="50000">50000</asp:ListItem>
            <asp:ListItem Value="75000">75000</asp:ListItem>
            <asp:ListItem Value="100000">100000</asp:ListItem>

        </asp:DropDownList>
           <asp:Button ID="btnGo" class="button-main primary-btn"  runat="server" Visible="true" Text="Go" OnClick="BtnGo_click" />
         
    <asp:Label ID="lblInfo" runat="server"></asp:Label>
    <div id="FanListDiv" runat="server">

         </div>
</div>
        </div>
</asp:Content>

    
