<%@ Page Title="Multiwing Fan Deletion" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="DeleteFans.aspx.cs" Inherits="CFM_Web.Importers.DeleteFans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <h3>Delete Built-up fans from database</h3>
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
           <asp:Button ID="btnDeleteFan" class="button-main primary-btn"  runat="server" Visible="true" Text="List fans" OnClick="BtnDeleteFan_click" />
            <asp:Button ID="btnConfirmDelete" class="button-main primary-btn"  runat="server" Visible="false" Text="Confirm Delete" OnClick="BtnConfirmDelete_click" />
</div>
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <div runat="server" id="FansToDelete">
        </div>

       
        <br />
    </div>
</asp:Content>

