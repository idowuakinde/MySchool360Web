<%@ Page Language="VB" AutoEventWireup="false" CodeFile="timetable_venue_free_all.aspx.vb" Inherits="modules_timetable_timetable_venue_free_all" %>

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
        <table width="1100"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="400"><asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: VENUE FREE SLOTS"></asp:Label></td>
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
            <table width="" border="0" cellpadding="0" cellspacing="0">
                <tr align="center" valign="middle">
                    <td width="30" height="30">&nbsp;</td>
                    <td width="100" height="30">&nbsp;</td>
                    <% For i As Int32 = 1 To periodsPerDay%>
                        <% If i-1 = periodsBeforeShortBreak Then%>
                            <td width="70" class="borderedTable" bgcolor="#FFFF99" rowspan="6"><strong>L<br />
                                <br />U<br />
                                <br />N<br />
                                <br />C<br />
                                <br />H<br /><br /><br />B<br />
                                <br />R<br />
                                <br />E<br />
                                <br />A<br />
                                <br />K</strong></td>
                        <% end if %>
                        <% If i-1 = periodsBeforeLongBreak Then%>
                            <td width="70" class="borderedTable" bgcolor="#FFFF99" rowspan="6"><strong>L<br />
                                <br />O<br />
                                <br />N<br />
                                <br />G<br /><br /><br />B<br />
                                <br />R<br />
                                <br />E<br />
                                <br />A<br />
                                <br />K</strong></td>
                        <% end if %>
                        <td width="120" bgcolor="#999999" class="borderedTable"><strong>PERIOD <%= i %></strong><br /><%= Common.GetPeriodTimes(i) %></td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable"><strong>MONDAY</strong></td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 0 To rcVenues.Count - 1 %>
                            <tr align="center" valign="middle">
                                <td class="borderedTableGrey" height="30"><%= rcVenues(j).Item(0).ToString%></td>
                            </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 1 To periodsPerDay%>
                        <td width="100" class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						    <% For j As Int32 = 0 To rcVenues.Count - 1 %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30"><%= GetTimetablePeriod(1, i, rcVenues(j).Item(0).ToString)%></td>
                                </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable"><strong>TUESDAY</strong></td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 0 To rcVenues.Count - 1 %>
                            <tr align="center" valign="middle">
                                <td class="borderedTableGrey" height="30"><%= rcVenues(j).Item(0).ToString%></td>
                            </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 1 To periodsPerDay%>
                        <td width="100" class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						    <% For j As Int32 = 0 To rcVenues.Count - 1 %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30"><%= GetTimetablePeriod(2, i, rcVenues(j).Item(0).ToString)%></td>
                                </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable"><strong>WEDNESDAY</strong></td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 0 To rcVenues.Count - 1 %>
                            <tr align="center" valign="middle">
                                <td class="borderedTableGrey" height="30"><%= rcVenues(j).Item(0).ToString%></td>
                            </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 1 To periodsPerDay%>
                        <td width="100" class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						    <% For j As Int32 = 0 To rcVenues.Count - 1 %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30"><%= GetTimetablePeriod(3, i, rcVenues(j).Item(0).ToString)%></td>
                                </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable"><strong>THURSDAY</strong></td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 0 To rcVenues.Count - 1 %>
                            <tr align="center" valign="middle">
                                <td class="borderedTableGrey" height="30"><%= rcVenues(j).Item(0).ToString%></td>
                            </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 1 To periodsPerDay%>
                        <td width="100" class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						    <% For j As Int32 = 0 To rcVenues.Count - 1 %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30"><%= GetTimetablePeriod(4, i, rcVenues(j).Item(0).ToString)%></td>
                                </tr>
                            <% Next %>
                            </table>
                        </td>
                    <% Next %>
                </tr>
                <tr align="center" valign="middle">
                    <td height="70" bgcolor="#999999" class="borderedTable"><strong>FRIDAY</strong></td>
                    <td height="70" bgcolor="#999999" class="borderedTable">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<% For j As Int32 = 0 To rcVenues.Count - 1 %>
                            <tr align="center" valign="middle">
                                <td class="borderedTableGrey" height="30"><%= rcVenues(j).Item(0).ToString%></td>
                            </tr>
                        <% Next %>
                        </table>
                    </td>
                    <% For i As Int32 = 1 To periodsPerDay%>
                        <td width="100" class="borderedTable">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						    <% For j As Int32 = 0 To rcVenues.Count - 1 %>
                                <tr align="center" valign="middle">
                                    <td class="borderedTableGrey" height="30"><%= GetTimetablePeriod(5, i, rcVenues(j).Item(0).ToString)%></td>
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
