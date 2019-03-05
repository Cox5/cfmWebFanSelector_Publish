<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="DeleteFanLocation.aspx.cs" Inherits="CFM_Web.Projects.DeleteFanLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="content-wrapper">
    <table id="fanLocationsTable" style="width: 700px" runat="server">
        <tr><td colspan="2" align="left" class="tabletitle">Delete Fan Location</td><td colspan="4"><span id="projectName" runat="server"><asp:Label ID="lblProjectName" runat="server" Font-Bold="true"></asp:Label></span></td></tr>
        <tr><td><asp:Label ID="lblWarning" runat="server" Font-Bold="true">Warning: Deleting a fan location affects existing PDFs. Existing PDFs will be flagged as out of date</asp:Label></td></tr>
        <tr><td><b>Are you sure you wish to delete</b></td></tr>
        <tr>
            <td id="locationDescCol"></td>
            <td id="airflowCol"></td>
            <td id="stPressCol"></td>
            <td id="modelNumCol"></td>
            <td id="qtyCol"></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDeleteFanLocation" /></td>
            <td><asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" /></td>

        </tr>
    </table>
       <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
    </div>
</asp:Content>
