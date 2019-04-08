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
                        <asp:TextBox ID="txtDescription" Text='<%#Eval("description") %>' runat="server"  CssClass="input-small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="descRequiredValidator" runat="server" ErrorMessage="Description field is empty" ForeColor="Red" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDescriptionFooter" runat="server" CssClass="input-small"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Catalogue Number" ItemStyle-Width="160px" HeaderStyle-Width="160px"  HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("catalogue_id") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCatalogueNumber" Text='<%#Eval("catalogue_id") %>' runat="server"  CssClass="input-small"></asp:TextBox>
                        <asp:CustomValidator ID="catalogueNumCustomValidator" runat="server" ErrorMessage="..."></asp:CustomValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCatalogueNumberFooter" runat="server" Width="160px" CssClass="input-small"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  HeaderText="Qty" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("quantity") %>' runat="server" HorizontalAlign="Center"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQuantity" Text='<%#Eval("quantity") %>' runat="server" HorizontalAlign="Center" CssClass="input-small center-text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="qtyRequiredValidator" runat="server" ErrorMessage="Qty field is empty" ForeColor="Red" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtQuantityFooter" runat="server" Width="70px" CssClass="input-small center-text"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Unit Price ($)" ItemStyle-Width="140px" HeaderStyle-Width="140px" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("unit_price") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUnitPrice" Text='<%#Eval("unit_price") %>' runat="server" CssClass="input-small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="priceRequiredValidator" runat="server" ErrorMessage="Price field is empty" ForeColor="Red" ControlToValidate="txtUnitPrice"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUnitPriceFooter" runat="server" Width="140px" CssClass="input-small"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                            <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit</span></span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Delete" CausesValidation="false">
                                <span class="tooltip"><i class="far fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete</span></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton runat="server" CommandName="Update" >
                            <span class="tooltip"><i class="far fa-save"></i><span class="tooltiptext tooltip-i">Update</span></span>
                        </asp:LinkButton>
                        <asp:LinkButton  runat="server" CommandName="Cancel" CausesValidation="false" >
                            <span class="tooltip"><i class="tooltip fas fa-times-circle"></i><span class="tooltiptext tooltip-i">Cancel</span></span>
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton runat="server" CommandName="Add" CssClass="button-main primary-btn"><i class="tooltip fas fa-plus-circle"></i> Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>

            </Columns>


        </asp:GridView>

        <br />

        <asp:Label ID="lblSuccessMsg" runat="server" ForeColor="Green"></asp:Label>
        <br />
        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" CssClass="mb-small"></asp:Label>
        <br />

        <div class="right-controls mb-small">

            <asp:LinkButton runat="server" CommandName="Finish" OnClick="btnFinish_Click" class="button-main primary-btn" >Finished <i class="fas fa-chevron-right"></i></asp:LinkButton>
            <!-- <asp:Button ID="btnFinish" Text="Finished" runat="server" OnClick="btnFinish_Click" class="button-main primary-btn" CausesValidation="false" /> -->
        </div>

    </div>
</asp:Content>
