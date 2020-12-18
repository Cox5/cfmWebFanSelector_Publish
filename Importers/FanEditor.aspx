<%@ Page Title="Catalogue Fan Editor" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FanEditor.aspx.cs" Inherits="CFM_Web.Importers.FanEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">
                    <style>
                        .pencil {
                            min-width: 70px !important;
                        }
                    </style>

        <h3>Edit Fans in database</h3>
        Enter a catalogue model number or prefix to search for, eg "MUC3"
<div class="table-controls mb-medium">
          <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for fan partnumber prefix" Width="300px" Height="32px"  Autocomplete="off"></asp:TextBox>

           <asp:Button ID="btnFindFan" class="button-main primary-btn"  runat="server" Visible="true" Text="List fans" OnClick="BtnFindFan_click" />

</div>
        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        <asp:HiddenField ID="hiddenSearch" runat="server"/>
        <div runat="server" id="FanListDiv">

        </div>

        <div runat="server" id="FanGridView">
             <asp:GridView ID="gvFan" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="fanid" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvFan_RowCommand" 
                 OnRowEditing="gvFan_RowEditing" OnRowCancelingEdit="gvFan_RowCancelingEdit" 
                 OnRowUpdating="gvFan_RowUpdating" OnRowDeleting="gvFan_RowDeleting" > 

                <Columns>
                       
                    <asp:TemplateField  HeaderText="FanId" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanid") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanId" Text='<%#Eval("fanid") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFanIdFooter" runat="server" AutoPostBack="false" readonly="true" value="auto"/>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField  HeaderText="PartNumber" ControlStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPartNumber" Text='<%#Eval("PartNumber") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPartNumberFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("PartNumber") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Diameter" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiameter" Text='<%#Eval("Diameter") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDiameterFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("Diameter") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField  HeaderText="MotorPhase" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotorPhase" Text='<%#Eval("MotorPhase") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorPhaseFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("MotorPhase") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Motor Pole" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotorPole" Text='<%#Eval("motorPole") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorPoleFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("MotorPole") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Range ID" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRangeID" Text='<%#Eval("rangeID") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRangeIDFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("rangeID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

              <asp:TemplateField  HeaderText="Fan Image" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanImage" Text='<%#Eval("fanImage") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFanImageFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanImage") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  HeaderText="Dimensions info" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDims" Text='<%#Eval("dims") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDimsFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("dims") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="Fan Size" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanSize" Text='<%#Eval("fanSize") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFanSizeFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanSize") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="Fan Mass" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMass" Text='<%#Eval("mass") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMassFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("mass") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="Hub id" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtHubId" Text='<%#Eval("hubID") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtHubIdFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hubID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="Blade Material ID" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBladeMaterialID" Text='<%#Eval("bladeMaterialID") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBladeMaterialIDFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("bladeMaterialID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>



                   <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px" FooterStyle-Width="70px" ItemStyle-CssClass="icons pencil" HeaderStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit this fan</span></span>
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

                   <asp:TemplateField ItemStyle-Width="20px"  HeaderStyle-Width="20px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton data-fanid='<%# Eval("fanid") %>'  runat="server" CommandName="" CausesValidation="false" onClick="ButtonFandata_Click" >
                                <span class="tooltip"><i class="fas fa-wind"></i><span class="tooltiptext tooltip-i">Add/edit fan tech data including angle variants</span></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>

                       </EditItemTemplate>
                       <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-Width="20px"  HeaderStyle-Width="20px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton data-fanid='<%# Eval("fanid") %>'  runat="server" CommandName="" CausesValidation="false" onClick="ButtonFanacoustic_Click" >
                                <span class="tooltip"><i class="fas fa-volume-up"></i><span class="tooltiptext tooltip-i">Edit fan acoustic data of angle variants</span></span>
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

       
        <br />
    </div>
</asp:Content>