<%@ Page Language="VB" AutoEventWireup="false" CodeFile="vle_teacher_main.aspx.vb" Inherits="modules_vle_vle_teacher_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../inc_functions_js.js"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: Teaching Aids"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="1000" border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.edx.org" target="operationFrame">
                    <asp:Image ID="Image1" 
                        runat="server" ImageUrl="~/images/edx-logo-footer.png" /></a>
                  </td>
    <td bgcolor='<%= schoolColour %>' colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://ocw.mit.edu/" target="operationFrame">
                    <asp:Image ID="Image2" 
                        runat="server" ImageUrl="~/images/ocw_mast.png" Height="50px" /></a>
                  </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.coursera.org" target="operationFrame">
                    <asp:Image ID="Image4" 
                        runat="server" 
                        ImageUrl="~/images/coursera_logo_small.png" Width="200px" /></a>
                  </td>
    </tr>
  <tr>
    <td width="100" align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    <td bgcolor='<%= schoolColour %>' colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.khanacademy.org" target="operationFrame">
                    <asp:Image ID="Image3" 
                        runat="server" 
                        ImageUrl="~/images/ka-simplified-logo-white.png" Width="200px" /></a>
                  </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.bookboon.com" target="operationFrame">
        <asp:Image ID="Image5" 
                        runat="server" ImageUrl="~/images/bookboon.png" Width="200px" /></a>
                  </td>
    <td width="100" align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    </tr>
  <tr>
    <td bgcolor='<%= schoolColour %>' colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://books.eb.com" target="operationFrame">
                    <asp:Image ID="Image6" 
                        runat="server" ImageUrl="~/images/britannica_logo.png" Width="200px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.scholastic.com/teachers/teaching-resources" 
                        target="operationFrame">
                    <asp:Image ID="Image7" 
                        runat="server" ImageUrl="~/images/scholastic_logo.gif" 
                        Width="200px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="https://www.teachers.cambridgeesol.org/ts/" target="operationFrame">
                    <asp:Image ID="Image23" 
                        runat="server" ImageUrl="~/images/119897_cambridge_english_title.gif" 
                        Width="200px" /></a>
                    </td>
    </tr>
  <tr>
    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.curriki.org/" target="operationFrame">
                    <asp:Image ID="Image24" 
                        runat="server" ImageUrl="~/images/curriki-logo-alt.png" 
                        Height="50px" /></a>
                    </td>
    <td bgcolor='<%= schoolColour %>' colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.discoveryeducation.com/teachers/" target="operationFrame">
                    <asp:Image ID="Image25" 
                        runat="server" 
                        ImageUrl="~/images/discoveryeducation-logo.png" 
            Width="200px" /></a>
                    </td>
    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.learnzillion.com" target="operationFrame">
                    <asp:Image ID="Image26" 
                        runat="server" ImageUrl="~/images/learnzillion.jpg" Width="200px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.ted.com" target="operationFrame">
                    <asp:Image ID="Image11" 
                        runat="server" ImageUrl="~/images/ted_logo.gif" 
            Height="50px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.tes.co.uk/teaching-resources/" target="operationFrame">
                    <asp:Image ID="Image27" 
                        runat="server" ImageUrl="~/images/tes_connect_logo.png" 
                        Width="200px" /></a>
                    </td>
    </tr>
  <tr>
    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    <td bgcolor='<%= schoolColour %>' colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.plos.org" 
                        target="operationFrame">
                    <asp:Image ID="Image16" 
                        runat="server" ImageUrl="~/images/plos-dot-org-logo.png" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.audible.com" target="operationFrame">
                    <asp:Image ID="Image22" 
                        runat="server" 
                        ImageUrl="~/images/aud_logo._V383473417_.png" 
            Width="200px" /></a>
                    </td>
    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.bl.uk/" target="operationFrame">
                    <asp:Image ID="Image21" 
                        runat="server" ImageUrl="~/images/britishlibrary.gif" 
                        Height="50px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" 
          class="borderedTableGrey">
                    <a href="http://lib.harvard.edu/" target="operationFrame">
                    <asp:Image ID="Image20" 
                        runat="server" ImageUrl="~/images/harvardlibrary.png" 
            Width="200px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://www.nypl.org/" target="operationFrame">
                    <asp:Image ID="Image28" 
                        runat="server" ImageUrl="~/images/newyorkpubliclibrary.png" 
            Width="150px" /></a>
                    </td>
    </tr>
  <tr>
    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://ilab.harvard.edu/" target="operationFrame">
                    <asp:Image ID="Image29" 
                        runat="server" ImageUrl="~/images/harvardinnovationlab.png" 
            Width="200px" /></a>
                    </td>
    <td colspan="2" align="center" valign="middle" class="borderedTableGrey">
                    <a href="http://wolfram.com/" target="operationFrame">
                    <asp:Image ID="Image30" 
                        runat="server" ImageUrl="~/images/wolframlogo10-blue.gif" 
            Width="200px" /></a>
                    </td>
    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
    </tr>
            </table>

            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
