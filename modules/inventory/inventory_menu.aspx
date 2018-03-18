<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inventory_menu.aspx.vb" Inherits="modules_inventory_inventory_menu" %>

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
                    Text=":: Assets"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageassets.aspx">Register New Asset</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/modules/inventory/transact_v2.aspx" 
                        Target="operationFrame">Loan / Return Assets</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink9" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/inspect_asset.aspx">Inspect Assets</asp:HyperLink></td>
              </tr>
              <tr>
                <td><hr width="100%" color="#000000" shading="noshade" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageassetclasses.aspx">Set Up Asset Classes</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink8" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageassetmanufacturers.aspx">Set Up Asset Manufacturers</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink10" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageassetconditions.aspx">Set Up Asset Conditions</asp:HyperLink></td>
              </tr>
			</table>
            <br /></td>
          </tr>
          <tr>
            <td><asp:Label ID="lblHeader2" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: Inventory"></asp:Label></td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink4" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/recordinitialcount.aspx">Record Initial Count</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink11" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/recordinventorytransfer.aspx">Record Batch Transfer Details</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink12" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/confirminventoryreceipt.aspx">Confirm Receipt of Batch</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink5" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/edit_inventory.aspx">Edit Inventory</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink6" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/sell_inventory.aspx">Sell Inventory</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink7" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/inventory/inspect_asset.aspx">Inspect Inventory</asp:HyperLink></td>
              </tr>
              <tr>
                <td><hr width="100%" color="#000000" shading="noshade" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3b" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageassets.aspx">Set Up Inventory Items</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink8b" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageinventorylocations.aspx">Set Up Inventory Locations</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink10b" runat="server" 
                        Target="operationFrame" 
                        NavigateUrl="~/modules/system/setups/metadata/manageinventorymeasurementunits.aspx">Set Up Units of Measurement</asp:HyperLink></td>
              </tr>
              </table>
              <br /></td>
          </tr>
          <tr>
            <td><asp:Label ID="lblHeader3" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: Reports"></asp:Label></td>
          </tr>
          <tr>
            <td><table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3c" runat="server" 
                        Target="operationFrame">Stock Sold v. Leftover Stock</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink8c" runat="server" 
                        Target="operationFrame">Stock Sold Till Date</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink10c" runat="server" 
                        Target="operationFrame">Unsold Stock</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3d" runat="server" 
                        Target="operationFrame">Stock paid for but not Disbursed</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink8d" runat="server" 
                        Target="operationFrame">Uniform Delivery Analysis</asp:HyperLink></td>
              </tr>
            </table></td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
