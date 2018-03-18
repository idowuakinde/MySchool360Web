<%@ Page Language="VB" AutoEventWireup="false" CodeFile="calendar.aspx.vb" Inherits="modules_calendar_calendar" %>

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
        <table width="1000"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="400"><asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                    Font-Size="Small" Text=":: SCHOOL CALENDAR 2014/2015"></asp:Label></td>
                            <td align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="470" align="right" valign="middle"><table width="260" border="0" cellpadding="3" cellspacing="3" class="borderedTableGrey">
                                        <tr>
                                            <td align="left" valign="middle"><strong>KEY:</strong></td>
                                            <td width="20" align="right" valign="middle" bgcolor="#ff0000" class="borderedTable">&nbsp;</td>
                                            <td width="50" align="left" valign="middle">EVENT</td>
                                            <td width="20" align="right" valign="middle" bgcolor="#00ff00" class="borderedTable">&nbsp;</td>
                                            <td width="50" align="left" valign="middle">HOLIDAY</td>
                                            </tr>
                                    </table></td>
                                    <td align="right" valign="middle"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                                </tr>
                            </table></td>
                        </tr>
                    </table>
                </td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>&nbsp;
<table width="970" border="0" class="borderedTableGrey">
    <tr align="center" valign="middle">
        <td width="50" align="right" valign="middle"><span class="verticalText">TERM&nbsp;&nbsp;1</span></td>
        <td width="225">
                <asp:Calendar ID="calSeptember" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2014-09-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td width="225">
                <asp:Calendar ID="calOctober" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2014-10-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td width="225">
                <asp:Calendar ID="calNovember" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2014-11-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calDecember" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2014-12-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
    </tr>
    <tr align="center" valign="middle">
        <td align="right" valign="middle"><span class="verticalText">TERM&nbsp;&nbsp;2</span></td>
        <td>
                <asp:Calendar ID="calJanuary" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-01-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calFebruary" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-02-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calMarch" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-03-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calApril" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-04-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
    </tr>
    <tr align="center" valign="middle">
        <td align="right" valign="middle"><span class="verticalText">TERM&nbsp;&nbsp;3</span></td>
        <td>
                <asp:Calendar ID="calMay" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-05-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calJune" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-06-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calJuly" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" VisibleDate="2015-07-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        <td>
                <asp:Calendar ID="calAugust" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                    Width="100%" ShowNextPrevMonth="False" 
                VisibleDate="2015-08-01">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <DayStyle Font-Bold="False" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" 
                        Font-Size="Small" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
    </tr>
</table>
            </td>
          </tr>
          </table>
      </div>
    </form>
</body>
</html>
