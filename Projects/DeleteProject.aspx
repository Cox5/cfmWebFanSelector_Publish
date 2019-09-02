<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master"  AutoEventWireup="true" CodeBehind="DeleteProject.aspx.cs" Inherits="CFM_Web.Projects.DeleteProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="content-wrapper">
        
       <h3>Delete project: <asp:Label class="bold" ID="projectName" runat="server"></asp:Label></h3>
       <div id="deleteContainer" runat="server">
            <p>Are you sure you want to delete this project?</p>
            
           
            <div class="mt-medium mb-small">
                <asp:Button ID="btnDelete"  class="button-main tertiary-btn" Text="Delete" runat="server" OnClick="btnDelete_Click" />
                <asp:Button ID="btnCancel" class="button-main quarternary-btn"  Text="Cancel" runat="server" OnClick="btnCancel_Click" />
            </div>
        </div>
       
        <div class="mt-medium mb-medium">
            <asp:Label ID="lblSuccessMsg" class="label-success" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblErrorMsg" class="label-error" runat="server" Visible="false"></asp:Label>
        </div>

        <asp:Button ID="btnFinished"  class="button-main primary-btn"  Visible="false" Text="Finished" runat="server" OnClick="btnFinished_Click" />
    </div>
</asp:Content>