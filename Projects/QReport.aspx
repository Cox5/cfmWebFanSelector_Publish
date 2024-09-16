<%@ Page Title="Quotation Reports" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="True" CodeBehind="QReport.aspx.cs" Inherits="CFM_Web.Projects.QReport" runat="server" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


  <div class="content-wrapper projects-wrapper">

      <div class="table-controls mt-solid mb-solid">
        <h1 ID="h1Projects" runat="server" class="table-title maintitle">Quotations Report</h1>
  <p id="myHeader" runat="server"></p>
      
      </div>
        <style>
                .fleft {float:left;  margin-left: 10px; margin-top: 5px}
                .smbtn {  width: 90px !important;  }
            </style>
      <div class="table-controls center-text mb-medium">Select period for report
            <asp:DropDownList ID="ddlPeriod" runat="server" AutoPostBack="False">
                <asp:ListItem Text="Last Quarter" Value="lq" />
                <asp:ListItem Text="Last Half-Year" Value="lhy" />
                <asp:ListItem Text="Last Financial Year" Value="lfy" />
                <asp:ListItem Text="This Financial Year" Value="tfy" />
            </asp:DropDownList>
           <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

        </div>
     
    <asp:HiddenField ID="howIsSortedQuote" runat="server" />
    <asp:HiddenField ID="howIsSortedProjectName" runat="server" />
    <asp:HiddenField ID="howIsSortedComp" runat="server" />
    <asp:HiddenField ID="howIsSortedContact" runat="server" />
    <asp:HiddenField ID="lastSort1" runat="server" />
    <asp:HiddenField ID="lastSort2" runat="server" />

    <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>

    <table class="table project">
        <thead>
          <tr>
            <td width="10%">Quote No. </td>
            <td width="10%">Quote Date </td>
            <td width="40%">Project </td>
            <td width="27%">Company </td>
            <td width="12%">Sales Contact </td>
            </tr>
        </thead>
          <tbody>
         <% 
            if (ppp != null)
            {

                 foreach (var p in ppp)
                 {%>
                    <%= p.Html %>

             <% }
            }                 
          %>

        </tbody>
    </table>
  </div>

</asp:Content>

