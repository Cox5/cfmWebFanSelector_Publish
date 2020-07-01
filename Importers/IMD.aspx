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
       
        <br />
        <asp:Label ID="lblDBMessage" runat="server" ></asp:Label>
        <div runat="server" id="ProcessPointsContainer">
        </div>
<form>
<p>This widget uses javascript to transform this:</p>
<table border="0">
	<tr>
		<td>Where do you come from?</td>
		<td><input type="text" name="myText_ex" value="Norway" selectBoxOptions="Canada;Denmark;Finland;Germany;Mexico;Norway;Sweden;United Kingdom;United States"></td>
	</tr>
	<tr>
		<td>What is your name?</td>
		<td><input type="text" name="myText_ex2" value="" selectBoxOptions="Amy;Andrew;Carol;Jennifer;Jim;Tim;Tommy;Vince"></td>
	</tr>
</table>
<p>Into this:</p>
<table border="0">
	<tr>
		<td>Where do you come from?</td>
		<td><input type="text" name="myText" value="Norway" selectBoxOptions="Canada;Denmark;Finland;Germany;Mexico;Norway;Sweden;United Kingdom;United States"></td>
	</tr>
	<tr>
		<td>What is your name?</td>
		<td><asp:TextBox ID="txtCountry" value="Norway" class="selectBoxInput" selectBoxOptions="xx"  runat="server"></asp:TextBox></td>
	</tr>
</table>
    <asp:TextBox ID="test" runat="server"></asp:TextBox>
<p>I.e.: A combination of text- and selectbox. You can type in a value or choose from the list</p>
<p>The only thing you have to do to make this work is to add an attribute "selectBoxOptions" to one of your text inputs:<br><br>
&lt;input type="text" name="myText" value="Norway" selectBoxOptions="Canada;Denmark;Finland;Germany;Mexico;Norway;Sweden;United Kingdom;United States">
<br><br>
And then simply call a javascript function that creates the editable select box:<br><br>
&lt;script type="text/javascript"><br>
createEditableSelect(document.forms[0].myText);<br>
&lt;/script>
</form>

<script type="text/javascript">
createEditableSelect(document.forms[0].myText);
createEditableSelect(document.forms[0].body_txtCountry);
</script>
       
        <br />
    </div>
</asp:Content>

        