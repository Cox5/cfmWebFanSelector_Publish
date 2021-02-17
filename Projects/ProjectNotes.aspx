<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectNotes.aspx.cs" Inherits="CFM_Web.Projects.ProjectNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="content-wrapper">
            <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Project Notes</h1>                  
            </div>
            
            <div class="project-name" ><asp:Label ID="lblProjectName" runat="server"  Visible="false"></asp:Label></div>
            <div class="subtitle regular" id="quoteNumberLine" runat="server" Visible="false" style="float: left; max-width: 50%">Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
            <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
              </div> 

            </div>

        <asp:GridView ID="gvNotes" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
            DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvNotes_RowCommand" OnRowEditing="gvNotes_RowEditing" OnRowCancelingEdit="gvNotes_RowCancelingEdit" OnRowUpdating="gvNotes_RowUpdating" OnRowDeleting="gvNotes_RowDeleting">


            <Columns>

                <asp:TemplateField HeaderText="Note" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("note") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNote" Text='<%#Eval("note") %>' runat="server"  CssClass="input-small"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="noteRequiredValidator" runat="server" ErrorMessage="Note field is empty" ForeColor="Red" ControlToValidate="txtNote"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNoteFooter" runat="server"  CssClass="input-small"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="noteRequiredValidatorFooter" runat="server" ErrorMessage="Note field is empty" ForeColor="Red" ControlToValidate="txtNoteFooter"></asp:RequiredFieldValidator>--%>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit</span></span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="Delete" CausesValidation="false">
                                    <span class="tooltip"><i class="far fa-trash-alt"></i><span class="tooltiptext tooltip-i">Delete</span></span>
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
                            <asp:LinkButton runat="server" CommandName="Add" CssClass="button-main primary-btn"><i class="tooltip fas fa-plus-circle"></i> Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>

                

            </Columns>


        </asp:GridView>

        <br />

        <asp:Label ID="lblSuccessMsg" Visible="false" runat="server" ForeColor="Green"></asp:Label>
        <br />
        <asp:Label ID="lblErrorMsg" Visible="false" runat="server" ForeColor="Red"></asp:Label>
        <br />


    </div>


</asp:Content>
