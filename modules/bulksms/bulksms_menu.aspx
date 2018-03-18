﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="bulksms_menu.aspx.vb" Inherits="modules_bulksms_bulksms_menu" %>

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
                    Text=":: Bulk Notifications"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr bgcolor="#CCCCCC">
                <td>
                <asp:Label ID="lblHeader2" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text="Bulk SMS"></asp:Label></td>
                </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink9" runat="server" 
                        NavigateUrl="~/modules/bulksms/sendsms.aspx" 
                        Target="operationFrame">Send SMS</asp:HyperLink></td>
                </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink10" runat="server" 
                        NavigateUrl="~/modules/bulksms/rpt_bulksms_message_history.aspx" 
                        Target="operationFrame">Message History</asp:HyperLink></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr bgcolor="#CCCCCC">
                <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text="Bulk E-mail"></asp:Label></td>
                </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="~/modules/bulkemail/sendemail.aspx" 
                        Target="operationFrame">Send E-mail</asp:HyperLink></td>
                </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="about:blank" 
                        Target="operationFrame">Message History</asp:HyperLink></td>
                </tr>
              </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
