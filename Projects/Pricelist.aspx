<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Pricelist.aspx.cs" Inherits="CFM_Web.Projects.Pricelist" %>

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


        <div class="table-controls center-text">
            <span class="mr-small">Standard price adjustment (%) </span>
            <asp:TextBox class="mr-small" ID="txtPercentage" runat="server" Placeholder="20" Height="32px" Width="100px"></asp:TextBox>
            <asp:DropDownList  class="mr-small" runat="server" ID="ddlPriceAdjustment"  Height="32px" Width="150px">
                        <asp:ListItem Text="Discount" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Premium" Value="1"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button  ID="btnUpdatePriceAdjustment" runat="server" Text="Update" OnClick="btnUpdatePriceAdjustment_Click" class="button-main primary-btn mr-small" />
        </div>
            <asp:RangeValidator ID="rangeQtyValidator" runat="server" ControlToValidate="txtPercentage" Type="Integer" MinimumValue="0" MaximumValue="25" ErrorMessage="Please enter discount or premium value between 0 and 25 percent" ForeColor="Red"></asp:RangeValidator>
    
       

    

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

                <asp:BoundField DataField="price" HeaderText="Catalogue Price ($)" ReadOnly="true" HeaderStyle-HorizontalAlign="Left">
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
                        <asp:TextBox ID="txtManualPriceValue" runat="server" Text='<%#Eval("price_value") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/icons/editblue.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="18px" Height="18px" >
                        </asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/icons/saveblue.png" runat="server" CommandName="Update" ToolTip="Update" Width="18px" Height="18px" />
                        <asp:ImageButton ImageUrl="~/icons/cancelblue.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="18px" Height="18px" />
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>


        </asp:GridView>

    <br />
    
    <div class="right-controls mt-medium mr-small">
    
        <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
        <br/>
        <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>
        <asp:Button ID="btnFinish" Text="Finished" runat="server" OnClick="btnFinish_Click"  class="button-main primary-btn" CausesValidation="false"/>
    </div>

</div>
</asp:Content>
