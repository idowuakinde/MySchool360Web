<%@ Page Language="VB" AutoEventWireup="false" CodeFile="classposition_bmi.aspx.vb" Inherits="modules_dashboards_classposition_bmi" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {
	font-weight: bold;
	font-size: 60px;
}
.style6 {font-size: 36px}
.style11 {font-size: 45px}
.style12 {
	font-size: 80px;
	color: green;
}
-->
</style>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="1005"  border="0">
  <tr>
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Student's BMI (Body Mass Index) Position Monitor</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td width="40" align="right" class="defaultHeaderTextStyle">
            1.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="lblClassName" runat="server" Font-Bold="True">CLASS PERCENTILE FOR </asp:Label></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart1" runat="server" BorderColor="Black" BorderStyle="None"
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
      

    </table></td>
  </tr>
</table>
</form>
</body>
</html>
