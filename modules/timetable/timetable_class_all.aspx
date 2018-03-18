<%@ Page Language="VB" AutoEventWireup="false" CodeFile="timetable_class_all.aspx.vb" Inherits="modules_timetable_timetable_class_all" %>

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
    <style type="text/css">
        .style17
        {
            width: 100%;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="1100"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="700"><asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: CLASS TIMETABLE"></asp:Label></td>
                            <td align="right"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>&nbsp;
                </td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr align="center" valign="middle">
                    <td width="100" height="30">&nbsp;</td>
                    <td width="30" height="30">&nbsp;</td>
                    <% For i As Int32 = 0 To rcClasses.Count - 1 %>
                    	<td bgcolor="#999999" class="borderedTable"><%= rcClasses(i).Item(0).ToString & "<br />(" & rcClasses(i).Item(1).ToString & ")" %></td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable">MONDAY</td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 1 To periodsPerDay%>
                            <% If j-1 = periodsBeforeShortBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                            <% If j-1 = periodsBeforeLongBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30">P<%= j %></td>
                                </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 0 To rcClasses.Count - 1 %>
                    	<td width="120"class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% For j As Int32 = 1 To periodsPerDay%>
                                <% If j-1 = periodsBeforeShortBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                <% If j-1 = periodsBeforeLongBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                    <tr align="center" valign="middle">
                                        <td class="borderedTableGrey" height="30"><%= GetTimeTablePeriod(1, j, rcClasses(i).Item(0).ToString) %></td>
                                    </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable">TUESDAY</td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 1 To periodsPerDay%>
                            <% If j-1 = periodsBeforeShortBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                            <% If j-1 = periodsBeforeLongBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30">P<%= j %></td>
                                </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 0 To rcClasses.Count - 1 %>
                    	<td width="120"class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% For j As Int32 = 1 To periodsPerDay%>
                                <% If j-1 = periodsBeforeShortBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                <% If j-1 = periodsBeforeLongBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                    <tr align="center" valign="middle">
                                        <td class="borderedTableGrey" height="30"><%= GetTimeTablePeriod(2, j, rcClasses(i).Item(0).ToString) %></td>
                                    </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable">WEDNESDAY</td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 1 To periodsPerDay%>
                            <% If j-1 = periodsBeforeShortBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                            <% If j-1 = periodsBeforeLongBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30">P<%= j %></td>
                                </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 0 To rcClasses.Count - 1 %>
                    	<td width="120"class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% For j As Int32 = 1 To periodsPerDay%>
                                <% If j-1 = periodsBeforeShortBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                <% If j-1 = periodsBeforeLongBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                    <tr align="center" valign="middle">
                                        <td class="borderedTableGrey" height="30"><%= GetTimeTablePeriod(3, j, rcClasses(i).Item(0).ToString) %></td>
                                    </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable">THURSDAY</td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 1 To periodsPerDay%>
                            <% If j-1 = periodsBeforeShortBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                            <% If j-1 = periodsBeforeLongBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30">P<%= j %></td>
                                </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 0 To rcClasses.Count - 1 %>
                    	<td width="120"class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% For j As Int32 = 1 To periodsPerDay%>
                                <% If j-1 = periodsBeforeShortBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                <% If j-1 = periodsBeforeLongBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                    <tr align="center" valign="middle">
                                        <td class="borderedTableGrey" height="30"><%= GetTimeTablePeriod(4, j, rcClasses(i).Item(0).ToString) %></td>
                                    </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable">FRIDAY</td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 1 To periodsPerDay%>
                            <% If j-1 = periodsBeforeShortBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                            <% If j-1 = periodsBeforeLongBreak Then%>
                                <tr align="center" valign="middle" bgcolor="#FFFF99">
                                    <td>&nbsp;</td>
                                </tr>
                            <% end if %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30">P<%= j %></td>
                                </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 0 To rcClasses.Count - 1 %>
                    	<td width="120"class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% For j As Int32 = 1 To periodsPerDay%>
                                <% If j-1 = periodsBeforeShortBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                <% If j-1 = periodsBeforeLongBreak Then%>
                                    <tr align="center" valign="middle" bgcolor="#FFFF99">
                                        <td>&nbsp;</td>
                                    </tr>
                                <% end if %>
                                    <tr align="center" valign="middle">
                                        <td class="borderedTableGrey" height="30"><%= GetTimeTablePeriod(5, j, rcClasses(i).Item(0).ToString) %></td>
                                    </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
            </table>
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
