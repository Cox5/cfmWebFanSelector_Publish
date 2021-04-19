<%@ Page Title="Ancillaries Categories" Language="C#" AutoEventWireup="true" CodeBehind="AncillariesCategory.aspx.cs" 
    Inherits="CFM_Web.Importers.AncillariesCategory" MasterPageFile="~/fanselection.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
                    <style>
                        .pencil {
                            min-width: 70px !important;
                        }
                        .paddingleft {
                            padding-left: 10px;
                        }

                    </style>
      <asp:Panel ID="Panel1" runat="server" >

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>
        <h3>Edit Ancillaries Categories</h3>
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        </asp:Panel>
        <div runat="server" id="CCGV_DIV" style="max-width: 400px;">
             <asp:GridView ID="gvCC" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvCC_RowCommand"
                 OnRowEditing="gvCC_RowEditing" OnRowCancelingEdit="gvCC_RowCancelingEdit"
                 OnRowUpdating="gvCC_RowUpdating" OnRowDeleting="gvCC_RowDeleting" >
                <Columns>
              <asp:TemplateField  HeaderText="id" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtId" Text='<%#Eval("id") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIdFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("id") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="Category Name" ControlStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCatName" Text='<%#Eval("category_name") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCatNameFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("category_name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="Default Quantity" ControlStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDefQty" Text='<%#Eval("default_qty") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDefQtyFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("default_qty") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>



             <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit </span></span>
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
                          <asp:LinkButton runat="server" ID="ButtonAdd"  CssClass="" OnClick="ButtonAdd_Click" ><i class="tooltip fas fa-plus-circle"></i> Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>


             <asp:TemplateField ItemStyle-Width="40px"  HeaderStyle-Width="40px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton data-delete='<%# Eval("id") %>'  runat="server" CommandName="" CausesValidation="false" 
                                onClick="BtnDelete_Click" Visible="false" >
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete </span></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                       </EditItemTemplate>
                       <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>


                    </Columns>
                 </asp:GridView>
        </div>
    </div>
</asp:Content>
