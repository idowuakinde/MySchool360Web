<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dashboards_acad_all.aspx.vb" Inherits="modules_dashboards_dashboards_acad_all" %>

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
                    Text=":: Academic Dashboards"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/modules/dashboards/dashboard_acad.aspx" 
                        Target="singleDashboardFrame">Dashboard - Mid-Term</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/modules/dashboards/dashboard_acad2.aspx" 
                        Target="singleDashboardFrame">Dashboard - End of Term 1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><hr width="100%" color="#000000" shading="noshade" /></td>
              </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/modules/dashboards/dashboard_acad3.aspx" 
                        Target="singleDashboardFrame">Dashboard - Mid-Term</asp:HyperLink></td>
                </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='~/modules/dashboards/dashboard_acad4.aspx' 
                        Target="singleDashboardFrame">Dashboard - End of Term 2</asp:HyperLink></td>
                </tr>
              <tr>
                <td><hr width="100%" color="#000000" shading="noshade" /></td>
              </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="about:blank" 
                        Target="singleDashboardFrame">Dashboard - Mid-Term</asp:HyperLink></td>
                </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl='about:blank' 
                        Target="singleDashboardFrame">Dashboard - End of Term 3</asp:HyperLink></td>
                </tr>
                </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
