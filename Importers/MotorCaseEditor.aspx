<%@ Page Title="Motor Case Editor" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" 
    CodeBehind="MotorCaseEditor.aspx.cs" Inherits="CFM_Web.Importers.MotorCaseEditor" %>
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
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindCases">
      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div> 
        <h3>Edit Motor Case table</h3>


        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        
        <div class="table-controls mb-medium"> Search by case diameter
          <asp:TextBox ID="txtDiameter" runat="server" Placeholder="diameter" Width="100px" Height="32px"  Autocomplete="off"></asp:TextBox>
            <asp:Button ID="btnFindCases" class="button-main primary-btn"  runat="server" Visible="true" Text="Find cases" OnClick="BtnFindCases_click" />
            <asp:Button ID="btnFindAll" class="button-main primary-btn"  runat="server" Visible="true" Text="Show all" OnClick="BtnFindAllCases_click" />
        </div>
            </asp:Panel>

        <div runat="server" id="gvCase_DIV" style="max-width: 700px;">
             <asp:GridView ID="gvCase" runat="server"  AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvCase_RowCommand"
                 OnRowEditing="gvCase_RowEditing" OnRowCancelingEdit="gvCase_RowCancelingEdit"
                 OnRowUpdating="gvCase_RowUpdating" OnRowDeleting="gvCase_RowDeleting" >
                <Columns>




              <asp:TemplateField  HeaderText="Motor Case ID" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotorCaseID" Text='<%#Eval("id") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorCaseIDFooter" runat="server" AutoPostBack="false" Text="auto"  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("id") %>' runat="server"></asp:Label>
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




              <asp:TemplateField  HeaderText="Motor Frame" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotorFrame" Text='<%#Eval("motor_frame") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorFrameFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("motor_frame") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Length" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLength" Text='<%#Eval("length") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLengthFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("length") %>' runat="server"></asp:Label>
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




              <asp:TemplateField  HeaderText="Weight (kg)" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
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
                                   <asp:LinkButton ID="lbAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    </Columns>
                 </asp:GridView>
        </div>

    </div>
</asp:Content>
