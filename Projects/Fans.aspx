﻿<%@ Page Title="Fan References Schedule" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="CFM_Web.Projects.Fans" %>
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
window.onload = function(){
    var strCook = document.cookie;
    if(strCook.indexOf("!~")!=0){
      var intS = strCook.indexOf("!~");
      var intE = strCook.indexOf("~!");
      var strPos = strCook.substring(intS+2,intE);

      document.getElementById("dvScroll").scrollTop = strPos;
    }
    setInterval('SetDivPosition()', 500);

  }
  function SetDivPosition(){
    var intY = document.getElementById("dvScroll").scrollTop;

    document.cookie = "yPos=!~" + intY + "~!";
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
                    <td style="width: 2%;">&nbsp;</td>
                    <td style='width: 10%;text-align:left'>Fan Reference</td>
                    <td style='width: 10%;text-align:left'>Fan Type</td>
                    <td style='width: 7%;text-align:center' >Airflow<br />(l/s)</td>
                    <td style='width: 7%;text-align:center' >Static Pr.<br /> (Pa)</td>
                    <td style='width: 10%;text-align:center' >Speed/<br />Phase/Poles</td>
                    <td style='width: 20%;text-align:left'>CFM Fan</td>
                    <td style='width: 5%;text-align:center'>Qty</td>
                    <td id="tdPrice" style='width: 7%;text-align:right'><%= showPrices ? "Price" : "" %></td>
                    <td style='width: 5%;text-align:right' >&nbsp;</td>
                    <td style="width: 12%;">&nbsp;</td>
                </tr>

            </thead>
       </table>
       <div id="dvScroll" style="overflow-x:hidden; overflow-y: scroll; height: 600px; width: 100%">
       <table id="fanLocationsTable" class="table project">
              <% for (int i = 0; i < fanReferences.Count; i++) { %>
                 <tr class="has-sub">
                     <td style="width: 2%;" class="sub"><%= getPositionAction(i+1, fanReferences[i].ProjectFanId) %> </td>
                     <td style="width: 10%;"><%= fanReferences[i].FanReferenceCode %></td>
                     <td style="width: 10%;"><%= fanReferences[i].FanType %></td>
                     <td style="width: 7%; text-align:center"><%= fanReferences[i].AirFlow %></td>
                     <td style="width: 7%; text-align:center"><%= fanReferences[i].StaticPressure %></td>
                     <td style="width: 10%; text-align:center"><%= fanReferences[i].Speed %>/<%= fanReferences[i].Phase %>/<%= fanReferences[i].Poles %></td>
                     <td style="width: 20%;"><%= fanReferences[i].PartNumber %><%= fanReferences[i].Angle %></td>
                     <td style="width: 5%; text-align:right"><%= fanReferences[i].Qty %></td>
                     <td style="width: 7%; text-align:right"><%= showPrices ? fanReferences[i].PriceValue > 0 ? Math.Round(fanReferences[i].PriceValue, 2).ToString("0.00") : "<span class='darkred'>n/a</span>" : "" %></td>
                     <td class="sub" style='text-align:right; width: 5%;'><div><%= getCopyPaste(fanReferences[i]) %> <%= getCutPutURL(fanReferences[i]) %></div></td>
                     <td style="width: 12%;" class="icons icones-smaller"><%= 
                          getControls(fanReferences[i].ProjectId, fanReferences[i].ProjectFanId, fanReferences[i].AirFlow, 
                                        fanReferences[i].StaticPressure, fanReferences[i].FanDataId, fanReferences[i].Phase, fanReferences[i].Speed ) 
                            %></td>
                 </tr>
             <% } %>

                    <%--<a href="<%= getPricelistURL() %>" id="pricelistHref" runat="server" class="button-main primary-btn">Go to Pricelist</a>--%>                   
                    <%--<a href="javascript: history.go(-1)" class="button-main primary-btn">Finished <i class="fas fa-chevron-right"></i></a>--%>
           </table>
           <table>
            <tr><td colspan="9"><asp:Button ID="btnPrevPage" runat="server"  CssClass="button-main primary-btn prevpage" Text="<< Previous page" OnClick="btnFinished_Click" /></td></tr>
        </table>
    </div>
  </div>
</asp:Content>
