<%@ Page Title="Fan Locations Schedule" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="CFM_Web.Projects.Fans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you are ready to request pricing for your project?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-wrapper">



        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Fan References</h1>
                
                <td id="addFanCol" align="right" runat="server"><a href="<%= getAddFanLocationsURL() %>" class="button-main primary-btn"><i class="fas fa-plus-circle"></i> Add Fan References</a></td>
            </div>
            
            <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
        </div>

        <table id="fanLocationsTable" class="table project">
            <thead>
                <tr>
                    <td>&nbsp;</td>
                    <td>Fan Reference</td>
                    <td >Airflow Rate</td>
                    <td >St.Pr.</td>
                    <td>CFM Fan</td>
                    <td align="center">Qty</td>
                    <td id="tdPrice" align="right">Price
                    </td>
                    <td>&nbsp;</td>
                </tr>

            </thead>

              <% for (int i = 0; i < fanReferences.Count; i++) { %>
                 <tr>
                     <%--todo: make link and UPDATE table on page load based on URL params--%>
                     <td>    <%= getPositionAction(i+1, fanReferences[i].ProjectFanId) %> </td>
                     <td><%= fanReferences[i].FanReferenceCode %></td>
                     <td><%= fanReferences[i].AirFlow %></td>
                     <td><%= fanReferences[i].StaticPressure %></td>
                     <td><%= fanReferences[i].PartNumber %></td>
                     <td align="center"><%= fanReferences[i].Qty %></td>
                     <td align="right"><%= Math.Round(fanReferences[i].PriceValue, 2).ToString("0.00") %></td>
                     <td class="icons"><%= getControls(fanReferences[i].ProjectId, fanReferences[i].ProjectFanId, fanReferences[i].AirFlow, fanReferences[i].StaticPressure, fanReferences[i].FanDataId) %></td>
                 </tr>
             <% } %>
            <tr>
                <td colspan="2" align="left"><asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
                </td>
                <td colspan="7" align="right" style="height: 60px">
                    <%--<a href="<%= getPricelistURL() %>" id="pricelistHref" runat="server" class="button-main primary-btn">Go to Pricelist</a>--%>
                    <asp:Button CssClass="button-main primary-btn" ID="btnRequestPricing" runat="server"
                      OnClientClick = "Confirm()"
                      OnClick="OnConfirm" 
                      Text="Request Pricing" Visible="false"/>
                    <asp:Button ID="btnExtraItems" runat="server" CssClass="button-main primary-btn" Text="Extras" OnClick="btnExtraItems_Click" />
                    <asp:Button ID="btnGoToPricelist" runat="server" CssClass="button-main primary-btn" Text="Go to Pricelist" OnClick="btnGoToPricelist_Click" />
                    <asp:Button ID="btnFinished" runat="server"  CssClass="button-main primary-btn" Text="Finished" OnClick="btnFinished_Click" />
                    <%--<a href="javascript: history.go(-1)" class="button-main primary-btn">Finished <i class="fas fa-chevron-right"></i></a>--%>
                </td>
            </tr>
        </table>
  </div>
</asp:Content>
