<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_HR_StaffListByCategory.aspx.vb" Inherits="modules_reports_rpt_HR_StaffListByCategory" %>

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
                        Text='REPORTS > HR REPORTS > STAFF LIST BY GRADE LEVEL: '></asp:Label>
                  <asp:DropDownList ID="ddlChooser" runat="server" AutoPostBack="True" 
                          CssClass="defaultFormElementStyle" AppendDataBoundItems="True" 
                          DataSourceID="dsSqlGetFilterData" DataTextField="JobLevelName" 
                          DataValueField="JobLevelName">
                      <asp:ListItem Value="0">ALL</asp:ListItem>
                  </asp:DropDownList>
                      <asp:SqlDataSource ID="dsSqlGetFilterData" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                          SelectCommand="SELECT DISTINCT JobLevelName FROM dbo.HR_Staff_Base a INNER JOIN dbo.HR_JobLevel b ON a.JobLevelId = b.JobLevelId ORDER BY JobLevelName">
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
                        ShowFooter="True" >
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffGUID" HeaderText="StaffGUID"
                                SortExpression="StaffGUID" 
                                Visible="False" />
                            <asp:BoundField DataField="StaffCode" HeaderText="Staff Code" 
                                SortExpression="StaffCode" >
                            </asp:BoundField>
                            <asp:BoundField DataField="StaffName" HeaderText="Staff Name" 
                                SortExpression="StaffName" ReadOnly="True" >
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Common.GetMaleOrFemale(Databinder.Eval(Container.DataItem, "Gender").ToString) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LocationName" HeaderText="Location" 
                                SortExpression="LocationName" />
                            <asp:BoundField DataField="Department" HeaderText="DeptCode" 
                                SortExpression="Department" Visible="False" />
                            <asp:BoundField DataField="JobLevelName" HeaderText="Grade Level" 
                                SortExpression="JobLevelName" />
                            <asp:BoundField DataField="Department" HeaderText="Department" 
                                SortExpression="Department" />
                            <asp:BoundField DataField="DesignationName" HeaderText="Designation" 
                                SortExpression="DesignationName" />
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
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlChooser" Name="JobLevelName" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
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
