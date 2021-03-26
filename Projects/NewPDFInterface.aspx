<%@ Page Title="New PDF List" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="NewPDFInterface.aspx.cs" Inherits="CFM_Web.Projects.NewPDFInterface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

            <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">PDF Specification</h1>                  
            </div>
            <div class="right-controls mr-small" style="float: right;" id="finishedbuttondiv">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnCancel_Click" runat="server" />
              </div>             
            <div class="project-name" >
                <asp:Label ID="lblProjectNameDisplay" runat="server" ></asp:Label>
                <asp:Label ID="lblProjectName" runat="server" visible="false"></asp:Label>
            </div>
            <div class="subtitle regular" id="quoteNumberLine" runat="server" Visible="false" style="float: left; max-width: 50%">Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>


            </div>
                  <script>
                        // Shows Searching box after Search button click
                        function showpleasewait() {
                            document.getElementById('pleasewait').style.visibility = 'visible';
                            document.getElementById('pleasewait').style.display = 'block';
                          
                            document.getElementById('finishedbuttondiv').style.visibility = 'hidden';
                            document.getElementById('maincontent').style.visibility = 'hidden';
                            document.getElementById('maincontent').style.display = 'none';
                         
                        }
                     </script>
            <div id="pleasewait" style="width: 100%; height: 100%; font-size: 20px; text-align:center; background-color: white; visibility: hidden; display:none"> 
                <center>Please wait while the PDF is generated.</center>
               <img style="margin: auto auto" src="/Images/loading-ring2.gif" />
            </div>

        <div style="clear: both"></div>
        <div id="maincontent">
        <table class="table project" style="width: 400px">
            <tr>
                <td>Cover Page</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkCoverPage" runat="server" Checked="true" /></td>
            </tr>
            <tr>
                <td>Project Fan list</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkProjectFanList" runat="server" Checked="true"/></td>
            </tr>
            <tr>
                <td>Fan Specifications tables</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanSpecTables" runat="server" Checked="true"/></td>
            </tr>
            <tr>
                <td>Fan Technical Datasheets</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanTechDatasheets" runat="server" Checked="true" /></td>
            </tr>
            <tr>
                <td>Fan Dimensional Diagrams</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanDimensDiagrams" runat="server" Checked="true" /></td>
            </tr>
            <tr>
                <td>Fan Wiring Diagrams</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkFanWiringDiagrams" runat="server" /></td>
            </tr>
            <tr id="pricesTd" runat="server">
                <td>Include Prices</td>
                <td class="tiny-td right"><asp:CheckBox ID="chkIncludePrices" runat="server" Checked="true" /></td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: white">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div style="clear:both"></div>
        <table>
            <tr>

            <td><asp:Button ID="btnSubmit" class="button-main primary-btn" style='background-color:forestgreen !important' runat="server" Text="Generate PDF" OnClick="btnSubmit_Click" onClientClick="showpleasewait();"  /></td>
            <td><asp:Button ID="Button1" class="button-main primary-btn" runat="server" Text="Clear all" OnClick="btnClearAll_Click" /></td>
            <td><asp:Button ID="Button2" class="button-main primary-btn" runat="server" Text="Select all" OnClick="btnSelectAll_Click" /></td>
                            </tr>
        </table>
        </div>
        </div>
</asp:Content>
