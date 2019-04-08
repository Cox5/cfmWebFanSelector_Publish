<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportDashboard.aspx.cs" Inherits="CFM_Web.ImportDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <span class="maintitle">
                    <asp:Label ID="lblImportText" runat="server">Import prices</asp:Label>
                    </span>

            </div>
        </div>
       

        <asp:LinkButton CommandName="Import Prices" runat="server" Text="Import Prices"  OnClick="btnImportPrices_Click" class="sp-button">
            <div class="sp-rect">
                <span class="sp-text">Import Prices</span>
                <span class="sp-icon">
                    <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Components" runat="server" Text="Import Components" OnClick="btnImportComponents_Click" class="sp-button">
            <div class="sp-rect" style="width: 320px;">
               <span class="sp-text">Import Components</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>


        <br />
        <a href="Projects/ProjectsDashboard.aspx"><i class="fas fa-chevron-left mt-solid"></i> Back to project dashboard</a>
    

    </div>

</asp:Content>
