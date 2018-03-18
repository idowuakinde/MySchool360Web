<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="modules_academics_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td colspan="2">
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: REPORTS"></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2"><b>TERM 1 (CHRISTMAS TERM): </b></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td><table width="100%"  border="0" cellpadding="2" cellspacing="2" class="borderedTable">
              <tr>
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#?a=1&b=YEAR 11.1&c=1">Download CHRISTMAS TERM CA 1 BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="#?a=2&b=YEAR 11.1&c=1">Download CHRISTMAS TERM CA 2 BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="#?a=3&b=YEAR 11.1&c=1">Download CHRISTMAS TERM EXAM BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#">Download Termly Competence Assessments for YEAR 11.1</asp:HyperLink></td>
              </tr>
              </table></td>
          </tr>
          <tr>
            <td colspan="2"><b>TERM 2 (EASTER TERM): </b></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%"  border="0" cellpadding="2" cellspacing="2" class="borderedTable">
              <tr>
                <td><asp:HyperLink ID="HyperLink6" runat="server" 
                        NavigateUrl="#?a=1&b=YEAR 11.1&c=2">Download EASTER TERM CA 1 BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink7" runat="server" 
                        NavigateUrl="#?a=2&b=YEAR 11.1&c=2">Download EASTER TERM CA 2 BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink8" runat="server" 
                        NavigateUrl="#?a=3&b=YEAR 11.1&c=2">Download EASTER TERM EXAM BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="#">Download Termly Competence Assessments for YEAR 11.1</asp:HyperLink></td>
              </tr>
              </table></td>
          </tr>
          <tr>
            <td colspan="2"><b>TERM 3 (SUMMER TERM): </b></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%"  border="0" cellpadding="2" cellspacing="2" class="borderedTable">
              <tr>
                <td><asp:HyperLink ID="HyperLink11" runat="server" 
                        NavigateUrl="#?a=1&b=YEAR 11.1&c=3">Download SUMMER TERM CA 1 BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink12" runat="server" 
                        NavigateUrl="#?a=2&b=YEAR 11.1&c=3">Download SUMMER TERM CA 2 BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink13" runat="server" 
                        NavigateUrl="#?a=3&b=YEAR 11.1&c=3">Download SUMMER TERM EXAM BroadSheet for YEAR 11.1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="#">Download Termly Competence Assessments for YEAR 11.1</asp:HyperLink></td>
              </tr>
              </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
