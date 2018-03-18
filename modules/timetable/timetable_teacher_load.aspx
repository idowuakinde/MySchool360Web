<%@ Page Language="VB" AutoEventWireup="false" CodeFile="timetable_teacher_load.aspx.vb" Inherits="modules_timetable_timetable_teacher_load" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    // <!CDATA[

    function TABLE1_onclick() {

    }

    // ]]>
</script>
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="880"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="400"><asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: TEACHING LOAD"></asp:Label></td>
                            <td align="right"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>
                <asp:GridView ID="gvTeachers" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="UserId" DataSourceID="dsSqlTeachers" Width="100%" 
                        EmptyDataText="No teachers to display." 
                        EnableModelValidation="True" ShowHeader="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" >
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Periods Taught">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                                Text='<%# CType(Databinder.Eval(Container.DataItem, "FullName"), String).ToUpper %>'></asp:Label>
                            <br />&nbsp;
                            <table width="100%">
                                <tr>
                                    <td width="30">
                                        &nbsp;</td>
                                    <td>
                                        <asp:GridView ID="gvTeacherLoad" runat="server" AutoGenerateColumns="False" 
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                            CellPadding="2" CssClass="noBorderedMenuTable" DataKeyNames="PeriodId" 
                                            DataSourceID="dsSqlGetTeacherLoad" 
                                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No timetable record(s) to display.&lt;br /&gt;&amp;nbsp;" 
                                            EnableModelValidation="True" Font-Bold="False" ForeColor="Black" 
                                            GridLines="None" ShowFooter="True" Width="100%" OnRowDataBound="InnerGrid_RowDataBound">
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="SN">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label12" runat="server" Text="<%# SN + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="PeriodId" HeaderText="PeriodId" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="PeriodId" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="TeacherName" HeaderText="Teacher" 
                                                    SortExpression="TeacherName" />
                                                <asp:TemplateField HeaderText="Day and Period" SortExpression="DayOfWeekName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "DayOfWeekName"), String) & ", Period " & CType(Databinder.Eval(Container.DataItem, "PeriodNumber"), String) %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField FooterText="Total Teaching Load (Periods Taught per Week):" 
                                                    HeaderText="Class" SortExpression="ClassName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Subject" SortExpression="SubjectName">
                                                    <FooterTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# SN.ToString & " / " & (periodsPerDay * 5).ToString & " (" & FormatNumber(SN*100 / (periodsPerDay*5), 0).ToString & "%)" %>'></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="Tan" Font-Bold="True" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                                HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    </asp:TemplateField>
                </Columns>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                        ForeColor="#333333" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle 
                    HorizontalAlign="Left" BackColor="#990000" Font-Bold="True" 
                        ForeColor="White" />
                <EditRowStyle CssClass="defaultFormElementStyle" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetTeacherLoad" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT a.PeriodId, e.FirstName + ' ' + e.Surname as TeacherName, dbo.FUNC_GET_WEEKDAYNAME([DayOfWeek]) as DayOfWeekName, PeriodNumber, b.ClassName, c.SubjectName FROM [dbo].[Core_TimetablePeriod] a INNER JOIN dbo.TEMPClass b ON a.ClassId  = b.ClassId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId INNER JOIN dbo.Core_User e ON a.Remark1 = e.Username WHERE e.Username = @Username ORDER BY TeacherName, [DayOfWeek], PeriodNumber, ClassName, SubjectName ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        
                    SelectCommand="SELECT [UserId], [Username], [Firstname] + ' ' + [Middlename] + ' ' + [Surname] AS FullName FROM [Core_User] WHERE Username = @Username ORDER BY [Middlename], [Surname]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
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
