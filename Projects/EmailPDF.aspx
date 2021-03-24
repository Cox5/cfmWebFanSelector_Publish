<%@ Page Title="Email PDF" Language="C#" MasterPageFile="~/fanselection.Master" AutoEventWireup="true" CodeBehind="EmailPDF.aspx.cs" Inherits="CFM_Web.Projects.EmailPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-wrapper">
       

        
        <div class="mb-solid mt-solid">
            <div class="table-controls">
                <h1 class="table-title maintitle">Email PDF as an attachment</h1>
            </div>
       <div id="finishedbuttondiv" class="right-controls mr-small" style="float: right;">
                       <asp:Button ID="btnCancel"  class="button-main primary-btn prevpage" Text="Finished" OnClick="btnCancel_Click" runat="server" />
      </div>            
            <div id="projectName" class="project-name" runat="server"><asp:Label ID="lblProjectName" runat="server" ></asp:Label></div>

            <div class="subtitle darkred regular" >Quotation number: <asp:Label ID="lblQuoteNum" runat="server" class="bold"></asp:Label></div>
            <div id="projPDFfilename"  class="subtitle-sub regular" runat="server">
                    
                Sending attachment: <asp:Label ID="lblProjectPDFFilename"  runat="server" class="bold"></asp:Label>
            <asp:HiddenField ID="lblProjectPDFPath"  runat="server" />
            </div>
        </div>
                            <script>
                        // Shows Searching box after Search button click
                        function showpleasewait() {
                            document.getElementById('pleasewait').style.visibility = 'visible';
                            document.getElementById('pleasewait').style.display = 'block';
                          
                            document.getElementById('finishedbuttondiv').style.visibility = 'hidden';
                            document.getElementById('maincontent').style.visibility = 'hidden';
                            document.getElementById('maincontent').style.display = 'none';
                         
                        }
                     </script>
            <div id="pleasewait" style="width: 100%; height: 100%; font-size: 20px; text-align:center; background-color: white; visibility: hidden; display:none"> 
               <img style="margin: auto auto" src="/Images/loading-ring2.gif" />
            </div>

        <div style="clear:both"></div>
        <div id="maincontent">
        <div class="leftcolumn" id="leftcolumn" runat="server">
            
            <table class="table">

                <tr>
                    <td>Sender</td>
                    <td>
                        <asp:TextBox ID="txtSender" runat="server" readonly="true" AutoCompleteType="Disabled"/>
                    </td>
                </tr>
                <tr>
                    <td>Copy to</td>
                    <td>
                        <asp:TextBox ID="txtCopyTo" runat="server" AutoCompleteType="Disabled"/>
                    </td>
                </tr>
                </table>
            </div>

            <div class="rightcolumn"  id="rightcolumn" runat="server">
                    <table class="table">
                <tr>
                    <td>Recipient email address</td>
                    <td>
                        <asp:TextBox ID="txtRecipient" runat="server" AutoCompleteType="Disabled" />
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="txtRecipient" ErrorMessage="Please enter a valid email address" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>        
                <tr>
                    <td>Cc:</td>
                    <td>
                        <asp:TextBox ID="txtCc1" runat="server"/><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="txtCc1" ErrorMessage="Please enter a valid email address" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Cc:</td>
                    <td>
                        <asp:TextBox ID="txtCc2" runat="server"/><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="txtCc2" ErrorMessage="Please enter a valid email address" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                </table>
        </div>
<asp:TextBox id="txtContent" TextMode="multiline" Columns="80" Rows="10" runat="server" />

        <br />
        <div class="right-controls mt-medium mr-small">

                <asp:Button ID="btnSubmit" class="button-main primary-btn" Text="Send Email" runat="server" OnClick="btnSubmit_Click" onClientClick="showpleasewait();" />
            </div>
        </div>
        <p><asp:Label ID="lblProgressMessage" runat="server" class="lblmessage"></asp:Label></p>
        <p class="validation-msg">
                    </p>    

    
        </div>

</asp:Content>
