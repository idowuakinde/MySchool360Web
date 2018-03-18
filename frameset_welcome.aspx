<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frameset_welcome.aspx.vb" Inherits="frameset_welcome" Strict="false" %>
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
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: Your Account Details (<%= studentFullName.ToUpper %>)</font></span></td>
            </tr>
          <tr>
            <td width="180" align="center" valign="top" class="borderedTableGrey"><a>
              <asp:Image Imageurl='' ID="imgPhoto" 
                    runat="server" BorderStyle="Solid" BorderWidth="2px" Height="140px" 
                    Width="140px" 
                    ToolTip="Your Passport Photograph..." EnableViewState="False" /></a>&nbsp;</td>
            <td align="left" valign="top" class="style18">
                   <table border="0" width="100%">
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          PORTAL NUMBER: <%= (rowsStudentProfile(0).Item("CustomerCode").ToString).ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          FULL NAMES: <%= (rowsStudentProfile(0).Item("FirstName").ToString & " " & rowsStudentProfile(0).Item("LastName").ToString).ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          CLASS: <%= rowsStudentProfile(0).Item("DistrictCode").ToString.ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          GENDER: <%= Common.GetMaleOrFemale(rowsStudentProfile(0).Item("SyncStatus").ToString).ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          BIRTHDAY: <%= Common.GetSpecialDateFormatShort(CType(rowsStudentProfile(0).Item("MeterDate"), Date)).ToUpper%>
                          <% End If%>
                          </td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          BOARDER?: <%= Common.GetYesOrNo(rowsStudentProfile(0).Item("Activated").ToString).ToUpper%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          FATHER'S E-MAIL &amp; TELEPHONE: <%= (rowsStudentProfile(0).Item("EmailAddress").ToString & " (" & rowsStudentProfile(0).Item("PhoneNumber").ToString & ")").ToLower%>
                          <% End If%></td>
                        </tr>
                      <tr>
                        <td class="style18"><% If rowsStudentProfile.Count <> 0 Then%>
                          MOTHER'S E-MAIL &amp; TELEPHONE: <%= (rowsStudentProfile(0).Item("CurrentBal").ToString & " (" & rowsStudentProfile(0).Item("Extension").ToString & ")").ToLower%>
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
              <td align="left" 
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: Cumulative Term-by-Term Performance Summary (Current Session)</font></span></td>
              </tr>
            <tr>
              <td align="center" valign="top" class="borderedTableGrey"><dotnet:Chart ID="Chart0" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="275px" ShadingEffectMode="Three" Width="280px">
                <DefaultTitleBox Visible="False">
                  <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                  <HeaderBackground ShadingEffectMode="None" />
                  <Background ShadingEffectMode="None" />
                  <label glowcolor="" type="UseFont"> </label>
                  </DefaultTitleBox>
                <SmartForecast Start="" TimeSpan="00:00:00" />
                <Background ShadingEffectMode="None" />
                <DefaultLegendBox CornerBottomRight="Cut" Padding="4">
                  <LabelStyle GlowColor="" Type="UseFont" />
                  <DefaultEntry ShapeType="None">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                    </DefaultEntry>
                  <HeaderEntry ShapeType="None" Visible="False">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                    </HeaderEntry>
                  <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                  <HeaderBackground ShadingEffectMode="None" />
                  <Background ShadingEffectMode="None" />
                  </DefaultLegendBox>
                <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                  <DefaultElement ShapeType="None">
                    <DefaultSubValue Name="">
                      <Line Length="4" />
                      </DefaultSubValue>
                    <SmartLabel GlowColor="" Type="UseFont"> </SmartLabel>
                    <LegendEntry ShapeType="None">
                      <Background ShadingEffectMode="None" />
                      <LabelStyle GlowColor="" Type="UseFont" />
                      </LegendEntry>
                    </DefaultElement>
                  <label font="Tahoma, 8pt" glowcolor="" type="UseFont"> </label>
                  <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4"> </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                      <Line Length="3" />
                      <label glowcolor="" type="UseFont"> </label>
                      </ZeroTick>
                    <DefaultTick>
                      <Line Length="3" />
                      <label glowcolor="" text="%Value" type="UseFont"> </label>
                      </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" linealignment="Center"
                                type="UseFont"> </label>
                    </YAxis>
                  <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4"> </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                      <Line Length="3" />
                      <label glowcolor="" type="UseFont"> </label>
                      </ZeroTick>
                    <DefaultTick>
                      <Line Length="3" />
                      <label glowcolor="" text="%Value" type="UseFont"> </label>
                      </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" linealignment="Center"
                                type="UseFont"> </label>
                    </XAxis>
                  <Background ShadingEffectMode="None" />
                  <TitleBox Position="Left" Visible="True">
                    <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <label color="Black" glowcolor="" type="UseFont"> </label>
                    </TitleBox>
                  <LegendBox CornerBottomRight="Cut" Orientation="TopRight" Padding="4">
                    <LabelStyle GlowColor="" Type="UseFont" />
                    <DefaultEntry ShapeType="None">
                      <Background ShadingEffectMode="None" />
                      <LabelStyle GlowColor="" Type="UseFont" />
                      </DefaultEntry>
                    <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" Visible="False">
                      <Background ShadingEffectMode="None" />
                      <LabelStyle Font="Arial, 8pt, style=Bold" GlowColor="" Type="UseFont" />
                      </HeaderEntry>
                    <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    </LegendBox>
                  </ChartArea>
                <DefaultElement ShapeType="None">
                  <DefaultSubValue Name=""> </DefaultSubValue>
                  <SmartLabel GlowColor="" Type="UseFont"> </SmartLabel>
                  <LegendEntry ShapeType="None">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                    </LegendEntry>
                  </DefaultElement>
                <NoDataLabel GlowColor="" Type="UseFont"> </NoDataLabel>
                <TitleBox Position="Left" Visible="True">
                  <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                  <HeaderBackground ShadingEffectMode="None" />
                  <Background ShadingEffectMode="None" />
                  <label color="Black" glowcolor="" type="UseFont"> </label>
                  </TitleBox>
                </dotnet:Chart></td>
              </tr>
            </table>
          <table width="100%" border="0">
            <tr>
              <td align="left" 
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: Cumulative Subject-by-Subject Performance Summary (Current Term)</font></span></td>
              </tr>
            <tr>
              <td align="center" valign="top" class="borderedTableGrey"><dotnet:Chart ID="Chart0b" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="275px" ShadingEffectMode="Three" Width="280px">
                <DefaultTitleBox Visible="False">
                  <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                  <HeaderBackground ShadingEffectMode="None" />
                  <Background ShadingEffectMode="None" />
                  <label glowcolor="" type="UseFont"> </label>
                  </DefaultTitleBox>
                <SmartForecast Start="" TimeSpan="00:00:00" />
                <Background ShadingEffectMode="None" />
                <DefaultLegendBox CornerBottomRight="Cut" Padding="4">
                  <LabelStyle GlowColor="" Type="UseFont" />
                  <DefaultEntry ShapeType="None">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                    </DefaultEntry>
                  <HeaderEntry ShapeType="None" Visible="False">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                    </HeaderEntry>
                  <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                  <HeaderBackground ShadingEffectMode="None" />
                  <Background ShadingEffectMode="None" />
                  </DefaultLegendBox>
                <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                  <DefaultElement ShapeType="None">
                    <DefaultSubValue Name="">
                      <Line Length="4" />
                      </DefaultSubValue>
                    <SmartLabel GlowColor="" Type="UseFont"> </SmartLabel>
                    <LegendEntry ShapeType="None">
                      <Background ShadingEffectMode="None" />
                      <LabelStyle GlowColor="" Type="UseFont" />
                      </LegendEntry>
                    </DefaultElement>
                  <label font="Tahoma, 8pt" glowcolor="" type="UseFont"> </label>
                  <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4"> </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                      <Line Length="3" />
                      <label glowcolor="" type="UseFont"> </label>
                      </ZeroTick>
                    <DefaultTick>
                      <Line Length="3" />
                      <label glowcolor="" text="%Value" type="UseFont"> </label>
                      </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" linealignment="Center"
                                type="UseFont"> </label>
                    </YAxis>
                  <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4"> </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                      <Line Length="3" />
                      <label glowcolor="" type="UseFont"> </label>
                      </ZeroTick>
                    <DefaultTick>
                      <Line Length="3" />
                      <label glowcolor="" text="%Value" type="UseFont"> </label>
                      </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" linealignment="Center"
                                type="UseFont"> </label>
                    </XAxis>
                  <Background ShadingEffectMode="None" />
                  <TitleBox Position="Left" Visible="True">
                    <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <label color="Black" glowcolor="" type="UseFont"> </label>
                    </TitleBox>
                  <LegendBox CornerBottomRight="Cut" Orientation="TopRight" Padding="4">
                    <LabelStyle GlowColor="" Type="UseFont" />
                    <DefaultEntry ShapeType="None">
                      <Background ShadingEffectMode="None" />
                      <LabelStyle GlowColor="" Type="UseFont" />
                      </DefaultEntry>
                    <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" Visible="False">
                      <Background ShadingEffectMode="None" />
                      <LabelStyle Font="Arial, 8pt, style=Bold" GlowColor="" Type="UseFont" />
                      </HeaderEntry>
                    <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    </LegendBox>
                  </ChartArea>
                <DefaultElement ShapeType="None">
                  <DefaultSubValue Name=""> </DefaultSubValue>
                  <SmartLabel GlowColor="" Type="UseFont"> </SmartLabel>
                  <LegendEntry ShapeType="None">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                    </LegendEntry>
                  </DefaultElement>
                <NoDataLabel GlowColor="" Type="UseFont"> </NoDataLabel>
                <TitleBox Position="Left" Visible="True">
                  <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                  <HeaderBackground ShadingEffectMode="None" />
                  <Background ShadingEffectMode="None" />
                  <label color="Black" glowcolor="" type="UseFont"> </label>
                  </TitleBox>
                </dotnet:Chart></td>
              </tr>
            </table></td>
        <td valign="top">



          <table width="100%" border="0">
            <tr>
              <td align="left" 
                bgcolor="<%= rowsSchoolTheme(0).Item("ExtensionField1") %>"><span class="pageHeaderStyleAMMA"><font color="White">&nbsp;:: From the School Management</font></span></td>
              </tr>
            <tr>
              <td align="center" valign="top" class="borderedTableGrey"><table width="100%" border="0">
                <% 	
                If rowsAnnouncements.Count = 0 Then
