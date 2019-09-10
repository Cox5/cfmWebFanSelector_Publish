<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="DeleteFanLocation.aspx.cs" Inherits="CFM_Web.Projects.DeleteFanLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="content-wrapper">
    <table class="table table-form" id="fanLocationsTable" runat="server">
        <tr><td colspan="2" align="left" class="tabletitle">Delete Fan Location</td><td colspan="4"><span id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td></tr>
        
        <tr><td><asp:Label ID="lblWarning" runat="server" Font-Bold="true">Warning: Deleting a fan reference affects existing PDFs. Existing PDFs will be flagged as out of date.</asp:Label></td></tr>
        <tr style="height: 50px"><td><b>Are you sure you wish to delete?</b></td></tr>
        <tr>
            <td id="fanLocationCol"></td>
            <td id="airflowCol"></td>
            <td id="stPressCol"></td>
            <td id="modelNumCol"></td>
            <td id="qtyCol"></td>
        </tr>
    </table>

        <div class="right-controls mt-medium">
                <td></td><asp:Button ID="btnDelete"  class="button-main tertiary-btn" Text="Delete" runat="server" OnClick="btnDeleteFanLocation" /></td>
                 <td><asp:Button ID="btnCancel" class="button-main quarternary-btn"  Text="Cancel" runat="server" OnClick="btnCancel_Click" /></td>
        </div>
       <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
    </div>
</asp:Content>
