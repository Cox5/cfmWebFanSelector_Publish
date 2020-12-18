<%@ Page Title="FanData changer" Language="C#"   AutoEventWireup="true" CodeBehind="FanData.aspx.cs"        Inherits="CFM_Web.Importers.FanData"   MasterPageFile="~/fanselection.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        .table td, .table th {
    padding: 2px 4px 2px 2px;
}
    </style>
    <div class="content-wrapper">
        <h3>Update fandata table</h3>
<div class="table-controls mb-medium">
             <asp:Button ID="btnFinished" class="button-main primary-btn"  runat="server" Visible="true" Text="Finished" OnClick="btnFinished_Click" />
</div>
        <br />
        <h3><asp:Label ID="lblMessage" runat="server" ></asp:Label></h3>
                <asp:HiddenField ID="hiddenFanID" runat="server"/>
        <div runat="server" id="FanListDiv">
        </div>

        <div runat="server" id="FanGridView">
             <asp:GridView ID="gvFan" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="fandataid" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvFan_RowCommand" 
                 OnRowEditing="gvFan_RowEditing" OnRowCancelingEdit="gvFan_RowCancelingEdit" 
                 OnRowUpdating="gvFan_RowUpdating" OnRowDeleting="gvFan_RowDeleting" > 

                <Columns>

              <asp:TemplateField  HeaderText="fanDataID" ControlStyle-Width="30px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfanDataID" Text='<%#Eval("fanDataID") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfanDataIDFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanDataID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="fanID" ControlStyle-Width="30px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfanID" Text='<%#Eval("fanID") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfanIDFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="angle" ControlStyle-Width="30px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtangle" Text='<%#Eval("angle") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtangleFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("angle") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="motorkW" ControlStyle-Width="30px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmotorkW" Text='<%#Eval("motorkW") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmotorkWFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("motorkW") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="motorAmps" ControlStyle-Width="30px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmotorAmps" Text='<%#Eval("motorAmps") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmotorAmpsFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("motorAmps") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="impeller" ControlStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtimpeller" Text='<%#Eval("impeller") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtimpellerFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("impeller") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="mass" ControlStyle-Width="40px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmass" Text='<%#Eval("mass") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmassFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("mass") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="RPM" ControlStyle-Width="40px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRPM" Text='<%#Eval("RPM") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRPMFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("RPM") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="dims" ControlStyle-Width="250px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdims" Text='<%#Eval("dims") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtdimsFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("dims") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="wiring" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtwiring" Text='<%#Eval("wiring") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtwiringFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("wiring") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="casingID" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcasingID" Text='<%#Eval("casingID") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtcasingIDFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("casingID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="motorID" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmotorID" Text='<%#Eval("motorID") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmotorIDFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("motorID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>



             <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
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
                        </FooterTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField ItemStyle-Width="20px"  HeaderStyle-Width="20px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                        <asp:LinkButton data-fandataid='<%# Eval("fanDataID") %>' data-fanid='<%#Eval("fanID") %>'  runat="server" CommandName="" CausesValidation="false" onClick="ButtonDatapoints_Click" >
                                <span class="tooltip"><i class="far fa-chart-bar"></i><span class="tooltiptext tooltip-i">Add/edit datapoints for performance curve</span></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>


                    </Columns>
                 </asp:GridView>
        </div>
        <br />
                </div>

    </asp:Content>


        
