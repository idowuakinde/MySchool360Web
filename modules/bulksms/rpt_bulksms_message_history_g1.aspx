<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_bulksms_message_history_g1.aspx.vb" Inherits="modules_bulksms_rpt_bulksms_message_history_g1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="1000" class="borderedTableGrey">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80%">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text="REPORTS &gt; BULK SMS REPORTS &gt; MESSAGE HISTORY (GATEWAY #1)"></asp:Label>
                    <br />
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b>
                    <br />
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /><br /><br />
                      <asp:Button ID="Button1" runat="server" CssClass="defaultButtonStyle" 
                          Text="   Download as MS EXCEL   " Enabled="False" />
                    </td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvReportData" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" Width="100%" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        ShowFooter="True" EnableModelValidation="True">
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID" SortExpression="id">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Message" HeaderText="MESSAGE" 
                                SortExpression="Message" >
                            </asp:BoundField>
                            <asp:BoundField DataField="Sender" HeaderText="SENDER" SortExpression="Sender">
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="PRICE" SortExpression="Price" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "Price"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Count" HeaderText="RECIPIENTS" 
                                SortExpression="Count">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Pages" HeaderText="UNITS" SortExpression="Pages" 
                                FooterText="TOTAL:">
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="TOTAL">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "Count"), Int32) * CType(Databinder.Eval(Container.DataItem, "Pages"), Int32) %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# FormatNumber(grandTotalUnits, 0) %>'></asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="50px" Font-Bold="True" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SENT ON" SortExpression="Creation_Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "Creation_Date"), DateTime)) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td align="center">*Tip: This page is best printed in Portrait Orientation.</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
