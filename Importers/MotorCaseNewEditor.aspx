<%@ Page Title="Catalogue Impeller Editor" Language="C#" AutoEventWireup="true" CodeBehind="MotorCaseNewEditor.aspx.cs" Inherits="CFM_Web.Importers.MotorCaseNewEditor"
    MasterPageFile="~/fanselection.Master"%>


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
      <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindgvMotorCase">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>
        <h3>Edit Motor Case table</h3>


        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium">
                <div style="float:left;  margin-top: 15px">Search by diameter or fan type</div>
                <div style="float:left;  margin-left: 20px">
                    <asp:TextBox ID="txtSearch" runat="server" Placeholder="diameter or fan type" Width="200px" Height="32px"  Autocomplete="off"></asp:TextBox>

                </div>
              <div style="float:left; margin-left: 20px"> Sort by:
                <asp:DropDownList ID="ddlOrderBy1" runat="server">
                <asp:ListItem Value="id">id</asp:ListItem>
<asp:ListItem Value="fantype">Fan Type</asp:ListItem>
<asp:ListItem Value="diameter">Diameter</asp:ListItem>
<asp:ListItem Value="frame_length">Length</asp:ListItem>
<asp:ListItem Value="case_code">Case code</asp:ListItem>
<asp:ListItem Value="price">Price</asp:ListItem>
<asp:ListItem Value="weight">Weight</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlOrderBy2" runat="server">
                <asp:ListItem Value="id">id</asp:ListItem>
<asp:ListItem Value="fantype">Fan Type</asp:ListItem>
<asp:ListItem Value="diameter">Diameter</asp:ListItem>
<asp:ListItem Value="frame_length">Length</asp:ListItem>
<asp:ListItem Value="case_code">Case code</asp:ListItem>
<asp:ListItem Value="price">Price</asp:ListItem>
<asp:ListItem Value="weight">Weight</asp:ListItem>

                </asp:DropDownList>
               </div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px"><asp:Button ID="btnFindgvMotorCase" class="button-main primary-btn"  runat="server" Visible="true" Text="Find cases" OnClick="BtnFindgvMotorCase_click" /></div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px"><asp:Button ID="btnFindAllgvMotorCase" class="button-main primary-btn"  runat="server" Visible="true" Text="Find All" OnClick="BtnFindAllgvMotorCase_click" /></div>
        </div>
        </asp:Panel>

        <div runat="server" id="MotorCaseGV_DIV" style="max-width: 900px;">
             <asp:GridView ID="gvMotorCase" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvMotorCase_RowCommand"
                 OnRowEditing="gvMotorCase_RowEditing" OnRowCancelingEdit="gvMotorCase_RowCancelingEdit"
                 OnRowUpdating="gvMotorCase_RowUpdating" OnRowDeleting="gvMotorCase_RowDeleting" >
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




              <asp:TemplateField  HeaderText="Fan Type" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFantype" Text='<%#Eval("fantype") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFantypeFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fantype") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Diameter" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiameter" Text='<%#Eval("diameter") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDiameterFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("diameter") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Length" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFrame_length" Text='<%#Eval("frame_length") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFrame_lengthFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("frame_length") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Case Code" ControlStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCase_code" Text='<%#Eval("case_code") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCase_codeFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("case_code") %>' runat="server"></asp:Label>
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




              <asp:TemplateField  HeaderText="Weight" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtWeight" Text='<%#Eval("weight") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtWeightFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("weight") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>





             <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit this Motor Case</span></span>
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
                            <asp:LinkButton data-delete='<%# Eval("id") %>'  runat="server" CommandName="" CausesValidation="false" onClick="BtnDelete_Click" >
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete this Motor Case</span></span>
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