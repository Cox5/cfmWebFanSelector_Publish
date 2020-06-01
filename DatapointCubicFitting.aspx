<%@ Page Title="Datapoint Cubic Fitting" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="DatapointCubicFitting.aspx.cs" Inherits="CFM_Web.DatapointCubicFitting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">

        <h1>Cubic curve fitting for AF/SP graphs</h1>

        <div id="printDiv" runat="server">

        </div>

        <div>
            Calculation is limited because it's time consuming. It can be turned off in code at the end of fitBtn_Click function.
            <br />
            Calculated values are automatically being inserted in datapoint_new table in DB and .csv is provided.
            <br />
            <asp:Button ID="fitBtn" class="button-main primary-btn" runat="server" Text="Fit and extend to 20 points"  OnClick="fitBtn_Click" />
        </div>
        
        <div class="mt-big">
            Calculation is not restricted, every datapoint is being compared.
            <br />
            .csv is provided
            <br />
            <asp:Button ID="fitBtnCompare" class="button-main primary-btn" runat="server" Text="Fit and compare"  OnClick="fitBtnCompare_Click" />

        </div>

        

    </div>
</asp:Content>
