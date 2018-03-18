<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dashboards_percentile_all.aspx.vb" Inherits="modules_dashboards_dashboards_percentile_all" %>

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
                    Text=":: Class Percentiles"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/modules/dashboards/dashboard_academic_percentile.aspx" 
                        Target="singlePercentileFrame">Class Percentiles - Mid-Term</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='~/modules/dashboards/dashboard_academic_percentile2.aspx' 
                        Target="singlePercentileFrame">Class Percentiles - End of Term 1</asp:HyperLink></td>
              </tr>
              <tr>
                <td><hr width="100%" color="#000000" shading="noshade" /></td>
              </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="~/modules/dashboards/dashboard_academic_percentile3.aspx" 
                        Target="singlePercentileFrame">Class Percentiles - Mid-Term</asp:HyperLink></td>
                </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl='~/modules/dashboards/dashboard_academic_percentile4.aspx' 
                        Target="singlePercentileFrame">Class Percentiles - End of Term 2</asp:HyperLink></td>
                </tr>
              <tr>
                <td><hr width="100%" color="#000000" shading="noshade" /></td>
              </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="about:blank" 
                        Target="singlePercentileFrame">Class Percentiles - Mid Term</asp:HyperLink></td>
                </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink27" runat="server" NavigateUrl='about:blank' 
                        Target="singlePercentileFrame">Class Percentiles - End of Term 3</asp:HyperLink></td>
                </tr>
                </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
