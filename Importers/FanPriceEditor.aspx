<%@ Page Language="C#" Title="Fan Price Editor" AutoEventWireup="true"  MasterPageFile="~/fanselection.Master" CodeBehind="FanPriceEditor.aspx.cs" Inherits="CFM_Web.Importers.FanPriceEditor" %>

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
      <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindgvFanPrice">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>
        <h3>Edit Standard Fan Prices</h3>
          <b>Note: this is only for standard fans, not built-up fans.</b><br />
          Part number must match what is in the Fan table.

        <br />
         <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium">
                <div style="float:left;  margin-top: 15px">Search by Part Number</div>
                <div style="float:left;  margin-left: 20px"><asp:TextBox ID="txtSearch" runat="server" Placeholder="part number" Width="200px" Height="32px"  Autocomplete="off"></asp:TextBox></div>
                <div style="float:left; margin-left: 20px"> Sort by:
                <asp:DropDownList ID="ddlOrderBy" runat="server">
                    <asp:ListItem Value="part_number">Part Number</asp:ListItem>
                </asp:DropDownList></asp:TextBox></div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px"><asp:Button ID="btnFindgvFanPrice" class="button-main primary-btn"  runat="server" Visible="true" Text="Find " OnClick="BtnFindgvFanPrice_click" /></div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px"><asp:Button ID="btnFindAllgvFanPrice" class="button-main primary-btn"  runat="server" Visible="true" Text="Find All" OnClick="BtnFindAllgvFanPrice_click" /></div>
        </div>
        </asp:Panel>

        <div runat="server" id="FanPriceGV_DIV" style="max-width: 500px;">
             <asp:GridView ID="gvFanPrice" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="fan_id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvFanPrice_RowCommand"
                 OnRowEditing="gvFanPrice_RowEditing" OnRowCancelingEdit="gvFanPrice_RowCancelingEdit"
                 OnRowUpdating="gvFanPrice_RowUpdating" OnRowDeleting="gvFanPrice_RowDeleting" >
                <Columns>




              <asp:TemplateField  HeaderText="fan_id" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFan_id" Text='<%#Eval("fan_id") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFan_idFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fan_id") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Part Number" ControlStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPart_number" Text='<%#Eval("part_number") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPart_numberFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("part_number") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Price" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" Text='<%#Eval("price") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPriceFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("price") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>





             <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit</span></span>
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
                            <asp:LinkButton data-delete='<%# Eval("fan_id") %>'  runat="server" CommandName="" CausesValidation="false" 
                                onClick="BtnDelete_Click" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;">
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete</span></span>
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
