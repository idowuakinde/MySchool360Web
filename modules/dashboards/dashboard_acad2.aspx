<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dashboard_acad2.aspx.vb" Inherits="modules_dashboards_dashboard_acad2" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Academic Dashboard</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="1005"  border="0">
  <tr>
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Academic Performance Dashboard (TERM-END, 1ST TERM)</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td width="3%" align="right" class="defaultHeaderTextStyle">1.</td>
        <td colspan="3" class="defaultHeaderTextStyle">
            <asp:Label ID="Label1" runat="server" Font-Bold="True">AT-A-GLANCE INDICES</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td colspan="3" align="left" valign="top" class="defaultHeaderTextStyle borderedTable"><table width="100%" border="0">
          <tr>
            <td width="48%" bgcolor="#E9E9E9"><table width="100%" border="0">
              
              <tr>
                <td width="60%">TOTAL NUMBER OF STUDENTS</td>
                <td width="5%">:</td>
                <td><asp:Label ID="lblStudentCount" runat="server" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                <td bgcolor="#F9F9F9">STUDENT-TEACHER RATIO</td>
                <td bgcolor="#F9F9F9">:</td>
                <td bgcolor="#F9F9F9"><asp:Label ID="lblStudentTeacherRatio" runat="server" 
                        Text="Label"></asp:Label></td>
              </tr>
                            
            </table></td>
            <td width="4%">&nbsp;</td>
            <td bgcolor="#E9E9E9"><table width="100%" border="0">
              
              <tr>
                <td width="60%">TOTAL NUMBER OF TEACHERS</td>
                <td width="5%">:</td>
                <td><asp:Label ID="lblTeacherCount" runat="server" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                <td bgcolor="#F9F9F9">TEACHERS&#39; MINIMUM PASS RATE</td>
                <td bgcolor="#F9F9F9">:</td>
                <td bgcolor="#F9F9F9"><asp:Label ID="lblPassRate" runat="server" Text="Label"></asp:Label></td>
              </tr>
                            
            </table></td>
          </tr>
        </table>
        </td>
      </tr>
      
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">2.</td>
        <td width="47%" class="defaultHeaderTextStyle">
            <asp:Label ID="Label2" runat="server" Font-Bold="True">TOP 5 SECONDARY STUDENTS (TERM-END, 1ST TERM)</asp:Label></td>
        <td width="3%" align="right" class="defaultHeaderTextStyle">3.</td>
        <td class="defaultHeaderTextStyle">
            <asp:Label ID="Label3" runat="server" Font-Bold="True">TOP 5 PRIMARY STUDENTS (TERM-END, 1ST TERM)</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart1" 
                runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
                Width="440px">
            <DefaultTitleBox Visible="False">
                <HeaderLabel GlowColor="" Type="UseFont">                </HeaderLabel>
                <HeaderBackground ShadingEffectMode="None" />
                <Background ShadingEffectMode="None" />
                <Label GlowColor="" Type="UseFont">                </Label>
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
                <HeaderLabel GlowColor="" Type="UseFont">                </HeaderLabel>
                <HeaderBackground ShadingEffectMode="None" />
                <Background ShadingEffectMode="None" />
            </DefaultLegendBox>
            <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                <DefaultElement ShapeType="None">
                    <DefaultSubValue Name="">
                        <Line Length="4" />
                    </DefaultSubValue>
                    <SmartLabel GlowColor="" Type="UseFont">                    </SmartLabel>
                    <LegendEntry ShapeType="None">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" />
                    </LegendEntry>
                </DefaultElement>
                <Label Font="Tahoma, 8pt" GlowColor="" Type="UseFont">                </Label>
                <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4">                    </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                        <Line Length="3" />
                        <Label GlowColor="" Type="UseFont">                        </Label>
                    </ZeroTick>
                    <DefaultTick>
                        <Line Length="3" />
                        <Label GlowColor="" Text="%Value" Type="UseFont">                        </Label>
                    </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                Type="UseFont">                    </Label>
                </YAxis>
                <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4">                    </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                        <Line Length="3" />
                        <Label GlowColor="" Type="UseFont">                        </Label>
                    </ZeroTick>
                    <DefaultTick>
                        <Line Length="3" />
                        <Label GlowColor="" Text="%Value" Type="UseFont">                        </Label>
                    </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                Type="UseFont">                    </Label>
                </XAxis>
                <Background ShadingEffectMode="None" />
                <TitleBox Position="Left" Visible="True">
                    <HeaderLabel GlowColor="" Type="UseFont">                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <Label Color="Black" GlowColor="" Type="UseFont">                    </Label>
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
                    <HeaderLabel GlowColor="" Type="UseFont">                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                </LegendBox>
            </ChartArea>
            <DefaultElement ShapeType="None">
                <DefaultSubValue Name="">                </DefaultSubValue>
                <SmartLabel GlowColor="" Type="UseFont">                </SmartLabel>
                <LegendEntry ShapeType="None">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                </LegendEntry>
            </DefaultElement>
            <NoDataLabel GlowColor="" Type="UseFont">            </NoDataLabel>
            <TitleBox Position="Left" Visible="True">
                <HeaderLabel GlowColor="" Type="UseFont">                </HeaderLabel>
                <HeaderBackground ShadingEffectMode="None" />
                <Background ShadingEffectMode="None" />
                <Label Color="Black" GlowColor="" Type="UseFont">                </Label>
            </TitleBox>
        </dotnet:Chart>        </td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable">&nbsp;<dotnet:Chart ID="Chart2" 
                runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
                Width="440px">
            <DefaultTitleBox Visible="False">
                <HeaderLabel GlowColor="" Type="UseFont">                </HeaderLabel>
                <HeaderBackground ShadingEffectMode="None" />
                <Background ShadingEffectMode="None" />
                <Label GlowColor="" Type="UseFont">                </Label>
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
                <HeaderLabel GlowColor="" Type="UseFont">                </HeaderLabel>
                <HeaderBackground ShadingEffectMode="None" />
                <Background ShadingEffectMode="None" />
            </DefaultLegendBox>
            <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                <DefaultElement ShapeType="None">
                    <DefaultSubValue Name="">
                        <Line Length="4" />
                    </DefaultSubValue>
                    <SmartLabel GlowColor="" Type="UseFont">                    </SmartLabel>
                    <LegendEntry ShapeType="None">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" />
                    </LegendEntry>
                </DefaultElement>
                <Label Font="Tahoma, 8pt" GlowColor="" Type="UseFont">                </Label>
                <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4">                    </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                        <Line Length="3" />
                        <Label GlowColor="" Type="UseFont">                        </Label>
                    </ZeroTick>
                    <DefaultTick>
                        <Line Length="3" />
                        <Label GlowColor="" Text="%Value" Type="UseFont">                        </Label>
                    </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                Type="UseFont">                    </Label>
                </YAxis>
                <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                    <ScaleBreakLine Color="Gray" />
                    <TimeScaleLabels MaximumRangeRows="4">                    </TimeScaleLabels>
                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <ZeroTick>
                        <Line Length="3" />
                        <Label GlowColor="" Type="UseFont">                        </Label>
                    </ZeroTick>
                    <DefaultTick>
                        <Line Length="3" />
                        <Label GlowColor="" Text="%Value" Type="UseFont">                        </Label>
                    </DefaultTick>
                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                    <AlternateGridBackground ShadingEffectMode="None" />
                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                Type="UseFont">                    </Label>
                </XAxis>
                <Background ShadingEffectMode="None" />
                <TitleBox Position="Left" Visible="True">
                    <HeaderLabel GlowColor="" Type="UseFont">                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <Label Color="Black" GlowColor="" Type="UseFont">                    </Label>
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
                    <HeaderLabel GlowColor="" Type="UseFont">                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                </LegendBox>
            </ChartArea>
            <DefaultElement ShapeType="None">
                <DefaultSubValue Name="">                </DefaultSubValue>
                <SmartLabel GlowColor="" Type="UseFont">                </SmartLabel>
                <LegendEntry ShapeType="None">
                    <Background ShadingEffectMode="None" />
                    <LabelStyle GlowColor="" Type="UseFont" />
                </LegendEntry>
            </DefaultElement>
            <NoDataLabel GlowColor="" Type="UseFont">            </NoDataLabel>
            <TitleBox Position="Left" Visible="True">
                <HeaderLabel GlowColor="" Type="UseFont">                </HeaderLabel>
                <HeaderBackground ShadingEffectMode="None" />
                <Background ShadingEffectMode="None" />
                <Label Color="Black" GlowColor="" Type="UseFont">                </Label>
            </TitleBox>
        </dotnet:Chart>        </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">4.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label10" runat="server" Font-Bold="True">TOP 5 NURSERY PUPILS (TERM-END, 1ST TERM)</asp:Label></td>
        <td align="right" class="defaultHeaderTextStyle">5.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label11" runat="server" Font-Bold="True">TOP 5 CRECHE PUPILS (TERM-END, 1ST TERM)</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart4" 
                runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
                Width="440px">
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
          </dotnet:Chart>        </td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable">&nbsp;
            <dotnet:Chart ID="Chart5" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
                Width="440px">
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
            </dotnet:Chart>        </td>
      </tr>
      <tr>
          <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
          <td class="defaultHeaderTextStyle">&nbsp;</td>
          <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
          <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
          <td align="right" class="defaultHeaderTextStyle">6.</td>
          <td class="defaultHeaderTextStyle"><asp:Label ID="Label6" runat="server" Font-Bold="True">SUBJECT PASS RATES (TERM-END, 1ST TERM)</asp:Label></td>
          <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
          <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
          <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
          <td colspan="3" class="defaultHeaderTextStyle borderedTable">
              
              <dotnet:Chart ID="Chart7" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="440px" ShadingEffectMode="Three" 
                Width="1000px">
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
              </dotnet:Chart>
              
              </td>
          </tr>
      <tr>
          <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
          <td class="defaultHeaderTextStyle">&nbsp;</td>
          <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
          <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
          <td align="right" class="defaultHeaderTextStyle"><span class="defaultHeaderTextStyle">7.</span></td>
          <td class="defaultHeaderTextStyle"><asp:Label ID="Label7" runat="server" Font-Bold="True">CLASS PASS RATES (TERM-END, 1ST TERM)</asp:Label></td>
          <td align="right" class="defaultHeaderTextStyle"><span class="defaultHeaderTextStyle">8.</span></td>
          <td class="defaultHeaderTextStyle"><asp:Label ID="Label4" runat="server" Font-Bold="True">GENDER PASS RATES (TERM-END, 1ST TERM)</asp:Label></td>
      </tr>
      <tr>
          <td align="right" class="defaultHeaderTextStyle" style="height: 15px">&nbsp;</td>
          <td class="defaultHeaderTextStyle borderedTable" style="height: 15px">
              
              <dotnet:Chart ID="Chart6" runat="server" BorderColor="Black" BorderStyle="None" BorderWidth="1px"
                Height="220px" ShadingEffectMode="Three"
                Width="440px">
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
                  </dotnet:Chart>
              </td>
          <td align="right" class="defaultHeaderTextStyle" style="height: 15px">&nbsp;</td>
          <td class="defaultHeaderTextStyle borderedTable" style="height: 15px">
              
              <dotnet:Chart ID="Chart3" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
                Width="440px">
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
                  </dotnet:Chart>
              </td>
      </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
