<%@ Page Language="VB" AutoEventWireup="false" CodeFile="send_logindetails_to_parents.aspx.vb" Inherits="modules_bulksms_send_logindetails_to_parents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" media="screen, print" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="880"  border="0" id="TABLE1">
            <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="left" valign="middle"><asp:Label ID="Label3" runat="server" 
                                    Font-Bold="True" Font-Size="Small" Text=":: Sending Parents' Login Details by Bulk SMS"></asp:Label></td>
                        </tr>
                </table></td>
            </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td align="left">
                <asp:Label ID="lblBalance" runat="server" 
                                    Font-Bold="True" EnableViewState="False"></asp:Label>
              </td>
          </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td align="left">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
              </td>
          </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td>
        
        
                
              </td>
          </tr>
            <tr>
                <td colspan="2">&nbsp;
                    </td>
            </tr>
            </table>
      </div>
    </form>
</body>
</html>
