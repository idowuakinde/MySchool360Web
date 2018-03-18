<%@ Page Language="VB" AutoEventWireup="false" CodeFile="duty_rosters_menu.aspx.vb" Inherits="modules_academics_duty_rosters_menu" %>

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
                    Text=":: Duty Rosters"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>1.  <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="~/_uploads/Swimming Duty Term 2 2014.pdf" 
                        Target="mainFrame">Swimming Duty Term 2 2014</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>2.  <asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="~/_uploads/Sports Duty Term 2 2014.pdf" 
                        Target="mainFrame">Sports Duty Term 2 2014</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>3.  <asp:HyperLink ID="HyperLink3" runat="server" 
                        NavigateUrl="~/_uploads/scrabble club duty Term 2 2014.pdf" 
                        Target="mainFrame">Scrabble Club Duty Term 2 2014</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>4.  <asp:HyperLink ID="HyperLink4" runat="server" 
                        NavigateUrl="~/_uploads/Duty Roster Term 2 2014.pdf" 
                        Target="mainFrame">Duty Roster Term 2 Primary 2014</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>4.  
                    <asp:HyperLink ID="HyperLink6" runat="server" 
                        NavigateUrl="~/_uploads/Duty Roster Term 2 Sec 2014.pdf" 
                        Target="mainFrame">Duty Roster Term 2 Secondary 2014</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>5.  <asp:HyperLink ID="HyperLink5" runat="server" 
                        NavigateUrl="~/_uploads/Duty Roster for Monitoring of pupils on Mornings during Staff Meetings Term 2 2014.pdf" 
                        Target="mainFrame">Duty Roster for Monitoring of pupils on Mornings during Staff Meetings Term 2 2014</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>6.  <asp:HyperLink ID="HyperLink7" runat="server" 
                        NavigateUrl="~/_uploads/Roster For Playground Access 2.pdf" 
                        Target="mainFrame">Roster for Playground Access</asp:HyperLink></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
