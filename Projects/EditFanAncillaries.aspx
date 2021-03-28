<%@ Page Title="Edit Fan Ancillaries" Language="C#" AutoEventWireup="true" MasterPageFile="~/fanselection.Master" 
    CodeBehind="EditFanAncillaries.aspx.cs" Inherits="CFM_Web.Projects.EditFanAncillaries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
        <div id="info_view" runat="server">
            <h3 class="mb-solid">Please add fan references in order to add extra items.</h3>
            <asp:LinkButton runat="server" CommandName="Finish" OnClick="btnFinish_Click" class="button-main primary-btn" >Fan References</asp:LinkButton>
        </div>
        <div id="table_view" runat="server" >
            <div class="mb-solid mt-solid">

            <div class="table-controls">
                <h1 class="table-title maintitle">Extras and Ancillaries</h1>
            </div>
              <div class="project-name" ><asp:Label ID="lblProjectName" runat="server"  Visible="true"></asp:Label></div>
            <div class="subtitle regular" id="quoteNumberLine" runat="server" Visible="true" style="float: left; max-width: 50%">Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
            <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinish_Click" runat="server" />
              </div>           
        </div>
            <div style="clear:both"></div>
            <style>
                input[type="text"], input[type="password"], input[type="number"], select {padding: 5px 2px; margin: 2px 2px;}
                select {width: 400px;}
            </style>
<form>            
            <table style="margin-left: 200px">
                <asp:Label ID="theTable" runat="server"></asp:Label>
            </table>
    <input type="submit" value="Save" style="margin-left: 200px" />
</form>

            <br />

            <asp:Label ID="lblSuccessMsg" runat="server" ForeColor="Green"></asp:Label>
            <br />
            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" CssClass="mb-small"></asp:Label>
            <br />

         </div>

    </div>
</asp:Content>
