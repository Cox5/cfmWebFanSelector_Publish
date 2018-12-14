<%@ Page Title="Schedule" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="CFM_Web.Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />
  <link href="Content/themes/base/jquery.ui.dialog.css" rel="stylesheet" />
  <script src="Scripts/jquery-1.8.2.js"></script>
  <script src="Scripts/jquery-ui-1.8.24.js"></script>
  <script>
    var loadDialog;

    function showDialog(event) {
      if (event != undefined) {
        event.preventDefault();
      }

      loadDialog.dialog("open");
      //return false;
    }

    function okClicked() {
      //loadDialog.dialog("close");
    }

    function cancelClicked() {
      //loadDialog.dialog("close");
    }

    $(document).ready(function () {
      loadDialog = $('#loadDialog');

      $('#btnLoad').click(showDialog);

      loadDialog.dialog({
        autoOpen: false,
        modal: true,
        buttons: { Ok: okClicked, Cancel: cancelClicked }
      });
    });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <div id="loadDialog">
    Select a schedule:
    <table id="tblLoad" runat="server">
      <tr>
        <th>Name</th>
        <th>Customer</th>
        <th>Created</th>
      </tr>
    </table>
  </div>
  <h1>Schedule</h1>
  <div>
    <asp:Button ID="btnLoad" Text="Load" runat="server" OnClick="btnLoad_Click" />
    <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
    <asp:Button ID="btnPrint" Text="Print" runat="server" OnClick="btnPrint_Click" />
  </div>
  <table>
    <tr>
      <td>Name:</td>
      <td>
        <asp:TextBox ID="txtName" runat="server" /></td>
    </tr>
    <tr>
      <td>Customer:</td>
      <td>
        <asp:TextBox ID="txtCustomer" runat="server" /></td>
    </tr>
    <tr>
      <td>Created:</td>
      <td>
        <asp:Literal ID="litCreated" runat="server" /></td>
    </tr>
  </table>
  <table id="tblSchedule" runat="server">
    <tr>
      <th style="width:100px">&nbsp;</th>
      <th style="width:100px">Location</th>
      <th style="width:100px">Designation</th>
      <th style="width:100px">Fan</th>
      <th style="width:100px">Pitch</th>
      <th style="width:100px">Actions</th>
    </tr>
  </table>
  <asp:Button ID="btnRemove" Text="Remove Selected" runat="server" OnClick="btnRemove_Click" />
</asp:Content>
