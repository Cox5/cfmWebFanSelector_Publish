<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PriceErrorLog.aspx.cs" Inherits="CFM_Web.Importers.PriceErrorLog"  MasterPageFile="~/fanselection.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">

      <div class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnFinished_Click" runat="server" />
      </div>
        <h3>Price calculation problems</h3>
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>
      </div>
</asp:Content>
    
