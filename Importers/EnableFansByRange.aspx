<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnableFansByRange.aspx.cs" Inherits="CFM_Web.Importers.EnableFansByRange" MasterPageFile="~/fanselection.Master" %>

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

      <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindgvRange">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>
        <h3>Enable / Disable Fan groups</h3>

          <b>Warning:</b> this page is slow to update. Be patient with it.
        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium">
                <div style="float:left;  margin-top: 15px">Search </div>
<div style="float:left;  margin-left: 20px">
<asp:DropDownList ID="ddlRangeID" runat="server" AutoPostBack="FALSE" >
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
</div>
            <div style="float:left;  margin-left: 20px">
<asp:DropDownList ID="ddlLength" runat="server" AutoPostBack="FALSE" >
<asp:ListItem Value="combined">All lengths</asp:ListItem>
<asp:ListItem Value="separate">Separate lengths</asp:ListItem>
</asp:DropDownList>
    </div>

             <div style="float:left;  margin-left: 20px; margin-top: 5px">
                <asp:Button ID="btnFindgvRange" class="button-main primary-btn"  runat="server" Visible="true" Text="Find" OnClick="BtnFindgvRange_click" /></div>

        </div>
        </asp:Panel>
        <div runat="server" id="RangeGV_DIV" style="max-width: 700px;">
             <asp:GridView ID="gvRange" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="rangeid" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvRange_RowCommand"
                 OnRowEditing="gvRange_RowEditing" OnRowCancelingEdit="gvRange_RowCancelingEdit"
                 OnRowUpdating="gvRange_RowUpdating" OnRowDeleting="gvRange_RowDeleting" >
                <Columns>




              <asp:TemplateField  HeaderText="rangeid" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRange" Text='<%#Eval("rangeid") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRangeFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("rangeid") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Prefix" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrefix" Text='<%#Eval("prefix") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPrefixFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("prefix") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Diameter" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiameter" Text='<%#Eval("diameter") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDiameterFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("diameter") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Count" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCount" Text='<%#Eval("count") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCountFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label ID="lblCount" Text='<%#Eval("count") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="Length" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" 
                  FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox  Text='<%#Eval("length") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLengthFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label ID="lblLength" Text='<%#Eval("length") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


              <asp:TemplateField  HeaderText="Status" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                        <EditItemTemplate>
                            <asp:TextBox  Text='<%#Eval("built") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBuiltFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label ID="lblBuilt" Text='<%#Eval("built") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>







             <asp:TemplateField ItemStyle-Width="40px"  HeaderStyle-Width="40px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                 <ItemTemplate>
                     <asp:LinkButton data-rangeid='<%# Eval("rangeid") %>'
                         data-diameter='<%# Eval("diameter") %>'
                         data-built='<%# Eval("built") %>'
                         data-length='<%# Eval("length") != System.DBNull.Value ? Eval("length") : "" %>'
                         runat="server"
                         CommandName=""
                         CausesValidation="false"
                         onClick="BtnEdit_Click" >
                         <span class="tooltip">
                             <asp:Label runat="server" ID="lblToggle">
                                 <i class="fas fa-toggle-on"></i>
                             </asp:Label>
                             <span class="tooltiptext tooltip-i">Change </span>
                         </span>
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