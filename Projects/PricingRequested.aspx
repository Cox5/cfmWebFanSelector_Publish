<%@ Page Language="C#"  MasterPageFile="~/fanselection.Master" Title="Pricing Requested" AutoEventWireup="true" CodeBehind="PricingRequested.aspx.cs" 
    Inherits="CFM_Web.Projects.PricingRequested" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        #ddFanType1:focus {
            height:200px;
        } 
        .oem_row { visibility: hidden; display:none;}
    </style>
    <div class="content-wrapper" style ="max-width: 700px; margin: auto auto">

        <div class="mb-solid mt-solid">
                <div class="table-controls">

                   <div class="right-controls mt-medium mr-small" style="float: right;">
                       <asp:Button ID="btnFinish"  class="button-main primary-btn prevpage" Text="Finish" OnClick="btnFinish_Click" runat="server" />
                    </div>
               <div style="display: inline-block; float: left;">
                       <h3 class="table-title sub">Pricing has been requested.</h3>
                   </div>
                </div> 
                <div style="clear:both"> 
                    <P>&nbsp;</P><P>The CFM sales staff have been alerted to your request for pricing of
                    <span id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></span>
                     and will attend to it as soon as possible.</P>
                    </div>
         </div>
     </div>
</asp:Content>

