<%@ Page Title="Email PDF" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EmailPDF.aspx.cs" Inherits="CFM_Web.Projects.EmailPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
       

        
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Email PDF as an attachment</h1>
            </div>
            
            <div id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></div>
            <div class="subtitle darkred regular" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
            <div id="projPDFfilename"  class="subtitle-sub regular" runat="server">
                    
                Sending attachment: <asp:Label ID="lblProjectPDFFilename"  runat="server" class="bold"></asp:Label>
            
            </div>
        </div>
        <div class="leftcolumn">
            
            <table class="table">

                <tr>
                    <td>Sender</td>
                    <td>
                        <asp:TextBox ID="txtSender" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>Copy to</td>
                    <td>
                        <asp:TextBox ID="txtCopyTo" runat="server"/>
                    </td>
                </tr>
                </table>
            </div>
            <div class="rightcolumn">
                    <table class="table">
                <tr>
                    <td>Recipient</td>
                    <td>
                        <asp:TextBox ID="txtRecipient" runat="server"/>
                    </td>
                </tr>        
                <tr>
                    <td>Cc:</td>
                    <td>
                        <asp:TextBox ID="txtCc1" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>Cc:</td>
                    <td>
                        <asp:TextBox ID="txtCc2" runat="server"/>
                    </td>
                </tr>
                </table>
        </div>
        Content<br />
<asp:TextBox id="txtContent" TextMode="multiline" Columns="70" Rows="10" runat="server" />

        <br />
                    <div class="right-controls mt-medium mr-small">
                <asp:Button ID="btnSubmit" class="button-main primary-btn" Text="Send Email" runat="server" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel"  class="button-main quarternary-btn" Text="Cancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" />
            </div>
        <p><asp:Label ID="lblProgressMessage" runat="server" class="lblmessage"></asp:Label></p>
        <a href="ProjectsDashboard.aspx"><i class="fas fa-chevron-left mt-solid"></i> Back to project dashboard</a>
    

    
        </div>
</asp:Content>
