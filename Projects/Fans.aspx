<%@ Page Title="Fan References Schedule" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="CFM_Web.Projects.Fans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you are ready to request pricing for your project?")) {
                confirm_value.value = "Yes";
                document.forms[0].appendChild(confirm_value);
                return true;
            } else {
                confirm_value.value = "No";
                document.forms[0].appendChild(confirm_value);
                return false;
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">



        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Fan References</h1>
                <div class="right-button clearfix">
                    <asp:Button ID="btnFinished" runat="server"  CssClass="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinished_Click" />
                    <asp:Button ID="btnClose" runat="server"  CssClass="button-main primary-btn prevpage" Text="<< Previous Page" OnClick="btnClose_Click" Visible="false"/>
                    <a href="<%= getAddFanLocationsURL() %>" class="button-main primary-btn"><i class="fas fa-plus-circle"></i> Add Fan References</a>
                    <asp:Button ID="btnExtraItems" runat="server" CssClass="button-main primary-btn" Text="Extras" OnClick="btnExtraItems_Click" />
                    <asp:Button ID="lblPricingRequested" runat="server" CssClass="button-main primary-btn" Text="Pricing Requested" Disabled="true" Visible="false"/>
                    <asp:Button ID="btnGoToPricelist" runat="server" CssClass="button-main primary-btn" Text="Go to Pricelist" OnClick="btnGoToPricelist_Click" />
                    <asp:Button CssClass="button-main primary-btn" ID="btnRequestPricing" runat="server" OnClientClick = "if ( !Confirm()) return false;" OnClick="OnConfirm"         
                      Text="Request Pricing" Visible="false"/>
                </div>
            </div>
            
            <div id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></div>
            <div class="subtitle regular" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
        </div>
<style>
.sub div { visibility: hidden; }
.has-sub:hover > .sub div { visibility: visible; } 
}
</style>
        <table id="fanLocationsTable" class="table project">
            <thead>
                <tr>
                    <%--<td>No</td>--%>
                    <td>&nbsp;</td>
                    <td style='text-align:left'>Fan Reference</td>
                    <td style='text-align:center' >Airflow (l/s)</td>
                    <td style='text-align:center' >Static Pressure (Pa)</td>
                    <td style='text-align:left'>CFM Fan</td>
                    <td style='text-align:center'>Qty</td>
                    <td id="tdPrice" style='text-align:right'><%= showPrices ? "Price" : "" %></td>
                    <td align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

            </thead>

              <% for (int i = 0; i < fanReferences.Count; i++) { %>
                 <tr class="has-sub">
                     <%--todo: make link and UPDATE table on page load based on URL params--%>
                     
<%--                     <td><%= fanReferences[i].Position %></td>--%>
                     <td class="sub"><%= getPositionAction(i+1, fanReferences[i].ProjectFanId) %> </td>
                     <td><%= fanReferences[i].FanReferenceCode %></td>
                     <td style='text-align:center'><%= fanReferences[i].AirFlow %></td>
                     <td style='text-align:center'><%= fanReferences[i].StaticPressure %></td>
                     <td><%= fanReferences[i].PartNumber %><%= fanReferences[i].Angle %></td>
                     <td style='text-align:center'><%= fanReferences[i].Qty %></td>
                     <td style='text-align:right'><%= showPrices ? fanReferences[i].PriceValue > 0 ? Math.Round(fanReferences[i].PriceValue, 2).ToString("0.00") : "<span class='darkred'>n/a</span>" : "" %></td>
                     <td class="sub" style='text-align:right; width: 50px;'><div><%= getCopyPaste(fanReferences[i]) %> <%= getCutPutURL(fanReferences[i]) %></div></td>
                     <td class="icons icones-smaller"><%= getControls(fanReferences[i].ProjectId, fanReferences[i].ProjectFanId, fanReferences[i].AirFlow, fanReferences[i].StaticPressure, fanReferences[i].FanDataId) %></td>
                 </tr>
             <% } %>

                    <%--<a href="<%= getPricelistURL() %>" id="pricelistHref" runat="server" class="button-main primary-btn">Go to Pricelist</a>--%>                   
                    <%--<a href="javascript: history.go(-1)" class="button-main primary-btn">Finished <i class="fas fa-chevron-right"></i></a>--%>
            <tr><td colspan="9"><asp:Button ID="btnPrevPage" runat="server"  CssClass="button-main primary-btn prevpage" Text="<< Previous page" OnClick="btnFinished_Click" /></td></tr>
        </table>
  </div>
</asp:Content>
