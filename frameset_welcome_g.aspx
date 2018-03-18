<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frameset_welcome_g.aspx.vb" Inherits="frameset_welcome_g" Strict="false" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="inc_functions_js.js" type="text/javascript"></script>
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
    .style18
    {
        font-weight: bold;
        border: 1px solid #E5E5E5;
    }
</style>

<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="4" topmargin="2" marginwidth="0" marginheight="0">

    <form id="form1" runat="server">
<table width="1000"  border="0">
  <tr>
    <td width="70%" valign="top"><span class="pageHeaderStyleAMMA"><font color="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>">&nbsp;:: Welcome to <%=rowsSchoolTheme(0).Item("SchoolName")%>. We are currently running the <%= currentTerm%> of the <%= sessionName%> Academic Year.</font></span></td>
    </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td width="690" valign="top"><table width="100%" border="0">
          <tr>
            <td colspan="2" align="left" 
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: Your Account Details (<%= staffFullName.ToUpper%>)</font></span></td>
            </tr>
          <tr>
            <td width="180" align="center" valign="top" class="borderedTableGrey"><a>
              <asp:Image Imageurl='' ID="imgPhoto" 
                    runat="server" BorderStyle="Solid" BorderWidth="2px" Height="140px" 
                    Width="140px" 
                    ToolTip="Passport Photograph..." EnableViewState="False" /></a>&nbsp;</td>
            <td align="left" 
                valign="top" class="style18">
                   <table border="0" width="100%">
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>PORTAL USERNAME: <%= rowsStaffProfile(0).Item("Username").ToString%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>FULL NAMES: <%= staffFullName.ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>ROLE: <%= (rowsStaffProfile(0).Item("RoleName").ToString).ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>DEPARTMENT: <%= departmentName.ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>GENDER: <%= Common.GetMaleOrFemale(rowsStaffProfile(0).Item("Sex").ToString).ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>BIRTHDAY: <%= Common.GetSpecialDateFormatShort(CType(rowsStaffProfile(0).Item("DateOfBirth"), Date)).ToUpper%><% End If%>
                          </td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStaffProfile.Count <> 0 Then%>E-MAIL: <%= rowsStaffProfile(0).Item("Email").ToString.tolower%>
                          <% End If%></td>
                        </tr>
                      </table>
              </td>
            </tr>
          </table>
          <table width="100%" border="0">
            <tr>
              <td align="left" 
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: <%= MonthName(Month(Now), false) & " " & Year(Now).ToString & " Calendar (" & calendarEvents.Count.ToString & " events)" %></font></span></td>
              </tr>
            <tr>
              <td align="center" valign="top" class="borderedTableGrey style18">
                <asp:Calendar ID="calEvents" runat="server" BackColor="White" 
                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                        Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" Height="150px" 
                        ShowNextPrevMonth="False" ShowTitle="False" Width="100%">
                  <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                  <DayStyle Font-Bold="False" />
                  <NextPrevStyle VerticalAlign="Bottom" />
                  <OtherMonthDayStyle ForeColor="Gray" />
                  <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                  <SelectorStyle BackColor="#CCCCCC" />
                  <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                  <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                  <WeekendDayStyle BackColor="#FFFFCC" />
                  </asp:Calendar>
                </td>
              </tr>
            </table>
          <table width="100%" border="0">
            <tr>
              <td align="center" valign="top" class="borderedTableGrey">
<table width="100%"  border="0">
  <tr>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
                </td>
              </tr>
            </table>
        </td>
        <td valign="top">


          
          <table width="100%" border="0">
            <tr>
              <td align="left" 
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: News Stream</font></span></td>
            </tr>
            <tr>
              <td align="center" valign="top" class="borderedTableGrey"><table width="100%" 
                      border="0" cellpadding="1" cellspacing="1">
                  <% 
		  	SN = 0
                    For i As Int32 = 1 To rowsRecentActivity.Count
                        SN = SN + 1
%>
                <tr>
                  <td valign="top" colspan="2">
				  <table width="100%" border="0" cellpadding="3" cellspacing="0">
                    <tr>
                      <td bgcolor='<%= Common.GetRecentActivityBackgroundColor(rowsRecentActivity(i).ToString.Split("|")(0) & rowsRecentActivity(i).ToString.Split("|")(1)) %>' valign="top" width="50"><%= rowsRecentActivity(i).ToString.Split("|")(0) %></td>
                      <td valign="top"><%= rowsRecentActivity(i).ToString.Split("|")(2) %></td>
                    </tr>
                  </table></td>
                </tr>
                  <% 
            Next
%>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
      </table></td>
  </tr>
  </table>
    </form>

<%
    If rowsStaffProfile.Count <> 0 Then
        If Month(CType(rowsStaffProfile(0).Item("DateOfBirth"), Date)) = Month(Now()) And Day(CType(rowsStaffProfile(0).Item("DateOfBirth"), Date)) = Day(Now()) Then
%>
    <div id='happyBirthDayOverlay' class="happyBirthDayOverlay" style="position: absolute; top: 0px; left: 0px; width: 100%; background-color: rgba(0, 0, 0, 0.298039); height: 100%; background-position: initial initial; background-repeat: initial initial;">
        <div id="happybirthdayDialog" class="birthDayDialog">
            <h2 class="happybirthdayHeading" style="font-size: 1.7em; padding: 15px; text-align: center">Happy birthday <%= staffFullName%>!</h2>
            <p align="center">
                <img src="images/birthday_2-copy.gif" />
                <br /><br />
                Hi <%= staffFullName%>,<br />Happy birthday to you!<br />Enjoy your day and have fun! 
                <br /><br />
                <a onclick="javascript:ChangeElementClass('happyBirthDayOverlay', 'hidden');" style="font-weight: bold; cursor: pointer; background-color: White">Close</a>
            </p>
        </div>
    </div>
<%
End If
End If
%>

</body>
</html>
