<%@ Page Title="" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="SpecificProject.aspx.cs" Inherits="CFM_Web.Projects.SpecificProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <span class="maintitle">
                    <asp:Label ID="lblProjectName" runat="server"></asp:Label></span>

            </div>

            <span id="projectAddress" class="subtitle" runat="server">
                <asp:Label ID="lblProjectAddress" runat="server"></asp:Label></span>

            <div class="projOtherDetails" runat="server">
                    
                Quote number: <asp:Label ID="lblProjectQuoteNumber" runat="server" class="lblOtherDetails"></asp:Label>
            
            </div>

            <div class="projOtherDetails" runat="server">
                    
                Salesperson: <asp:Label ID="lblProjectSalesperson" runat="server" class="lblOtherDetails"></asp:Label>
            
            </div>
        </div>
        

        <asp:LinkButton CommandName="Edit Project" runat="server" OnClick="btnEditProject_Click" class="sp-button">
            <div class="sp-rect">
                <span class="sp-text">Edit Project</span>
                <span class="sp-icon"> 
                    <i class="fas fa-pencil-alt"></i>
                </span> 
            </div>
        </asp:LinkButton>



        <asp:LinkButton CommandName="Fan Locations"  runat="server" OnClick="btnFanLocations_Click" class="sp-button">
            
            <div class="sp-rect">
                    <span class="sp-text">Fan References</span>
                    <span class="sp-icon">
                            <img src='/icons/fanicon.svg' class="sp-svg" alt='Fan References'> 
                    </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Extra Items" ID="linkExtraItems" runat="server"  OnClick="btnExtraItems_Click" class="sp-button">
            <div class="sp-rect">
                
                <span class="sp-text">Extra Items</span>
                <span class="sp-icon">
                    <i class="far fa-plus-square"></i>
                </span>
        
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Notes" ID="linkNotes"  runat="server" Text="Notes" OnClick="btnNotes_Click" class="sp-button">
            <div class="sp-rect">
                <span class="sp-text">Notes</span>
                <span class="sp-icon">
                    <i class="far fa-sticky-note"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="PDF List"  runat="server" Text="PDF List" OnClick="btnPDFList_Click" class="sp-button">
            <div class="sp-rect">
                <span class="sp-text">PDF List</span>
                <span class="sp-icon">
                    <i class="far fa-file-pdf"></i>
                </span>
            </div>
        </asp:LinkButton>

        <asp:LinkButton CommandName="Clone Project" runat="server" ID="linkCloneProject" Text="Clone Project" OnClick="btnCloneProject_Click" class="sp-button">
            <div class="sp-rect">
               <span class="sp-text">Clone Project</span> 
               <span class="sp-icon">
                   <i class="far fa-clone"></i>
                </span>
            </div>
        </asp:LinkButton>


        <br />
        <a href="ProjectsDashboard.aspx"><i class="fas fa-chevron-left mt-solid"></i> Back to project dashboard</a>
    

    </div>

</asp:Content>
