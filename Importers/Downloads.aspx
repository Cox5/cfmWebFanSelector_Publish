<%@ Page Title="Downloads" Language="C#" AutoEventWireup="true" CodeBehind="Downloads.aspx.cs" Inherits="CFM_Web.Importers.Downloads"
    MasterPageFile="~/fanselection.Master" %>


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

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinished_Click" runat="server" />
      </div>
        <h3>Download CSV</h3>


        <br />
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

        <div class="table-controls mb-medium">
               <div style="float:left; margin-left: 20px"> Table to download
                <asp:DropDownList ID="ddlTable" runat="server">
                    <asp:ListItem Value="motor_case_new">Motor Cases</asp:ListItem>
                    <asp:ListItem Value="motordata">Motor Data</asp:ListItem>
                    <asp:ListItem Value="impeller_prices">Impellers</asp:ListItem>
                     <asp:ListItem Value="components">Ancillary Items</asp:ListItem>
                    <asp:ListItem Value="components_category">Ancillaries Categories</asp:ListItem>
                     <asp:ListItem Value="fan_pricelist">Standard Fan Prices</asp:ListItem>
                    <asp:ListItem Value="fan_diagrams">Fan Diagrams</asp:ListItem>
                </asp:DropDownList></div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px"><asp:Button ID="btnShow" class="button-main primary-btn"  runat="server" Visible="true" Text="Show" OnClick="btnShow_Click" /></div>
             <div style="float:left;  margin-left: 20px; margin-top: 5px"><asp:Button ID="btnDownload" class="button-main primary-btn"  runat="server" Visible="true" Text="Download" OnClick="btnDownload_Click" /></div>
        </div>
        <div style="clear: both"></div>
        <div runat="server" id="divOutput"></div>
        </asp:Content>
