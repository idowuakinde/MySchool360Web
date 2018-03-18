<%@ Page Language="VB" AutoEventWireup="false" CodeFile="transact.aspx.vb" Inherits="modules_inventory_transact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js_CalendarPopup_Combined.js" type="text/javascript"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Loan Out / Return an Inventory Item"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ItemTransactionId"
                        DataSourceID="dsSqlTransaction" DefaultMode="Insert" 
                        Height="50px" Width="900px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="300px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="Id:" InsertVisible="False" 
                                SortExpression="ItemTransactionId">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemTransactionId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Customer:" SortExpression="CustomerId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("CustomerId") %>' DataSourceID="dsSqlCustomers" 
                                        DataTextField="CustomerName" DataValueField="CustomerCode">
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item:" SortExpression="ItemId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlItems" 
                                        DataTextField="ItemFullName" DataValueField="ItemId" 
                                        SelectedValue='<%# Bind("ItemId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction Type:" 
                                SortExpression="ItemTransactionTypeId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTransactionType" 
                                        DataTextField="ItemTransactionTypeName" DataValueField="ItemTransactionTypeId" 
                                        SelectedValue='<%# Bind("ItemTransactionTypeId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction Date:" 
                                SortExpression="ItemTransactionDate">
                                <InsertItemTemplate>
                                    
                                    <script language="JavaScript" id="jsClientSideCalendar">
                                        var clientSideCalendarAdd = new CalendarPopup("divCalendarAdd");
                                        clientSideCalendarAdd.showNavigationDropdowns();
                                    </script>
                                    <DIV ID="divCalendarAdd" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
                                    <asp:TextBox ID="txtCalendarAdd" runat="server" Columns="25" 
                                        CssClass="defaultFormElementStyle" 
                                        Text='<%# Bind("ItemTransactionDate") %>'></asp:TextBox>
                                    <a href="#" onclick="clientSideCalendarAdd.select(document.forms[0].DetailsView1_txtCalendarAdd,'anchorCalendarAdd','MM/dd/yyyy'); return false;" title="clientSideCalendarAdd.select(document.forms[0].DetailsView1_txtCalendarAdd,'anchorCalendarAdd','MM/dd/yyyy'); return false;" name="anchorCalendarAdd" id="anchorCalendarAdd">select</a>

                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expected Return Date:" 
                                SortExpression="ExpectedReturnDate">
                                <InsertItemTemplate>

                                    <script language="JavaScript" id="jsClientSideCalendar">
                                        var clientSideCalendarAdd = new CalendarPopup("divCalendarAdd_2");
                                        clientSideCalendarAdd.showNavigationDropdowns();
                                    </script>
                                    <DIV ID="divCalendarAdd_2" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
                                    <asp:TextBox ID="txtCalendarAdd_2" runat="server" Columns="25" 
                                        CssClass="defaultFormElementStyle" 
                                        Text='<%# Bind("ExpectedReturnDate") %>'></asp:TextBox>
                                    <a href="#" onclick="clientSideCalendarAdd.select(document.forms[0].DetailsView1_txtCalendarAdd_2,'anchorCalendarAdd_2','MM/dd/yyyy'); return false;" title="clientSideCalendarAdd.select(document.forms[0].DetailsView1_txtCalendarAdd_2,'anchorCalendarAdd_2','MM/dd/yyyy'); return false;" name="anchorCalendarAdd_2" id="anchorCalendarAdd_2">select</a>

                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Register New Transaction" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Review Previous Inventory Transactions"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ItemTransactionId" 
                        DataSourceID="dsSqlTransaction" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="100%" EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField EditText="Return" ShowEditButton="True" />
                            <asp:BoundField DataField="ItemTransactionId" HeaderText="Id" ReadOnly="True" InsertVisible="False" 
                                SortExpression="ItemTransactionId"></asp:BoundField>
                            <asp:TemplateField HeaderText="Type" SortExpression="ItemTransactionTypeName">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Eval("ItemTransactionTypeName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item" 
                                SortExpression="ItemTransactionDescription">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" 
                                        Text='<%# Eval("ItemTransactionShortDesc") %>' ToolTip='<%# Eval("ItemTransactionDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Customer" SortExpression="CustomerFullName">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CustomerFullName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trans Date" 
                                SortExpression="ItemTransactionDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem, "ItemTransactionDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Exp Return Date" 
                                SortExpression="ExpectedReturnDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem, "ExpectedReturnDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Returned" 
                                SortExpression="ActualReturnedDate">
                                <EditItemTemplate>
                                    <asp:Calendar ID="Calendar1" runat="server" 
                                        SelectedDate='<%# Bind("ActualReturnedDate") %>'></asp:Calendar>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem, "ActualReturnedDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td width="3%">&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="dsSqlTransaction" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        InsertCommand="STP_INVENTORY_INSERT_INV_ItemTransaction" InsertCommandType="StoredProcedure"
                        SelectCommand="SELECT * FROM dbo.VW_INV_ItemTransactionHistory" 
                        UpdateCommand="STP_INVENTORY_UPDATE_INV_ItemTransaction_ByDateReturned" 
                        UpdateCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ItemTransactionId" Type="Int32" />
                            <asp:Parameter Name="ItemTransactionTypeId" Type="Int32" />
                            <asp:Parameter Name="ItemId" Type="Int32" />
                            <asp:Parameter Name="CustomerId" Type="String" />
                            <asp:Parameter Name="ItemTransactionDate" Type="DateTime" />
                            <asp:Parameter Name="ExpectedReturnDate" Type="DateTime" />
                            <asp:Parameter Name="ActualReturnedDate" Type="DateTime" />
                            <asp:Parameter Name="ItemTransactionStatus" Type="String" />
                            <asp:Parameter Name="Quantity" Type="Int32" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ItemTransactionId" Type="Int32" />
                            <asp:Parameter Name="ActualReturnedDate" Type="DateTime" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlTransactionType" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ItemTransactionTypeId], [ItemTransactionTypeName] FROM dbo.[INV_ItemTransactionType] ORDER BY [ItemTransactionTypeName]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlItems" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT ItemId, ItemFullName + ' (Serial: ' + IsNull(ItemSerial, '') + ', Condition: ' + IsNull(ItemStatus, '') + ')' AS ItemFullName FROM dbo.[VW_INV_ItemLog]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlCustomers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [CustomerId] as CustomerCode, '[' + CustomerRole + '] ' + [CustomerFullName] as CustomerName FROM dbo.[VW_INV_Customers]"></asp:SqlDataSource>
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
