﻿<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ProjectNotes.aspx.cs" Inherits="CFM_Web.Projects.ProjectNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">

                <h1>
                    <span id="projectName" class="project-name" runat="server">
                        <asp:Label ID="lblProjectName" runat="server"></asp:Label></span>
                </h1>
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

        <div class="right-controls mt-medium">

            <asp:LinkButton runat="server" CommandName="Finish" OnClick="btnFinish_Click" CausesValidation="false" class="button-main primary-btn" >Finished <i class="fas fa-chevron-right"></i></asp:LinkButton>
            <!-- <asp:Button ID="btnFinish" Text="Finished" runat="server" OnClick="btnFinish_Click" class="button-main primary-btn" CausesValidation="false" /> -->
        </div>

    </div>


</asp:Content>