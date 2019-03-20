<%@ Page Title="Fan Locations" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Fans.aspx.cs" Inherits="CFM_Web.Projects.Fans" %>
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
                <h1 class="table-title sub">Fan Locations</h1>
                
                <td id="addFanCol" align="right" runat="server"><a href="<%= getAddFanLocationsURL() %>" class="button-main primary-btn"><i class="fas fa-plus-circle"></i> Add Fan Locations</a></td>
            </div>
            
            <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
        </div>

        <table id="fanLocationsTable" class="table project">
            <thead>
                <tr>
                    <td >Description</td>
                    <td>Designation</td>
                    <td >Airflow</td>
                    <td >St.Pr.</td>
                    <td>CFM Fan</td>
                    <td align="right">Qty</td>
                    <td id="tdPrice" align="right">
                        <asp:Label ID="lblPrice" runat="server" >Price</asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>

            </thead>
                <%= getProjectFans() %>
            <tr>
                <td colspan="2" align="left"><asp:Label ID="lblSuccessMsg" runat="server"></asp:Label></td>
                <td colspan="7" align="right" style="height: 60px">
                    <%--<a href="<%= getPricelistURL() %>" id="pricelistHref" runat="server" class="button-main primary-btn">Go to Pricelist</a>--%>
                    <asp:Button CssClass="button-main primary-btn" ID="btnRequestPricing" runat="server"
                      OnClientClick = "Confirm()"
                      OnClick="OnConfirm" 
                      Text="Request Pricing" Visible="false"/>
                    <asp:Button ID="btnGoToPricelist" runat="server" CssClass="button-main primary-btn" Text="Go to Pricelist" OnClick="btnGoToPricelist_Click" />
                    <a href="/Projects/ProjectsDashboard.aspx" class="button-main primary-btn">Finished <i class="fas fa-chevron-right"></i></a>
                </td>
            </tr>
        </table>
  </div>
</asp:Content>
