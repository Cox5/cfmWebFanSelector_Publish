<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="MotorCase.aspx.cs" Inherits="CFM_Web.Importers.MotorCase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper" style="max-width: 600px;">
        <div id="info_view" runat="server">
            <asp:LinkButton runat="server" CommandName="Finish" OnClick="btnFinish_Click" class="button-main primary-btn" >Finish</asp:LinkButton>
        </div>
        <div id="table_view" runat="server" >
            <div class="mb-solid mt-solid">

            <div class="table-controls">
                <h1 class="table-title maintitle">Motor Case Editor</h1>
            </div>
        </div>

             <asp:GridView ID="gvMotorCase" runat="server" AutoGenerateColumns="False" ShowFooter="true" ShowHeaderWhenEmpty="true"
                DataKeyNames="id" HorizontalAlign="Center" GridLines="None" CssClass="table project" OnRowCommand="gvMotorCase_RowCommand" 
                 OnRowEditing="gvMotorCase_RowEditing" OnRowCancelingEdit="gvMotorCase_RowCancelingEdit" 
                 OnRowUpdating="gvMotorCase_RowUpdating" OnRowDeleting="gvMotorCase_RowDeleting" > 

                <Columns>
                       
                    <asp:TemplateField  HeaderText="Diameter" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("diameter") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiameter" Text='<%#Eval("diameter") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDiameterFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField  HeaderText="Motor Frame" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMotorFrame" Text='<%#Eval("motor_frame") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorFrameFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("motor_frame") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField  HeaderText="Length" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLength" Text='<%#Eval("length") %>' runat="server" Enabled="false" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMotorLengthFooter" runat="server" AutoPostBack="false" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("length") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField  HeaderText="Weight (kg)" ControlStyle-Width="70px" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Left">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtWeight" Text='<%#Eval("weight") %>' runat="server" Enabled="true" CssClass="input-small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtWeightFooter" runat="server" />
                        </FooterTemplate>
                       <ItemTemplate>
                            <asp:Label Text='<%#Eval("weight") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField ItemStyle-Width="70px"  HeaderStyle-Width="70px"  ItemStyle-CssClass="icons" HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="false">
                                <span class="tooltip"><i class="fas fa-pencil-alt"></i><span class="tooltiptext tooltip-i">Edit</span></span>
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
                            <asp:LinkButton runat="server" ID="ButtonAdd"  CssClass="button-main primary-btn"><i class="tooltip fas fa-plus-circle"></i> Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                 </asp:GridView>
    </form>
            </div>
</body>
</html>
 </asp:Content>

