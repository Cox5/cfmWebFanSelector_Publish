<%@ Page Title="FanData changer" Language="C#"   AutoEventWireup="true" CodeBehind="FanDataAcoustic.aspx.cs"        Inherits="CFM_Web.Importers.FanDataAcoustic"   MasterPageFile="~/fanselection.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <style>
        .table td, .table th {
    padding: 0 0 0 0;
}
    </style>
    <div class="content-wrapper">
        <h3>Update fandata table - <b>Acoustic Data</b></h3>
<div class="table-controls mb-medium">
            <asp:Button ID="btnFinished" class="button-main primary-btn"  runat="server" Visible="true" Text="Finished" OnClick="btnFinished_Click" />

</div>
        <br />
        <h3><asp:Label ID="lblMessage" runat="server" ></asp:Label></h3> 
        <asp:HiddenField ID="hiddenFanID" runat="server"/>

        <div runat="server" id="FanListDiv">
        </div>

        <div runat="server" id="FanGridView" class="editor">
             <asp:GridView ID="gvFan" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="fandataid" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvFan_RowCommand" 
                 OnRowEditing="gvFan_RowEditing" OnRowCancelingEdit="gvFan_RowCancelingEdit" 
                 OnRowUpdating="gvFan_RowUpdating" OnRowDeleting="gvFan_RowDeleting" > 

                <Columns>

              <asp:TemplateField  HeaderText="fanDataID" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtfanDataID" Text='<%#Eval("fanDataID") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanDataID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="fanID" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFanId" Text='<%#Eval("fanID") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("fanID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="angle" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtangle" Text='<%#Eval("angle") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("angle") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>


               <asp:TemplateField  HeaderText="hz63" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz63" Text='<%#Eval("hz63") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz63") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz125" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz125" Text='<%#Eval("hz125") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz125") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz250" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz250" Text='<%#Eval("hz250") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz250") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz500" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz500" Text='<%#Eval("hz500") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz500") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz1k" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz1k" Text='<%#Eval("hz1k") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz1k") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz2k" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz2k" Text='<%#Eval("hz2k") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz2k") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz4k" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz4k" Text='<%#Eval("hz4k") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz4k") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="hz8k" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txthz8k" Text='<%#Eval("hz8k") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("hz8k") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="totalLwAtotal" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txttotalLwAtotal" Text='<%#Eval("totalLwAtotal") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("totalLwAtotal") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField  HeaderText="SPL3m" ControlStyle-Width="50px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSPL3m" Text='<%#Eval("SPL3m") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("SPL3m") %>' runat="server"></asp:Label>
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


        
