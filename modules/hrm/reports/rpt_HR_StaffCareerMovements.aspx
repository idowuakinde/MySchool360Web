<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_HR_StaffCareerMovements.aspx.vb" Inherits="modules_reports_rpt_HR_StaffCareerMovements" %>

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
        <table border="0" width="880" class="borderedTableGrey">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80%">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text='REPORTS > HR REPORTS > STAFF CAREER MOVEMENTS: '></asp:Label>
                  <asp:DropDownList ID="ddlChooser" runat="server" AutoPostBack="True" 
                          CssClass="defaultFormElementStyle" AppendDataBoundItems="True" 
                          DataSourceID="dsSqlGetStaff" DataTextField="StaffName" DataValueField="StaffId">
                      <asp:ListItem Value="0">ALL</asp:ListItem>
                  </asp:DropDownList>
                      <asp:SqlDataSource ID="dsSqlGetStaff" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                          SelectCommand="SELECT DISTINCT a.StaffId, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName FROM dbo.HR_Staff_Movement a INNER JOIN dbo.HR_Staff_Base b ON a.StaffId = b.StaffId ORDER BY StaffName ">
                      </asp:SqlDataSource>
                    <br />
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b><br />&nbsp;
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" 
                        DataSourceID="dsSqlGetData" Width="100%" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        ShowFooter="True" DataKeyNames="StaffMovementId" >
                        <Columns>
                            <asp:TemplateField HeaderText="S/N">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffMovementId" HeaderText="Id"
                                SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Effective Date" SortExpression="EffectiveDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "EffectiveDate"), DateTime)) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffId" HeaderText="StaffId" 
                                SortExpression="StaffId" Visible="False" >
                            </asp:BoundField>
                            <asp:BoundField DataField="StaffName" HeaderText="Staff Name" 
                                SortExpression="StaffName" ReadOnly="True" />
                            <asp:BoundField DataField="FormerDesignationId" HeaderText="FormerDesignationId" 
                                SortExpression="FormerDesignationId" Visible="False" />
                            <asp:BoundField DataField="FormerDesignation" HeaderText="Former Designation" 
                                SortExpression="FormerDesignation" />
                            <asp:BoundField DataField="NewDesignationId" HeaderText="NewDesignationId" 
                                SortExpression="NewDesignationId" Visible="False" />
                            <asp:BoundField DataField="NewDesignation" HeaderText="New Designation" 
                                SortExpression="NewDesignation" />
                            <asp:TemplateField HeaderText="Movement Type" SortExpression="MovementType">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Common.GetFullCareerMovementType(Databinder.Eval(Container.DataItem, "MovementType").ToString) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MovementType") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
                       </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            Font-Size="X-Small" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
