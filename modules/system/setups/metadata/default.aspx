<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="modules_system_setups_metadata_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td colspan="2">
                <br />
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Manage Metadata"></asp:Label></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td><table width="100%"  border="0" cellpadding="2" cellspacing="2" class="borderedTable">
              <tr>
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="manageroles.aspx">Manage Roles</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="managemodules.aspx">Manage Modules</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="managemenuitems.aspx">Manage Menu Items</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="manageuserroles.aspx">Manage User / Role Assignments</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="managerolemenus.aspx">Manage Role / Menu Assignments</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="managedepartments.aspx">Manage Departments</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="managecountries.aspx">Manage Countries</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="managestates.aspx">Manage States</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="managelgas.aspx">Manage Lgas</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="managenoticeboard.aspx">Manage Notice Board Items</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="manageevents.aspx">Manage The Events Calendar</asp:HyperLink></td>
              </tr>
              <tr>
                <td><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="managemall.aspx">Manage The Shopping Mall</asp:HyperLink></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
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
