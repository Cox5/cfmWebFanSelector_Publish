<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Diagrams.aspx.cs" Inherits="CFM_Web.Importers.Diagrams"  MasterPageFile="~/fanselection.Master"  %>


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
      <h3>Edit Fan Image, Drawing and Wiring filenames</h3>
        <b>Note:</b> If you change the image, it will change automatically for all angles, but drawing and wiring will only change for the one angle.

      <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindgvDiagrams">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>

        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium">
                <div style="float:left;  margin-top: 15px">Search </div>
                <div style="float:left;  margin-left: 20px">
                        <asp:TextBox ID="txtSearch" runat="server" Placeholder="partnumber" Width="180px" Height="32px"  Autocomplete="off"></asp:TextBox>
                </div>
               <div style="float:left; margin-left: 20px"> Sort by:
                <asp:DropDownList ID="ddlOrderBy1" runat="server">
                <asp:ListItem Value="partnumber">partnumber</asp:ListItem>

                </asp:DropDownList>
                <asp:DropDownList ID="ddlOrderBy2" runat="server">
                <asp:ListItem Value="partnumber">partnumber</asp:ListItem>

                </asp:DropDownList>
               </div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px">
                <asp:Button ID="btnFindgvDiagrams" class="button-main primary-btn"  runat="server" Visible="true" Text="Find" OnClick="BtnFindgvDiagrams_click" /></div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px">
                <asp:Button ID="btnFindAllgvDiagrams" class="button-main primary-btn"  runat="server" Visible="true" Text="Find All" OnClick="BtnFindAllgvDiagrams_click" /></div>
        </div>
        </asp:Panel>
        <div runat="server" id="DiagramsGV_DIV" style="max-width: 700px;">
             <asp:GridView ID="gvDiagrams" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="fandataid" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvDiagrams_RowCommand"
                 OnRowEditing="gvDiagrams_RowEditing" OnRowCancelingEdit="gvDiagrams_RowCancelingEdit"
                 OnRowUpdating="gvDiagrams_RowUpdating" OnRowDeleting="gvDiagrams_RowDeleting" >
                <Columns>




              <asp:TemplateField  HeaderText="fandataid" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfandataid" Text='<%#Eval("fandataid") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfandataidFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fandataid") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="partnumber" ControlStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPartNumber" Text='<%#Eval("partnumber") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPartNumberFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("partnumber") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="angle" ControlStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAngle" Text='<%#Eval("angle") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAngleFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("angle") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="fanimage" ControlStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanImage" Text='<%#Eval("fanimage") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFanImageFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanimage") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="dims" ControlStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDims" Text='<%#Eval("dims") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDimsFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("dims") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="wiring" ControlStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtWiring" Text='<%#Eval("wiring") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtWiringFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("wiring") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>





             <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="100px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
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


             <asp:TemplateField ItemStyle-Width="40px"  HeaderStyle-Width="40px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton data-delete='<%# Eval("fandataid") %>'  runat="server" CommandName="" CausesValidation="false" onClick="BtnDelete_Click" >
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