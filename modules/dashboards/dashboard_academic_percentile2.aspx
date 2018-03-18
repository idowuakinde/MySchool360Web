<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dashboard_academic_percentile2.aspx.vb" Inherits="modules_dashboards_dashboard_academic_percentile2" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="1005"  border="0">
  <tr>
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Academic Performance Trends (Class Percentiles)</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
        <tr>
        <td align="right" class="defaultHeaderTextStyle">1.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS4" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR PLAYGROUP</asp:Label></td>
        </tr>
        <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px">
            <dotnet:Chart ID="Chart7" runat="server" BorderColor="Black" BorderStyle="None"
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
          &nbsp; </td>
        </tr>
        <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
        </tr>
        <tr>
        <td align="right" class="defaultHeaderTextStyle">2.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS5" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR PRE-NURSERY</asp:Label></td>
        </tr>
        <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px">
            <dotnet:Chart ID="Chart8" runat="server" BorderColor="Black" BorderStyle="None"
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
          &nbsp; </td>
        </tr>
        <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
        </tr>
      <tr>
        <td width="40" align="right" class="defaultHeaderTextStyle">
            3.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label10" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR NURSERY 1</asp:Label></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="chart6" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">4.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label11" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR NURSERY 2</asp:Label></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="chart5" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">5.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label12" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 1</asp:Label></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart4" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
  &nbsp;&nbsp;</td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">6.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label2" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 2</asp:Label></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart3" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          </dotnet:Chart>&nbsp;        </td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">7.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS2" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 3</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart2" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">8.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS3" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 4</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart1" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">9.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 5</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart13" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">10.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS6" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 6</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart14" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">11.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS7" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 7</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart9" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">12.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS8" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 8</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart10" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">13.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS9" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 9</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart11" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">14.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblSS10" runat="server" Font-Bold="True">CLASS PERCENTILE (TERM-END, 1ST TERM) FOR YEAR 10</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px"><dotnet:Chart ID="Chart12" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px">
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
          &nbsp; </td>
      </tr>
      

        </table></td>
  </tr>
</table>
</form>
</body>
</html>
