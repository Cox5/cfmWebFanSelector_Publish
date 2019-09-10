<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Pricelist.aspx.cs" Inherits="CFM_Web.Projects.Pricelist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Fan Pricelist</h1>
            </div>
            
            <div class="project-name" ><asp:Label ID="lblProjectName" runat="server" ></asp:Label></div>
            <div class="subtitle darkred regular" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
        </div>

    

        <div class="table-controls center-text">
            <span class="mr-small">Standard price adjustment (%) </span>
            <asp:TextBox class="mr-small" ID="txtPercentage" runat="server" Placeholder="20" Height="32px" Width="100px"></asp:TextBox>%
            <asp:DropDownList  class="mr-small" runat="server" ID="ddlPriceAdjustment"  Height="32px" Width="150px">
                        <asp:ListItem Text="Discount" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Premium" Value="1"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button  ID="btnUpdatePriceAdjustment" runat="server" Text="Update" OnClick="btnUpdatePriceAdjustment_Click" class="button-main primary-btn mr-small" />
        </div>

        <div class="center-text mt-medium">
            <asp:RangeValidator ID="rangeQtyValidator" runat="server" ControlToValidate="txtPercentage" Type="Integer" MinimumValue="0" MaximumValue="25" ErrorMessage="Please enter discount or premium value between 0 and 25 percent (without % sign)" ForeColor="Red"></asp:RangeValidator>
            <asp:Label runat="server" ID="lblUpdateStatus"></asp:Label>

        </div>
    
       

    

        <asp:GridView ID="gvPriceList" runat="server" AutoGenerateColumns="False"
            OnRowEditing="gvPriceList_RowEditing" OnRowCancelingEdit="gvPriceList_RowCancelingEdit" 
            OnRowUpdating="gvPriceList_RowUpdating" OnRowDataBound="gvPriceList_RowDataBound"
            DataKeyNames="project_fan_id" HorizontalAlign="Center" Gridlines="None" CssClass="table project" OnSelectedIndexChanged="gvPriceList_SelectedIndexChanged">
            

            <Columns>
                <asp:BoundField DataField="part_number" HeaderText="Model Number" ReadOnly="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="quantity" HeaderText="Qty" ReadOnly="true" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:BoundField>

                <asp:BoundField DataField="price" HeaderText="Catalogue Price ($)" ReadOnly="true" HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:BoundField>

                <asp:TemplateField HeaderText="Price Type" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblPriceType" runat="server" Text='<%#Eval("price_type") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblPriceTypeEdit" runat="server" Visible="false" Text='<%#Eval("price_type") %>'></asp:Label>
                        <asp:DropDownList ID="ddlPriceType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPriceType_SelectedIndexChanged">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Calculated Price" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblCalculatedPrice" runat="server" Text='<%#Eval("price_value") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="120px" HeaderText="Manual Price" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblManualPrice" runat="server" Text='<%#Eval("price_value") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtManualPriceValue" runat="server" Text='<%#Eval("price_value") %>' CssClass="input-small"  autocomplete="off" ></asp:TextBox>
                    </EditItemTemplate>
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
                        <asp:LinkButton runat="server" CommandName="Add" CssClass="button-main primary-btn"><i class="tooltip fas fa-plus-circle"></i> Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>

            </Columns>


        </asp:GridView>

    <br />

    <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
    <br/>
    <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>
    <br />

    <div class="right-controls mt-medium">
        <asp:DropDownList runat="server" ID="ddlPricelistAction" style="width: auto" AutoPostBack="true" OnSelectedIndexChanged="ddlPricelistAction_SelectedIndexChanged">
                <asp:ListItem Text="Return to Fan List" Value="1"></asp:ListItem>
                <asp:ListItem Text="Mark pricing as completed" Value="2"></asp:ListItem>
                <asp:ListItem Text="Mark pricing as completed and email project owner" Value="3"></asp:ListItem>
        </asp:DropDownList> <asp:LinkButton runat="server" CommandName="Exit" OnClick="btnGo_Click" CausesValidation="false" class="button-main primary-btn" >Go <i class="fas fa-chevron-right"></i></asp:LinkButton>
    </div>

</div>
</asp:Content>
