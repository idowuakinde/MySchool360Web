<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dash_appraisal.aspx.vb" Inherits="modules_dashboards_dash_appraisal" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>HR Dashboard</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" marginheight="0" marginwidth="0" topmargin="0">
    <form id="form1" runat="server">
    <table border="0" width="1005">
        <tr>
            <td valign="top" width="999">
                <span class="pageHeaderStyleAMMA">&nbsp;:: KPI Dashboard for the APPRAISAL Module</span>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table border="0" width="100%">
                  <tr>
                    <td width="3%" align="right" class="defaultHeaderTextStyle"> 1. </td>
                    <td class="defaultHeaderTextStyle"><asp:Label ID="Label" runat="server" Font-Bold="True">PERFORMANCE TREND IN &#39;ADMINISTRATION&#39; DEPARTMENT</asp:Label></td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
                    <td align="center" class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart1" 
                            runat="server" BorderColor="Black" BorderStyle="None" BorderWidth="1px"
                                Height="220px" ShadingEffectMode="Three" URL="../reports/proc_airlines_pass.aspx"
                                Width="930px">
                      <DefaultTitleBox Visible="False">
                        <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                        <label glowcolor="" type="UseFont"> </label>
                      </DefaultTitleBox>
                      <Hotspot URL="../reports/proc_airlines_pass.aspx"> </Hotspot>
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
                      
&nbsp;                    </td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
                    <td class="defaultHeaderTextStyle">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">2. </td>
                    <td class="defaultHeaderTextStyle"><asp:Label ID="Label3" runat="server" Font-Bold="True">PERFORMANCE TREND IN &#39;TEACHING&#39; DEPARTMENT</asp:Label></td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
                    <td align="center" class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart2" 
                            runat="server" BorderColor="Black" BorderStyle="None" BorderWidth="1px"
                                Height="220px" ShadingEffectMode="Three" URL="../reports/proc_airlines_pass.aspx"
                                Width="930px">
                      <DefaultTitleBox Visible="False">
                        <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                        <label glowcolor="" type="UseFont"> </label>
                      </DefaultTitleBox>
                      <Hotspot URL="../reports/proc_airlines_pass.aspx"> </Hotspot>
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
                      &nbsp; </td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
                    <td class="defaultHeaderTextStyle">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">3. </td>
                    <td class="defaultHeaderTextStyle"><asp:Label ID="Label5" runat="server" Font-Bold="True">PERFORMANCE TREND IN &#39;MAINTENANCE &amp; GROUNDS&#39; DEPARTMENT</asp:Label></td>
                  </tr>
                  <tr>
                    <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
                    <td align="center" class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart3" runat="server" BorderColor="Black" BorderStyle="None" BorderWidth="1px"
                                Height="220px" ShadingEffectMode="Three" URL="../reports/proc_airlines.aspx"
                                Width="930px">
                      <DefaultTitleBox Visible="False">
                        <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                        <label glowcolor="" type="UseFont"> </label>
                      </DefaultTitleBox>
                      <Hotspot URL="../reports/proc_airlines.aspx"> </Hotspot>
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
                      
                    &nbsp; </td>
                  </tr>
                    </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
