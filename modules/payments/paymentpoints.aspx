<%@ Page Language="VB" AutoEventWireup="false" CodeFile="paymentpoints.aspx.vb" Inherits="modules_payments_paymentpoints" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
          <tr>
            <td colspan="2"><asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Available Payment Options" CssClass="pageHeaderStyleAMMA"></asp:Label></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey" DataKeyNames="PaymentOptionId" DataSourceID="dsSqlOptions" Width="400px" EmptyDataText="No records found.">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# serialNumber+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PaymentOptionId" HeaderText="Option Id" InsertVisible="False"
                            ReadOnly="True" SortExpression="PaymentOptionId" Visible="False" />
                        <asp:BoundField DataField="PaymentOptionName" HeaderText="Option Name" SortExpression="PaymentOptionName" />
                        <asp:BoundField DataField="Enabled" HeaderText="Enabled?" SortExpression="Enabled" />
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlOptions" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>" SelectCommand="SELECT [PaymentOptionId], [PaymentOptionName], [Enabled] FROM [TEMPPaymentOption] ORDER BY [Enabled] DESC">
                </asp:SqlDataSource>
            </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
