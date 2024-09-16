<%@ Page Language="C#"  MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="FindMissing.aspx.cs" Inherits="CFM_Web.Importers.FindMissing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

        <div class="content-wrapper">
            <asp:Button ID="btnInit" runat="server" Text="Initialise search system" OnClick="btnInit_Click" class="button-main primary-btn inline smbtn" />
             <br />&nbsp;
             <br />
            <asp:Button ID="btnFindBuiltUp" class="button-main primary-btn inline smbtn" runat="server" Text="Find Built-up fans without photo, dimensions image, pdf, Revit, Autocad or weight" OnClick="btnFindBuiltUp_Click" />
            <br />
            Built-up fan search takes about 15 minutes.
            <br />&nbsp;
            <br />
            <asp:Button ID="btnFindStandard" class="button-main primary-btn inline smbtn" runat="server" Text="Find standard fans without photo, dimensions image, pdf, Revit, Autocad or weight" OnClick="btnFindStandard_Click" />
            <br />&nbsp;
            <br />
            Standard fan search takes about 5 seconds.
            <br />&nbsp;
            <br />&nbsp;
            <asp:Button ID="btnDownload" class="button-main primary-btn inline smbtn" runat="server" Text="Download CSV of fans with missing data" OnClick="btnDownload_Click" Enabled="false" />
            <br />
            <br />&nbsp;
            <asp:Label ID="lblMissingDataCount"  runat="server" Text="0 fans found with missing data." />
            <p>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </p>
        </div>

</asp:Content>

