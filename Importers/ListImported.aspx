<%@ Page Title="Multiwing Import List" Language="C#"   AutoEventWireup="true" CodeBehind="ListImported.aspx.cs"        Inherits="CFM_Web.Importers.ListImported" MasterPageFile="~/fanselection.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <h3>List Built-up fans in database</h3>
<div class="table-controls mb-medium">
          <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for fan partnumber prefix" Width="300px" Height="32px"  Autocomplete="off"></asp:TextBox>
    <asp:DropDownList ID="ddImpeller" runat="server">
        <asp:ListItem Value="Yes">With impeller defined (built up fans)</asp:ListItem>
        <asp:ListItem Value="No">Without impeller defined</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="ddAngle" runat="server">
        <asp:ListItem Value="Yes">With angles like (50)</asp:ListItem>
        <asp:ListItem Value="No">Without angles like (50)</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="ddGroupAngles" runat="server">
        <asp:ListItem Value="Yes">Group all angles together</asp:ListItem>
        <asp:ListItem Value="No">List all angles separately</asp:ListItem>
    </asp:DropDownList>
           <asp:Button ID="btnListFan" class="button-main primary-btn"  runat="server" Visible="true" Text="List fans" OnClick="BtnListFan_click" />
</div>
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <div runat="server" id="FanListDiv">
        </div>

       
        <br />
    </div>
    </asp:Content>








        
