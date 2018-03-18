<%@ Page Language="VB" AutoEventWireup="false" CodeFile="my_payables.aspx.vb" Inherits="modules_payments_my_payables" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Define a Student's Payables"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="StudentPayableId"
                        DataSourceID="dsSqlPayables" DefaultMode="Insert" 
                        Height="50px" Width="800px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="StudentPayableId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StudentPayableId" />
                            <asp:TemplateField HeaderText="Student:" SortExpression="PortalNumber">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlStudentInsert" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudent" 
                                        DataTextField="StudentDesc" DataValueField="CustomerCode" 
                                        SelectedValue='<%# Bind("PortalNumber") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PortalNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Session &amp; Term:" 
                                SortExpression="SessionName">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlCurrentSession" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSessionInsert" 
                                        DataTextField="SessionName" DataValueField="SessionName" 
                                        SelectedValue='<%# Bind("SessionName") %>'>
                                    </asp:DropDownList>
                                    &nbsp;<asp:DropDownList ID="ddlCurrentTerm" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTermInsert" 
                                        DataTextField="TermName" DataValueField="TermName" 
                                        SelectedValue='<%# Bind("TermName") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlTermInsert" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [TermName] FROM [TEMPTerm] WHERE ([CurrentTerm] = @CurrentTerm)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Y" Name="CurrentTerm" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="dsSqlSessionInsert" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [SessionId], [SessionName] FROM [TEMPSession] WHERE ([CurrentSession] = @CurrentSession)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Y" Name="CurrentSession" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SessionName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payable:" SortExpression="PayableShortName">
                                <InsertItemTemplate>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="5" rowspan="4" align="left" valign="top"><asp:ListBox ID="lstPayableInsert" runat="server" 
                                                                            CssClass="defaultFormElementStyle" datasourceid="dsSqlPayable" 
                                                                            DataTextField="ShortName" DataValueField="ShortName" Rows="10" 
                                                                            selectedvalue='<%# Bind("PayableShortName") %>' SelectionMode="Multiple"> </asp:ListBox></td>
                                        <td align="left" valign="top"><asp:ImageButton ID="imgbtnUpInsert" runat="server" 
                                                                            ImageUrl="~/images/arrow_up_green - Copy.png" 
                                                OnClick="imgbtnUpInsert_Click" /></td>
                                      </tr>
                                      <tr>
                                        <td align="left" valign="top">&nbsp;</td>
                                      </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                <asp:ImageButton ID="imgbtnDownInsert" runat="server" 
                                                    ImageUrl="~/images/arrow_down_red - Copy.png" 
                                                    OnClick="imgbtnDownInsert_Click" />
                                            </td>
                                        </tr>
                                      <tr>
                                        <td align="left" valign="top">&nbsp;</td>
                                      </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PayableShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Payable" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp;&nbsp;</td>
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
                    <br />
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Review Previously-Defined Payables"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="StudentPayableId" 
                        DataSourceID="dsSqlPayables" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1200px" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="StudentPayableId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("StudentPayableId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentPayableId") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student" SortExpression="StudentDesc">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlStudentEdit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudent" 
                                        DataTextField="StudentDesc" DataValueField="CustomerCode" 
                                        SelectedValue='<%# Bind("PortalNumber") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("StudentDesc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Session &amp; Term" SortExpression="SessionName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSessionEdit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSessionEdit" 
                                        DataTextField="SessionName" DataValueField="SessionName" 
                                        SelectedValue='<%# Bind("SessionName") %>'>
                                    </asp:DropDownList>
                                    &nbsp;<asp:DropDownList ID="ddlTermEdit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTermEdit" 
                                        DataTextField="TermName" DataValueField="TermName" 
                                        SelectedValue='<%# Bind("TermName") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlTermEdit" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [TermId], [TermName] FROM [TEMPTerm] ORDER BY [TermName]">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="dsSqlSessionEdit" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [SessionId], [SessionName] FROM [TEMPSession] ORDER BY [SessionName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SessionName") %>'></asp:Label>
                                    &nbsp;Session,&nbsp;<asp:Label ID="Label3b" runat="server" Text='<%# Bind("TermName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payable" SortExpression="PayableShortName">
                                <EditItemTemplate>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="5" rowspan="4" align="left" valign="top">
                                        <asp:ListBox ID="lstPayableEdit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlPayable" 
                                        DataTextField="ShortName" DataValueField="ShortName" Rows="10" 
                                        SelectionMode="Multiple">
                                        </asp:ListBox></td>
                                        <td align="left" valign="top">
                                        <asp:ImageButton ID="imgbtnUpEdit" runat="server" 
                                        ImageUrl="~/images/arrow_up_green - Copy.png" 
                                        OnClick="imgbtnUpEdit_Click" /></td>
                                      </tr>
                                      <tr>
                                        <td align="left" valign="top">&nbsp;</td>
                                      </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                <asp:ImageButton ID="imgbtnDownEdit" runat="server" 
                                                    ImageUrl="~/images/arrow_down_red - Copy.png" 
                                                    OnClick="imgbtnDownEdit_Click" />
                                            </td>
                                        </tr>
                                      <tr>
                                        <td align="left" valign="top">&nbsp;</td>
                                      </tr>
                                    </table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PayableShortName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlPayables" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_PAYMENT_DELETE_PAYMENT_StudentPayable" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_PAYMENT_INSERT_PAYMENT_StudentPayable" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_PAYMENT_SELECTALL_PAYMENT_StudentPayable" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_PAYMENT_UPDATE_PAYMENT_StudentPayable" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentPayableId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StudentPayableId" Type="Int32" />
                            <asp:Parameter Name="PortalNumber" Type="String" />
                            <asp:Parameter Name="PayableShortName" Type="String" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="StudentPayableId" 
                                Type="Int32" />
                            <asp:Parameter Name="PortalNumber" Type="String" />
                            <asp:Parameter Name="PayableShortName" Type="String" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlStudent" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [CustomerCode], UPPER([LastName]) + ' ' + [FirstName] + ' (' + DistrictCode + ')' AS StudentDesc FROM dbo.[TEMPcustomers]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlPayable" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        
    SelectCommand="SELECT [ShortName] FROM [PAYMENT_PaymentTypeName] ORDER BY [ListingOrder]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
