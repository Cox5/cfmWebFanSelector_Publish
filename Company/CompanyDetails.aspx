<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="CFM_Web.Company.CompanyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">

      <div class="table-controls mt-solid mb-solid">
        <h1 class="table-title maintitle">Companies</h1>
  
      </div>

   

      
<%--      <div class="table-controls center-text mb-medium">
          <asp:TextBox ID="txtSearch" runat="server" Placeholder="search for project name, company or address" Width="430px" Height="32px" class="mr-small"></asp:TextBox>
          <asp:Button ID="btnSearchProject" runat="server" Text="Search" OnClick="btnSearchForProject_Click" class="button-main primary-btn" />
      </div>--%>

    
    <table class="table project">
        <thead>
          <tr>
            <td width="25%">Company Name</td>
            <td width="27%">Address</td>
            <td width="29%">Website</td>
            <td ></td>
          </tr>
        </thead>
          
         <%= getCompanies() %>

        
    </table>

    <div class="right-controls mt-medium">
      <a href="/Dashboard.aspx" class="button-main primary-btn mt-medium"><i class="fas fa-angle-left"></i> Go Back</a>
    </div>
    

  </div>

</asp:Content>
