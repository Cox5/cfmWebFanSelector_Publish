<%@ Page Title="Datapoint Cubic Fitting" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="DatapointCubicFitting.aspx.cs" Inherits="CFM_Web.DatapointCubicFitting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">

        <h1>Cubic curve fitting for AF/SP graphs</h1>

        <div id="printDiv" runat="server">

        </div>

        <asp:Button ID="fitBtn" class="button-main primary-btn" runat="server" Text="Fit"  OnClick="fitBtn_Click" />

    </div>
</asp:Content>
