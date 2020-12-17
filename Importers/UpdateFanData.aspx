<%@ Page Title="UpdateFanData to add max af, sp" Language="C#"   AutoEventWireup="true" CodeBehind="UpdateFanData.aspx.cs"        Inherits="CFM_Web.Importers.UpdateFanData"   MasterPageFile="~/fanselection.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <h3>Update fandata table</h3>
<div class="table-controls mb-medium">
 
</div>
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <asp:TextBox ID="txtCount" runat="server"></asp:TextBox>

        <div runat="server" id="FanListDiv">
        </div>


        <br />
    </div>
    </asp:Content>


        

