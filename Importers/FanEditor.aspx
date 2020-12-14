<%@ Page Title="Catalogue Fan Editor" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FanEditor.aspx.cs" Inherits="CFM_Web.Importers.FanEditor" %>
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
    <asp:DropDownList ID="ddBlade" runat="server">
        <asp:ListItem Value="Yes">With blade info like _4-8/3H</asp:ListItem>
        <asp:ListItem Value="No">Without blade info</asp:ListItem>
    </asp:DropDownList>
           <asp:Button ID="btnFindFan" class="button-main primary-btn"  runat="server" Visible="true" Text="List fans" OnClick="BtnFindFan_click" />

</div>
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <div runat="server" id="FanListDiv">

        </div>

        <div runat="server" id="FanGridView">
             <asp:GridView ID="gvFan" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvFan_RowCommand" 
                 OnRowEditing="gvFane_RowEditing" OnRowCancelingEdit="gvFan_RowCancelingEdit" 
                 OnRowUpdating="gvFan_RowUpdating" OnRowDeleting="gvFan_RowDeleting" > 

                <Columns>
                       
                    <asp:TemplateField  HeaderText="FanId" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanid") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanId" Text='<%#Eval("fanid") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFanIdFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField  HeaderText="PartNumber" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPartNumber" Text='<%#Eval("PartNumber") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPartNumberFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("PartNumber") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                 </asp:GridView>
        </div>

       
        <br />
    </div>
</asp:Content>