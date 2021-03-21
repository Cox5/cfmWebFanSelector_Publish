<%@ Page  MasterPageFile="~/fanselection.Master" Title="Default Extra Items" Language="C#" AutoEventWireup="true" CodeBehind="DefaultExtraItems.aspx.cs" Inherits="CFM_Web.Projects.DefaultExtraItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div id="table_view" runat="server" >
            <div class="mb-solid mt-solid">

            <div class="table-controls">
                <h1 class="table-title maintitle">Default Ancillaries</h1>
            </div>
              <div class="project-name" ><asp:Label ID="lblProjectName" runat="server"  Visible="true"></asp:Label></div>
            <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
              </div>           
        </div>
<style>
.sub div { visibility: hidden; }
.has-sub:hover > .sub div { visibility: visible; } 
.afl-tr {height: 19px; font-size: 14px;}
#body_ddFanType1, #body_ddFanType2, #body_ddFanType3, #body_ddFanType4, #body_ddFanType5 { width: 95%;}
</style>
            <table class="table table-form" >
                <thead>
                    <tr >
                        <td style="width:6%">Fan Reference</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">MkW</td>
                        <td style="width: 14%; text-align:left" class="tiny-td" >&nbsp;&nbsp;&nbsp;Selected Fan</td>                      
                        <td style="width:5%; text-align:center">Diameter<br />(mm)</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">Weight (kg)</td>

                        <td style="width:15%; text-align:center" class="tiny-td" >Category</td>
                        <td style="width:40%; text-align:left" class="tiny-td" >Item Description</td>
                        <td style="width:10%;text-align:left" class="tiny-td" >Qty</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >Unit Price ($)</td>
                    </tr>
                </thead>
            </table>
            <table class="table table-form">
                   <tbody>
                      <tr style="height: 1px;border-bottom: none !important; overflow: hidden; font-size: 1px;">
                        <td style="width:6%">&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">&nbsp;</td>
                        <td style="width:14%">&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width: 5%; text-align:center" class="tiny-td">&nbsp;</td>

                        <td style="width:15%; text-align:center">&nbsp;</td>
                        <td style="width:40%; text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:10%;text-align:center" class="tiny-td" >&nbsp;</td>
                        <td style="width:5%;text-align:center" class="tiny-td" >&nbsp;</td>                    
                    </tr>
                <tr>
                     <!-- getDefaultAncill() -->
                </tr>
              </table>

            <asp:GridView ID="gvExtraItems" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvExtraItems_RowCommand" OnRowEditing="gvExtraItems_RowEditing" OnRowCancelingEdit="gvExtraItems_RowCancelingEdit" OnRowUpdating="gvExtraItems_RowUpdating" OnRowDeleting="gvExtraItems_RowDeleting"> 


                <Columns>

                    <asp:TemplateField  HeaderText="Fan Reference" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("location_designation") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanLocation" Text='<%#Eval("location_designation") %>' runat="server"  CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFanLocations"  OnSelectedIndexChanged="ddlFanLocations_SelectedIndexChanged"  CssClass="input-small" AutoPostBack="true" AppendDataBoundItems="true" runat="server">
                                    <asp:ListItem Text="Please select..." Value="Null" />
                             </asp:DropDownList>
                            <asp:HiddenField ID="projectFanIdHidden" Value='<%#Eval("pfid") %>'  runat="server" ></asp:HiddenField>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField  HeaderText="MkW" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" >
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("mkw") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMkW" Text='<%#Eval("mkw") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="txtMkWFooter" runat="server" AutoPostBack="true"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField  HeaderText="Diameter" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("diameter") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiameter" Text='<%#Eval("diameter") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="txtDiameterFooter" runat="server" AutoPostBack="true"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField  HeaderText="Kg" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("kg") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtKg" Text='<%#Eval("kg") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="txtKgFooter" runat="server" AutoPostBack="true"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Category" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="categoryName" Text='<%#Eval("category_name") %>'  runat="server" ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:DropDownList ID="ddlCategoryEdit"  OnSelectedIndexChanged="ddlCategoryEdit_SelectedIndexChanged"   HeaderStyle-Width="160px"  CssClass="input-small" AutoPostBack="true" AppendDataBoundItems="true" runat="server">
                                    
                             </asp:DropDownList>
                            <asp:HiddenField ID="categoryNameHidden" Value='<%#Eval("category_name") %>'  runat="server" ></asp:HiddenField>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlCategory"  OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="input-small" AutoPostBack="true" AppendDataBoundItems="true" runat="server">
                                    <asp:ListItem Text="Please select..." Value="Null" />
                             </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Item Description" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("description") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" Text='<%#Eval("description") %>' runat="server" HeaderStyle-Width="200px"  CssClass="input-small"></asp:TextBox>
                           
                            <asp:DropDownList ID="ddlDescriptionEdit"  OnSelectedIndexChanged="ddlDescriptionEdit_SelectedIndexChanged" Visible="false"  CssClass="input-small" AutoPostBack="true" AppendDataBoundItems="true" runat="server">
                                    <asp:ListItem Text="Please select..." Value="Null" />
                             </asp:DropDownList>
                            <asp:HiddenField ID="descriptionHidden" Value='<%#Eval("description") %>'  runat="server" ></asp:HiddenField>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDescriptionFooter" runat="server" CssClass="input-small"></asp:TextBox>
                            <asp:DropDownList ID="ddlDescription"  OnSelectedIndexChanged="ddlDescription_SelectedIndexChanged" Visible="false"  CssClass="input-small" AutoPostBack="true" AppendDataBoundItems="true" runat="server">
                                    <asp:ListItem Text="Please select..." Value="Null" />
                             </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Catalogue Number" ItemStyle-Width="160px" HeaderStyle-Width="160px"  HeaderStyle-HorizontalAlign="Left" Visible="false">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("catalogue_id") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCatalogueNumber" Text='<%#Eval("catalogue_id") %>' runat="server"  CssClass="input-small"></asp:TextBox>
                            <asp:CustomValidator ID="catalogueNumCustomValidator" runat="server" ErrorMessage="..."></asp:CustomValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCatalogueNumberFooter" runat="server"  CssClass="input-small"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  HeaderText="Qty" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("quantity") %>' runat="server" HorizontalAlign="Center"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuantity" Text='<%#Eval("quantity") %>' runat="server" HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" CssClass="input-small center-text"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="qtyRequiredValidator" runat="server" ErrorMessage="Qty field is empty" ForeColor="Red" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtQuantityFooter" runat="server" Width="70px" CssClass="input-small center-text"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Unit Price ($)" ItemStyle-Width="90px" HeaderStyle-Width="90px" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("unit_price") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUnitPrice" Text='<%#Eval("unit_price") %>' runat="server" CssClass="input-small" CausesValidation="false"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="priceRequiredValidator" runat="server" ErrorMessage="Price field is empty" ForeColor="Red" ControlToValidate="txtUnitPrice"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtUnitPriceFooter" runat="server" Width="90px" CssClass="input-small"></asp:TextBox>
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
                            <asp:LinkButton runat="server" CommandName="Add" CssClass="button-main primary-btn" ><i class="tooltip fas fa-plus-circle"></i> Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>

                </Columns>


            </asp:GridView>

            <br />

            <asp:Label ID="lblSuccessMsg" runat="server" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" CssClass="mb-small"></asp:Label>
            <br />

         </div>

    </div>
</asp:Content>
