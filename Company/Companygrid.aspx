<%@ Page Language="C#"  MasterPageFile="~/fanselection.Master" Title="Edit Company" AutoEventWireup="true" CodeBehind="Companygrid.aspx.cs" Inherits="CFM_Web.Company.Companygrid" %>


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
      <asp:Panel ID="Panel1" runat="server" DefaultButton="btnFindgvCompany">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
      </div>
        <h3>Edit Companies</h3>


        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium">
            <style>
                .fleft {float:left;  margin-left: 10px; margin-top: 5px}
                .smbtn {  width: 90px !important;  }
            </style>
                <div style="float:left;  margin-top: 15px">Search </div>
                <div style="float:left;  margin-left: 20px">
                        <asp:TextBox ID="txtSearch" runat="server" Placeholder="Company" Width="200px" Height="32px"  Autocomplete="off"></asp:TextBox>
                </div>
               <div style="float:left; margin-left: 20px"> Sort by:
                <asp:DropDownList ID="ddlOrderBy1" runat="server">
                    <asp:ListItem Value="company_name">Company Name</asp:ListItem>
                    <asp:ListItem Value="state">State</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlOrderBy2" runat="server">
                    <asp:ListItem Value="company_name">Company Name</asp:ListItem>
                 <asp:ListItem Value="state">State</asp:ListItem>
                </asp:DropDownList>
               </div>
             <div class="fleft">
                <asp:Button ID="btnFindgvCompany" class="button-main primary-btn smbtn"  runat="server" Visible="true" Text="Find" OnClick="BtnFindgvCompany_click" /></div>
             <div class="fleft">
                <asp:Button ID="btnFindAllgvCompany" class="button-main primary-btn smbtn"  runat="server" Visible="true" Text="Find All" OnClick="BtnFindAllgvCompany_click" /></div>
             <div class="fleft">
                <asp:Button ID="btnFindDeleted" class="button-main primary-btn smbtn"  runat="server" Visible="true" Text="Find Deleted" OnClick="BtnFindDeleted_click" /></div>
             <div class="fleft">
                <asp:Button ID="btnAdd"  class="button-main primary-btn  smbtn" Text="Add Company" OnClick="btnAdd_Click" runat="server" /></div>
        </div>
        </asp:Panel>
        <div runat="server" id="CompanyGV_DIV" style="max-width: 900px;">
             <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="company_id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvCompany_RowCommand"
                 OnRowEditing="gvCompany_RowEditing" OnRowCancelingEdit="gvCompany_RowCancelingEdit"
                 OnRowUpdating="gvCompany_RowUpdating" OnRowDeleting="gvCompany_RowDeleting" Width="100%" ItemStyle-Wrap="false">
                <Columns>




              <asp:TemplateField  HeaderText="company_id" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCompanyId" Text='<%#Eval("company_id") %>' runat="server" Enabled="false" CssClass="input-small" Style="background-color: #eeeeee"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCompanyIdFooter" runat="server" AutoPostBack="false" Text=""  Enabled="false" Style="background-color: #eeeeee" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("company_id") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Company Name" ControlStyle-Width="270px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCompany" Text='<%#Eval("company_name") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCompanyFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("company_name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="City/Suburb" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSuburb" Text='<%#Eval("suburb") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtSuburbFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("suburb") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="State" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtState" Text='<%#Eval("state") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtStateFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("state") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>




              <asp:TemplateField  HeaderText="Country" ControlStyle-Width="170px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCountry" Text='<%#Eval("country") %>' runat="server" Enabled="true" CssClass="input-small" Style="background-color: #ffffff"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCountryFooter" runat="server" AutoPostBack="false" Text=""  Enabled="true" Style="background-color: #ffffff" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("country") %>' runat="server"></asp:Label>
                        </ItemTemplate>
              </asp:TemplateField>



             <asp:TemplateField ItemStyle-Width="100px"  HeaderStyle-Width="100px"  ItemStyle-CssClass="icons" 
                 HeaderStyle-HorizontalAlign="Right" ItemStyle-Wrap="false">
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


             <asp:TemplateField ItemStyle-Width="140px"  HeaderStyle-Width="140px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton  ID="lnkCompanyDel" data-delete='<%# Eval("company_id") %>'  runat="server" CommandName="" CausesValidation="false"
                                OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" onClick="BtnDelete_Click" >
                                <span class="tooltip"><i class="fas fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete </span></span>
                            </asp:LinkButton>
                          <asp:LinkButton  ID="lnkCompanyRestore" data-delete='<%# Eval("company_id") %>'  runat="server" CommandName="" CausesValidation="false"
                                OnClientClick="if (!confirm('Are you sure you want restore?')) return false;" onClick="BtnRestore_Click" >
                                <span class="tooltip"><i class="fas fa-trash-restore"></i><span class="tooltiptext tooltip-i">Restore </span></span>
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
