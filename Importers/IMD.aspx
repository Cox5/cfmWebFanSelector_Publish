<%@ Page Title="Multiwing Data Importer" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="IMD.aspx.cs" Inherits="CFM_Web.Importers.IMD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	<script type="text/javascript" src="/Scripts/editableSelect.js">

	</script>
    	<style type="text/css">
	body{
		font-family: Trebuchet MS, Lucida Sans Unicode, Arial, sans-serif;
		font-size:0.9em;
		line-height:130%;
		margin:2px;
	}
	
	
	.selectBoxArrow{
		margin-top:1px;
		float:left;
		position:absolute;
		right:1px;
		

	}	
	.selectBoxInput{
		border:0px;
		padding-left:1px;
		height:16px;
		position:absolute;
		top:0px;
		left:0px;
	}

	.selectBox{
		border:1px solid #7f9db9;
		height:20px;	
	
	}
	.selectBoxOptionContainer{
		position:absolute;
		border:1px solid #7f9db9;
		height:100px;
		background-color:#FFF;
		left:-1px;
		top:20px;
		visibility:hidden;
		overflow:auto;
		z-index:1000;
	}
	.selectBoxIframe{
		position:absolute;
		background-color:#FFF;
		border:0px;
		z-index:999;
	}
	.selectBoxAnOption{
		font-family:arial;
		font-size:12px;
		cursor:default;
		margin:1px;
		overflow:hidden;
		white-space:nowrap;
	}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-wrapper">


        <asp:Button ID="btnParse2" class="button-main primary-btn"  runat="server" Visible="true" Text="Parse" OnClick="btnParse_Click2" />
       <asp:Button ID="btnMakeXLSX" class="button-main primary-btn"  runat="server" Visible="true" Text="MUA" OnClick="btnMake_Click" />
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <div runat="server" id="ProcessPointsContainer">
        </div>

    </div>
</asp:Content>

        