%>
                <tr>
                  <td valign="top" class="borderedTableGrey">
                    <table width="100%" border="0">
                      <tr>
                        <td colspan="" class="borderedTableGrey">No announcements at this time.</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                <%
            Else
%>
                <% 
		  	SN = 0
                For i As Int32 = 0 To rowsAnnouncements.Count - 1
                    SN = SN + 1
%>
                <tr>
                  <td valign="top">
                    <table width="100%" border="0">
                      <tr>
                        <td valign="top" width="50"><%= Common.GetSpecialDateFormatShort(CType(rowsAnnouncements(i).Item("Creation_Date"), Date)) %></td>
                        <td valign="top"><%=rowsAnnouncements(i).Item("Message").ToString%></td>
                      </tr>
                    </table>                  
                  </td>
                </tr>
                <% 
            Next
            End If
%>
                </table></td>
              </tr>
            </table>
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
  <tr>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
    </form>

<%
    If rowsStudentProfile.Count <> 0 Then
        If Month(CType(rowsStudentProfile(0).Item("MeterDate"), Date)) = Month(Now()) And Day(CType(rowsStudentProfile(0).Item("MeterDate"), Date)) = Day(Now()) Then
%>
    <div id='happyBirthDayOverlay' class="happyBirthDayOverlay" style="position: absolute; top: 0px; left: 0px; width: 100%; background-color: rgba(0, 0, 0, 0.298039); height: 100%; background-position: initial initial; background-repeat: initial initial;">
        <div id="happybirthdayDialog" class="birthDayDialog">
            <h2 class="happybirthdayHeading" style="font-size: 1.7em; padding: 15px; text-align: center">Happy birthday <%= studentFullName%>!</h2>
            <p align="center">
                <img src="images/birthday_2-copy.gif" />
                <br /><br />
                Hi <%= studentFullName%>,<br />Happy birthday to you!<br />Enjoy your day and have fun! 
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
