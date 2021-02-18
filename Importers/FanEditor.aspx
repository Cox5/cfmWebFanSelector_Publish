<%@ Page Title="Catalogue Fan Editor" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FanEditor.aspx.cs" Inherits="CFM_Web.Importers.FanEditor" %>
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
      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div> 
        <h3>Edit Fans in database</h3>
        Enter a catalogue model number or prefix to search for, eg "MUC3"
<div class="table-controls mb-medium">
          <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for fan partnumber prefix" Width="300px" Height="32px"  Autocomplete="off"></asp:TextBox>
        <asp:DropDownList ID="ddImpeller" runat="server">
            <asp:ListItem Value="No">Without impeller defined</asp:ListItem>
            <asp:ListItem Value="Yes">With impeller defined</asp:ListItem>
        </asp:DropDownList>
           <asp:Button ID="btnFindFan" class="button-main primary-btn"  runat="server" Visible="true" Text="List fans" OnClick="BtnFindFan_click" />

</div>

        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        <asp:HiddenField ID="hiddenSearch" runat="server"/>
        <div runat="server" id="FanListDiv">
        </div>
        <div runat="server" id="DeleteDiv" visible="false">
            <asp:HiddenField ID="hiddenFanID" runat="server"/>
            <h3><font color="#dd0000">Confirm you wish to delete fan with fanid=<asp:Label ID="lblFanID" runat="server"></asp:Label>.</font>
                  <asp:LinkButton runat="server" CommandName="" CausesValidation="false" onClick="BtnDeleteConfirm_Click" >
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete this fan data row</span></span>
                  </asp:LinkButton>
                  <asp:LinkButton runat="server" CommandName="" CausesValidation="false" onClick="BtnCancelConfirm_Click" >
                                <span class="tooltip"><i class="fas fa-times-circle"></i><span class="tooltiptext tooltip-i">Cancel</span></span>
                  </asp:LinkButton>
                </h3>
        </div>
        <div runat="server" id="FanGridView" class="editor">
             <asp:GridView ID="gvFan" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="fanid" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvFan_RowCommand" 
                 OnRowEditing="gvFan_RowEditing" OnRowCancelingEdit="gvFan_RowCancelingEdit" OnRowDataBound="gvFan_RowDataBound"
                 OnRowUpdating="gvFan_RowUpdating" OnRowDeleting="gvFan_RowDeleting" > 

                <Columns>
                       
                    <asp:TemplateField  HeaderText="FanId" ControlStyle-Width="60px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
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
                    <asp:TemplateField  HeaderText="Diameter" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
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

                    <asp:TemplateField  HeaderText="Motor Phase" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
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
                    <asp:TemplateField  HeaderText="Motor Pole" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
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
                    <asp:TemplateField  HeaderText="RangeCode" ControlStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlRangeID" runat="server" AutoPostBack="FALSE"   AppendDataBoundItems="true" >
                                </asp:DropDownList>
                            <asp:HiddenField ID="hiddenRangeID" Value='<%#Eval("rangeID") %>' runat="server" ></asp:HiddenField>
                        </EditItemTemplate>
                        <FooterTemplate>
                           <asp:DropDownList ID="ddlRangeIDFooter" runat="server" AutoPostBack="FALSE" >
                               <asp:ListItem Value="32">FAV</asp:ListItem>
<asp:ListItem Value="14">MAH</asp:ListItem>
<asp:ListItem Value="13">MAHF</asp:ListItem>
<asp:ListItem Value="20">MAHFS</asp:ListItem>
<asp:ListItem Value="19">MAHS</asp:ListItem>
<asp:ListItem Value="16">MAV</asp:ListItem>
<asp:ListItem Value="18">MAVSS</asp:ListItem>
<asp:ListItem Value="22">MCH</asp:ListItem>
<asp:ListItem Value="29">MCHS</asp:ListItem>
<asp:ListItem Value="23">MCR</asp:ListItem>
<asp:ListItem Value="25">MCV</asp:ListItem>
<asp:ListItem Value="24">MCVG</asp:ListItem>
<asp:ListItem Value="27">MCVH</asp:ListItem>
<asp:ListItem Value="1">MUA</asp:ListItem>
<asp:ListItem Value="2">MUABD</asp:ListItem>
<asp:ListItem Value="3">MUABF</asp:ListItem>
<asp:ListItem Value="4">MUACR</asp:ListItem>
<asp:ListItem Value="5">MUAF</asp:ListItem>
<asp:ListItem Value="15">MUARF</asp:ListItem>
<asp:ListItem Value="21">MUARFS</asp:ListItem>
<asp:ListItem Value="7">MUASS</asp:ListItem>
<asp:ListItem Value="8">MUC</asp:ListItem>
<asp:ListItem Value="10">MUCH</asp:ListItem>
<asp:ListItem Value="30">MUCR</asp:ListItem>
<asp:ListItem Value="17">MV</asp:ListItem>
<asp:ListItem Value="26">MVR</asp:ListItem>
<asp:ListItem Value="34">MVX</asp:ListItem>
<asp:ListItem Value="11">MX</asp:ListItem>
<asp:ListItem Value="12">MXSIL </asp:ListItem>
<asp:ListItem Value="31">R</asp:ListItem>
<asp:ListItem Value="33">RC</asp:ListItem>
<asp:ListItem Value="6">SC</asp:ListItem>
<asp:ListItem Value="36">SPA</asp:ListItem>
<asp:ListItem Value="38">SPAS</asp:ListItem>
<asp:ListItem Value="35">SPASS</asp:ListItem>
<asp:ListItem Value="28">TMCV</asp:ListItem>
<asp:ListItem Value="9">TMUC</asp:ListItem>
<asp:ListItem Value="37">WP</asp:ListItem>
</asp:DropDownList>

                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("prefix") %>' runat="server" CssClass="paddingleft"></asp:Label>
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
              <asp:TemplateField  Visible="false" HeaderText="Dimensions info" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
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


              <asp:TemplateField  Visible="false" HeaderText="Fan Mass" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMass" Text='<%#Eval("mass") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMassFooter" runat="server" AutoPostBack="false"  />
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

              <asp:TemplateField  HeaderText="Blade Material" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                <asp:DropDownList ID="ddlBladeMaterial" runat="server" AutoPostBack="true"   AppendDataBoundItems="true">
                </asp:DropDownList>
                    <asp:HiddenField ID="BladeMaterialHidden" Value='<%#Eval("bladeMaterialID") %>'  runat="server" ></asp:HiddenField>

                        </EditItemTemplate>
                        <FooterTemplate>
                   <asp:DropDownList ID="ddlBladeMaterialFooter" runat="server" AutoPostBack="FALSE" >
                    <asp:ListItem Value="1"> PPG </asp:ListItem>
                    <asp:ListItem Value="2"> Alu </asp:ListItem>
                    <asp:ListItem Value="3"> PPG/Alu </asp:ListItem>
                    <asp:ListItem Value="4"> PAGAS </asp:ListItem>
                </asp:DropDownList>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label ID="txtBladeMaterialID" Text='<%#Eval("blade") %>' runat="server"></asp:Label>
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
                    <asp:TemplateField ItemStyle-Width="40px"  HeaderStyle-Width="40px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton data-fanid='<%# Eval("fanid") %>'  runat="server" CommandName="" CausesValidation="false" onClick="BtnDelete_Click" >
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete this fan</span></span>
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