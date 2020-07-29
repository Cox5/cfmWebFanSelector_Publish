<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportDashboard.aspx.cs" Inherits="CFM_Web.ImportDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <span class="maintitle">
                    <asp:Label ID="lblImportText" runat="server">Admin Tools</asp:Label>
                    </span>
            </div>
        </div>
       

        <asp:LinkButton CommandName="Import Fan Prices" runat="server" Text="Import Fan Prices"  OnClick="btnImportPrices_Click" class="sp-button">
            <div class="sp-rect" >
                <span class="sp-text">Import Fan Prices</span>
                <span class="sp-icon">
                    <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Components" runat="server" Text="Import Components" OnClick="btnImportComponents_Click" class="sp-button">
            <div class="sp-rect" >
               <span class="sp-text">Import Components</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

         <asp:LinkButton CommandName="Import Extra Items" runat="server" Text="Import Extra Items" OnClick="btnImportExtraItems_Click" class="sp-button">
            <div class="sp-rect" >
               <span class="sp-text">Import Extra Items</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Build Fan Prices" runat="server" Text="Build Fan Prices" class="sp-button" OnClick="btnBuildFanPrices_Click">
            <div class="sp-rect" >
               <span class="sp-text">Build Fan Prices</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Impeller" runat="server" Text="Import Impeller" class="sp-button" OnClick="btnImportImpeller_Click" >
            <div class="sp-rect" >
               <span class="sp-text">Import Impeller</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Motor Prices" runat="server" Text="Import Motor Prices" class="sp-button" OnClick="btnImportMotorPrices_Click">
            <div class="sp-rect" >
               <span class="sp-text">Import Motor Prices</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Fan Data" runat="server" Text="Import Fan Data" class="sp-button" OnClick="btnImportFanData_Click">
            <div class="sp-rect" >
               <span class="sp-text">Import Fan Data</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Multiwing Data" runat="server" Text="Import Multiwing Data" class="sp-button" OnClick="btnImportMultiwingData_Click">
            <div class="sp-rect" >
               <span class="sp-text">Import Multiwing Data</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
        <asp:LinkButton CommandName="Delete Catalogue Fans" runat="server" Text="Delete Catalogue Fans" class="sp-button" OnClick="btnDeleteFans_Click">
            <div class="sp-rect" >
               <span class="sp-text">Delete Catalogue Fans</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
        <asp:LinkButton CommandName="List Imported Fans" runat="server" Text="List Imported Fans" class="sp-button" OnClick="btnListImports_Click">
            <div class="sp-rect" >
               <span class="sp-text">List Imported Fans</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

        
        <br />
        <a href="Dashboard.aspx"><i class="fas fa-chevron-left mt-solid"></i> Back to dashboard</a>
    

    </div>

</asp:Content>
