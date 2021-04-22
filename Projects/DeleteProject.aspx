<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master"  AutoEventWireup="true" CodeBehind="DeleteProject.aspx.cs" Inherits="CFM_Web.Projects.DeleteProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div class="content-wrapper">

       <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Delete project</h1>
            </div>
            
            <div class="project-name" ><asp:Label ID="lblProjectName" runat="server" ></asp:Label></div>
            <div class="subtitle regular" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
        </div>
      
       <div id="deleteContainer" runat="server">
            <asp:Label ID="lblInfo" runat="server">Are you sure you want to delete this project?</asp:Label>
            
           
            <div class="mt-big mb-small">
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