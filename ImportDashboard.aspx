<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="ImportDashboard.aspx.cs" Inherits="CFM_Web.ImportDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>        div.gutter {
            height: 1px;
            width: 1px;
        }
    </style>
    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <span class="maintitle">
                    <asp:Label ID="lblImportText" runat="server">Admin Tools</asp:Label>
                    </span>
            </div>
        </div>
               <div style="float: left; width: 40%">

         <asp:LinkButton CommandName="Edit Fans" runat="server" Text="Edit Fans" class="sp-button" OnClick="btnEditFans_Click">
            <div class="sp-rect" >
               <span class="sp-text">Edit Fans</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

       <asp:LinkButton CommandName="Edit Std Fan Price" runat="server" Text="Edit Fans" class="sp-button" OnClick="btnEditFanPrices_Click">
            <div class="sp-rect" >
               <span class="sp-text">Edit Std Fan Prices</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

           <asp:LinkButton CommandName="Edit Motor Data" runat="server" Text="Edit Motor Data" class="sp-button" OnClick="btnEditMotorData_Click">
            <div class="sp-rect" >
               <span class="sp-text">Edit Motor Data</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
     
         <asp:LinkButton CommandName="Edit Motor Cases" runat="server" Text="Edit Motor Cases" class="sp-button" OnClick="btnEditMotorCases_Click">
            <div class="sp-rect" >
               <span class="sp-text">Edit Motor Cases</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

        </div>
        <div style="float: left; width: 40%">
         <asp:LinkButton CommandName="Edit Impellers" runat="server" Text="Edit Impellers" class="sp-button" OnClick="btnImpellerEditor_Click">
            <div class="sp-rect" >
               <span class="sp-text">Edit Impellers</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
 
        
         <asp:LinkButton CommandName="Ancillary Items" runat="server" Text="Ancillary Items" class="sp-button" OnClick="btnEditAncill_Click">
            <div class="sp-rect" >
               <span class="sp-text">Ancillary Items</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

         <asp:LinkButton CommandName="Ancillaries Categories" runat="server" Text="Ancillaries Categories" class="sp-button" OnClick="btnEditAncillCat_Click">
            <div class="sp-rect" >
               <span class="sp-text">Ancillaries Categories</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

         <asp:LinkButton CommandName="Downloads" runat="server" Text="Downloads" class="sp-button" OnClick="btnDownloads_Click">
            <div class="sp-rect" >
               <span class="sp-text">Downloads</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Fan Prices" runat="server" Text="Import Fan Prices"  OnClick="btnImportPrices_Click" class="sp-button" Visible="false" >
            <div class="sp-rect" >
                <span class="sp-text">Import Fan Prices</span>
                <span class="sp-icon">
                    <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Components" runat="server" Text="Import Components" OnClick="btnImportComponents_Click" class="sp-button" Visible="false" >
            <div class="sp-rect" >
               <span class="sp-text">Import Components</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

         <asp:LinkButton CommandName="Import Extra Items" runat="server" Text="Import Extra Items" OnClick="btnImportExtraItems_Click" class="sp-button" Visible="false" >
            <div class="sp-rect" >
               <span class="sp-text">Import Extra Items</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Build Fan Prices" runat="server" Text="Build Fan Prices" class="sp-button" OnClick="btnBuildFanPrices_Click" Visible="false" >
            <div class="sp-rect" >
               <span class="sp-text">Build Fan Prices</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Impeller" runat="server" Text="Import Impeller" class="sp-button" OnClick="btnImportImpeller_Click"  Visible="false" >
            <div class="sp-rect" >
               <span class="sp-text">Import Impeller</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Motor Prices" runat="server" Text="Import Motor Prices" class="sp-button" OnClick="btnImportMotorPrices_Click" Visible="false" >
            <div class="sp-rect" >
               <span class="sp-text">Import Motor Prices</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Fan Data" runat="server" Text="Import Fan Data" class="sp-button" OnClick="btnImportFanData_Click" Visible="false" >
            <div class="sp-rect" >
               <span class="sp-text">Import Fan Data</span> 
               <span class="sp-icon">
                   <i class="fas fa-dollar-sign icon"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Import Multiwing Data" runat="server" Text="Import Multiwing Data" class="sp-button" OnClick="btnImportMultiwingData_Click" Visible="false">
            <div class="sp-rect" >
               <span class="sp-text">Import Multiwing Data</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
        <asp:LinkButton CommandName="Delete Catalogue Fans" runat="server" Text="Delete Catalogue Fans" class="sp-button" OnClick="btnDeleteFans_Click" Visible="false">
            <div class="sp-rect" >
               <span class="sp-text">Delete Catalogue Fans</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
        <asp:LinkButton CommandName="List Imported Fans" runat="server" Text="List Imported Fans" class="sp-button" OnClick="btnListImports_Click" Visible="false">
            <div class="sp-rect" >
               <span class="sp-text">List Imported Fans</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
           <asp:LinkButton CommandName="Show price calc errors" runat="server" Text="Show price calc errors" class="sp-button" OnClick="btnPriceLog_Click" Visible="true">
            <div class="sp-rect" >
               <span class="sp-text">Show price calc errors</span> 
               <span class="sp-icon">
                  <i class="fas fa-cog"></i>
                </span>
            </div>
        </asp:LinkButton>
            </div>
   

    </div>

</asp:Content>
