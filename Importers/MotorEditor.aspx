<%@ Page Title="Catalogue Motor Editor" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" 
CodeBehind="MotorEditor.aspx.cs" Inherits="CFM_Web.Importers.MotorEditor" %>


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
             <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindgvMotorData">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>
        <h3>Edit Motor Data table</h3>


        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium"> 
            <div style="float:left;  margin-top: 15px; display:none"><b>Search motor by kW</b></div>
            <div style="float:left;  margin-left: 20px; display:none"><asp:TextBox ID="txtSearch" runat="server" Placeholder="kW" Width="100px" Height="32px"  Autocomplete="off"></asp:TextBox></div>
            <div style="float:left; margin-left: 20px"> Sort by: 
                <asp:DropDownList ID="ddlOrderBy" runat="server">
                    <asp:ListItem Value="kw">kW</asp:ListItem>
                    <asp:ListItem Value="poles">Poles</asp:ListItem>
                    <asp:ListItem Value="frame">Motor Frame</asp:ListItem>
                    <asp:ListItem Value="poles_kw">Poles + kW</asp:ListItem>
                </asp:DropDownList></asp:TextBox></div>
            <div style="float:left; margin-left: 20px; margin-top: 5px"><asp:Button ID="btnFindgvMotorData" class="button-main primary-btn"  runat="server" Visible="true" Text="Sort" OnClick="BtnFindgvMotorData_click" /></div>
            <div style="float:left;  margin-left: 20px; margin-top: 5px; display:block"><asp:Button ID="btnFindAll" class="button-main primary-btn"  runat="server" Visible="true" Text="Show all" OnClick="BtnFindAllMotors_click" /></div>
            <div style="float:left;  margin-left: 20px; margin-top: 5px; display:block"><asp:Button ID="ButtonFive" class="button-main primary-btn"  runat="server" Visible="true" Text="Add row" OnClick="BtnFindFiveMotors_click" /></div>
        </div>
        </asp:Panel>
        <div runat="server" id="MotorDataGV_DIV" style="max-width: 1000px;">
             <asp:GridView ID="gvMotorData" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="motorDataID" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvMotorData_RowCommand"
                 OnRowEditing="gvMotorData_RowEditing" OnRowCancelingEdit="gvMotorData_RowCancelingEdit"
                 OnRowUpdating="gvMotorData_RowUpdating" OnRowDeleting="gvMotorData_RowDeleting" >
                <Columns>




              <asp:TemplateField  HeaderText="motorDataID" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotorDataID" Text='<%#Eval("motorDataID") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorDataIDFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("motorDataID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="kW" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtKW" Text='<%#Eval("kw") %>' runat="server" Enabled="true" AutoCompleteType="Disabled" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtKWFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("kw") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Poles" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPole" Text='<%#Eval("pole") %>' runat="server" Enabled="true" AutoCompleteType="Disabled" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPoleFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("pole") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Motor Frame" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFrame" Text='<%#Eval("frame") %>' runat="server" Enabled="true" AutoCompleteType="Disabled" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFrameFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("frame") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="Case Length" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCaseLength" Text='<%#Eval("case_length") %>' runat="server" Enabled="true" AutoCompleteType="Disabled" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCaseLengthFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("case_length") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>



              <asp:TemplateField  HeaderText="RPM" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRPM" Text='<%#Eval("RPM") %>' runat="server" Enabled="true" AutoCompleteType="Disabled" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRPMFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("RPM") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>








              <asp:TemplateField  HeaderText="Shaft Dia" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShaftDia" Text='<%#Eval("shaftDia") %>' runat="server" AutoCompleteType="Disabled" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShaftDiaFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("shaftDia") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="FLA" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFullLoadAmps" Text='<%#Eval("fullLoadAmps") %>' runat="server" AutoCompleteType="Disabled" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFullLoadAmpsFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fullLoadAmps") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="efficiency" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEfficiency" Text='<%#Eval("efficiency") %>' runat="server" AutoCompleteType="Disabled" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEfficiencyFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("efficiency") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

                    

              <asp:TemplateField  HeaderText="Weight" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMass" Text='<%#Eval("mass") %>' runat="server" AutoCompleteType="Disabled" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMassFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("mass") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="Price" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" Text='<%#Eval("price") %>' runat="server" AutoCompleteType="Disabled" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPriceFooter" runat="server" AutoPostBack="false" Text=""  AutoCompleteType="Disabled" Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("price") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




             <asp:TemplateField ItemStyle-Width="100px"  HeaderStyle-Width="100px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit this Motor Data</span></span>
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
                            <asp:LinkButton data-delete='<%# Eval("motorDataID") %>'  runat="server" CommandName="" CausesValidation="false" onClick="BtnDelete_Click" >
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete this Motor Data</span></span>
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

