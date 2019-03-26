<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ExtraItems.aspx.cs" Inherits="CFM_Web.Projects.ExtraItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">

                <h1>
                    <span id="projectName" class="project-name" runat="server">
                        <asp:Label ID="lblProjectName" runat="server"></asp:Label></span>
                </h1>
            </div>

        </div>

        <asp:GridView ID="gvExtraItems" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
            DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvExtraItems_RowCommand" OnRowEditing="gvExtraItems_RowEditing" OnRowCancelingEdit="gvExtraItems_RowCancelingEdit" OnRowUpdating="gvExtraItems_RowUpdating" OnRowDeleting="gvExtraItems_RowDeleting"> 


            <Columns>

                <asp:TemplateField HeaderText="Item Description" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("description") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescription" Text='<%#Eval("description") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDescriptionFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Catalogue Number" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("catalogue_id") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCatalogueNumber" Text='<%#Eval("catalogue_id") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCatalogueNumberFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qty" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("quantity") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQuantity" Text='<%#Eval("quantity") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtQuantityFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Unit Price ($)" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("unit_price") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUnitPrice" Text='<%#Eval("unit_price") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUnitPriceFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/icons/editblue.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="18px" Height="18px"></asp:ImageButton>
                        <asp:ImageButton ImageUrl="~/icons/deleteblue.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="18px" Height="18px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/icons/saveblue.png" runat="server" CommandName="Update" ToolTip="Update" Width="18px" Height="18px" />
                        <asp:ImageButton ImageUrl="~/icons/cancelblue.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="18px" Height="18px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ImageUrl="~/icons/addblue.png" runat="server" CommandName="Add" ToolTip="Add" Width="18px" Height="18px" />
                    </FooterTemplate>
                </asp:TemplateField>

            </Columns>


        </asp:GridView>

        <br />

        <div class="right-controls mt-medium mr-small">

            <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>
            <asp:Button ID="btnFinish" Text="Finished" runat="server" OnClick="btnFinish_Click" class="button-main primary-btn" CausesValidation="false" />
        </div>

    </div>
</asp:Content>
