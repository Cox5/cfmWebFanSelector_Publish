<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="SpecificProject.aspx.cs" Inherits="CFM_Web.Projects.SpecificProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title sub">
                    <asp:Label ID="lblProjectName" runat="server"></asp:Label></h1>

            </div>

            <span id="projectAddress" class="project-address" runat="server">
                <asp:Label ID="lblProjectAddress" runat="server"></asp:Label></span>
        </div>

        <asp:Button ID="btnEditProject" runat="server" Text="Edit Project" OnClick="btnEditProject_Click" />
        <asp:Button ID="btnFanLocations" runat="server" Text="Fan Locations" OnClick="btnFanLocations_Click" />
        <asp:Button ID="btnExtraItems" runat="server" Text="Extra items" OnClick="btnExtraItems_Click" />
        <asp:Button ID="btnNotes" runat="server" Text="Notes" OnClick="btnNotes_Click" />
        <asp:Button ID="btnPDFList" runat="server" Text="PDF List" OnClick="btnPDFList_Click" />
        <asp:Button ID="btnCloneProject" runat="server" Text="Clone Project" OnClick="btnCloneProject_Click" />

        <br />
        <a href="ProjectsDashboard.aspx">Back to project dashboard</a>

    </div>

</asp:Content>
