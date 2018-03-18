<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="modules_dashboards_school_Default" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Revenue Dashboard</title>
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
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Financial Performance Dashboard</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td width="3%" align="right" class="defaultHeaderTextStyle">1.</td>
        <td colspan="3" class="defaultHeaderTextStyle">
            <asp:Label ID="Label1" runat="server" Font-Bold="True">ANNUAL REVENUE-TARGET TRACKER</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td colspan="3" align="center" valign="middle" class="defaultHeaderTextStyle borderedTable"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="48%">
                <dotnet:Chart ID="Chart" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="270px" ShadingEffectMode="Three" Type="Gauges" Width="440px">
                    <DefaultTitleBox Visible="False">
                        <HeaderLabel GlowColor="" Type="UseFont">                        </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                        <Label GlowColor="" Type="UseFont">                        </Label>
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
                        <HeaderLabel GlowColor="" Type="UseFont">                        </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                    </DefaultLegendBox>
                    <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                        <DefaultElement ShapeType="None">
                            <DefaultSubValue Name="">
                                <Line Length="4" />
                            </DefaultSubValue>
                            <SmartLabel GlowColor="" Type="UseFont">                            </SmartLabel>
                            <LegendEntry ShapeType="None">
                                <Background ShadingEffectMode="None" />
                                <LabelStyle GlowColor="" Type="UseFont" />
                            </LegendEntry>
                        </DefaultElement>
                        <Label Font="Tahoma, 8pt" GlowColor="" Type="UseFont">                        </Label>
                        <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                            <ScaleBreakLine Color="Gray" />
                            <TimeScaleLabels MaximumRangeRows="4">                            </TimeScaleLabels>
                            <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                            <ZeroTick>
                                <Line Length="3" />
                                <Label GlowColor="" Type="UseFont">                                </Label>
                            </ZeroTick>
                            <DefaultTick>
                                <Line Length="3" />
                                <Label GlowColor="" Text="%Value" Type="UseFont">                                </Label>
                            </DefaultTick>
                            <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                            <AlternateGridBackground ShadingEffectMode="None" />
                            <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                Type="UseFont">                            </Label>
                        </YAxis>
                        <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                            <ScaleBreakLine Color="Gray" />
                            <TimeScaleLabels MaximumRangeRows="4">                            </TimeScaleLabels>
                            <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                            <ZeroTick>
                                <Line Length="3" />
                                <Label GlowColor="" Type="UseFont">                                </Label>
                            </ZeroTick>
                            <DefaultTick>
                                <Line Length="3" />
                                <Label GlowColor="" Text="%Value" Type="UseFont">                                </Label>
                            </DefaultTick>
                            <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                            <AlternateGridBackground ShadingEffectMode="None" />
                            <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                Type="UseFont">                            </Label>
                        </XAxis>
                        <Background ShadingEffectMode="None" />
                        <TitleBox Position="Left">
                            <HeaderLabel GlowColor="" Type="UseFont">                            </HeaderLabel>
                            <HeaderBackground ShadingEffectMode="None" />
                            <Background ShadingEffectMode="None" />
                            <Label Color="Black" GlowColor="" Type="UseFont">                            </Label>
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
                            <HeaderLabel GlowColor="" Type="UseFont">                            </HeaderLabel>
                            <HeaderBackground ShadingEffectMode="None" />
                            <Background ShadingEffectMode="None" />
                        </LegendBox>
                    </ChartArea>
                    <DefaultElement ShapeType="None">
                        <DefaultSubValue Name="">                        </DefaultSubValue>
                        <SmartLabel GlowColor="" Type="UseFont">                        </SmartLabel>
                        <LegendEntry ShapeType="None">
                            <Background ShadingEffectMode="None" />
                            <LabelStyle GlowColor="" Type="UseFont" />
                        </LegendEntry>
                    </DefaultElement>
                    <NoDataLabel GlowColor="" Type="UseFont">                    </NoDataLabel>
                    <TitleBox Position="Left">
                        <HeaderLabel GlowColor="" Type="UseFont">                        </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                        <Label Color="Black" GlowColor="" Type="UseFont">                        </Label>
                    </TitleBox>
                </dotnet:Chart>                </td>
            <td width="4%">&nbsp;</td>
            <td align="center" valign="top"><table width="100%" border="0">
              <tr>
                <td colspan="2" align="center" valign="top"><table width="100%" border="0" bgcolor="#E8EBEE" class="borderedTable">
                    <tr>
                      <td align="center" valign="top" class="pageHeaderStyleAMMA">CURRENT SCORE </td>
                    </tr>
                    <tr>
                      <td align="center" valign="top" class="pageHeaderStyleAMMA"><hr /></td>
                    </tr>
                    <tr>
                      <td align="center" valign="top" class="style3"><span class="style12">
                        <asp:Label ID="Label4" runat="server" Text=''></asp:Label>
                      </span></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td width="50%" align="center" valign="top"><table width="100%" border="0" bgcolor="#E8EBEE" class="borderedTable">
                    <tr>
                      <td align="center" valign="top" class="pageHeaderStyleAMMA">THIS YEAR'S TARGET</td>
                    </tr>
                    <tr>
                      <td align="center" valign="top" class="pageHeaderStyleAMMA"><hr /></td>
                    </tr>
                    <tr>
                      <td align="center" valign="top" class="style3"><span class="style11">
                          <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></span><span class="style6">m</span></td>
                    </tr>
                </table></td>
                <td align="center" valign="top"><table width="100%" border="0" bgcolor="#E8EBEE" class="borderedTable">
                  <tr>
                    <td align="center" valign="top" class="pageHeaderStyleAMMA">CURRENT POSITION </td>
                  </tr>
                  <tr>
                    <td align="center" valign="top" class="pageHeaderStyleAMMA"><hr /></td>
                  </tr>
                  <tr>
                    <td align="center" valign="top" class="style3"><span class="style11">
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></span><span class="style6">m</span></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
        </table></td>
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
            <asp:Label ID="Label2" runat="server" Font-Bold="True">BANK ANALYSIS</asp:Label></td>
        <td width="3%" align="right" class="defaultHeaderTextStyle">3.</td>
        <td class="defaultHeaderTextStyle">
            <asp:Label ID="Label3" runat="server" Font-Bold="True">PAYMENT-PURPOSE ANALYSIS</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart1" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px" URL="../reports/summary_banks.aspx">
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
            <Hotspot URL="../reports/summary_banks.aspx">            </Hotspot>
        </dotnet:Chart>        </td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable">&nbsp;<dotnet:Chart ID="Chart2" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px" URL="../reports/summary_revenueheads.aspx">
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
            <Hotspot URL="../reports/summary_revenueheads.aspx">            </Hotspot>
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
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label10" runat="server" Font-Bold="True">STUDENT-LEVEL ANALYSIS</asp:Label></td>
        <td align="right" class="defaultHeaderTextStyle">5.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label11" runat="server" Font-Bold="True">GEOGRAPHICAL-AREA ANALYSIS</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="Chart4" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px" URL="../reports/summary_businesstypes.aspx">
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
            <Hotspot URL="../reports/summary_businesstypes.aspx"> </Hotspot>
          </dotnet:Chart>        </td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable">&nbsp;
            <dotnet:Chart ID="Chart5" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px" URL="../reports/summary_geo_areas.aspx">
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
              <Hotspot URL="../reports/summary_geo_areas.aspx"> </Hotspot>
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
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label13" runat="server" Font-Bold="True">PAYMENT-CHANNEL ANALYSIS</asp:Label></td>
        <td align="right" class="defaultHeaderTextStyle">
            7.</td>
        <td class="defaultHeaderTextStyle"><asp:Label ID="Label12" runat="server" Font-Bold="True">CAMPUS ANALYSIS</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle" style="height: 15px">&nbsp;</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px">		<dotnet:Chart ID="Chart7" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="220px" ShadingEffectMode="Three" Width="440px" URL="../reports/summary_channels.aspx">
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
                <Hotspot URL="../reports/summary_channels.aspx">                </Hotspot>
            </dotnet:Chart>        
&nbsp;</td>
        <td align="right" class="defaultHeaderTextStyle" style="height: 15px">&nbsp;            
</td>
        <td class="defaultHeaderTextStyle borderedTable" style="height: 15px">			
            <dotnet:Chart ID="Chart6" runat="server" BorderColor="Black" BorderStyle="None" BorderWidth="1px"
                Height="220px" ShadingEffectMode="Three" URL="../reports/summary_campuses.aspx"
                Width="440px">
                <DefaultTitleBox Visible="False">
                    <HeaderLabel GlowColor="" Type="UseFont">
                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <Label GlowColor="" Type="UseFont">
                    </Label>
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
                    <HeaderLabel GlowColor="" Type="UseFont">
                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                </DefaultLegendBox>
                <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                    <DefaultElement ShapeType="None">
                        <DefaultSubValue Name="">
                            <Line Length="4" />
                        </DefaultSubValue>
                        <SmartLabel GlowColor="" Type="UseFont">
                        </SmartLabel>
                        <LegendEntry ShapeType="None">
                            <Background ShadingEffectMode="None" />
                            <LabelStyle GlowColor="" Type="UseFont" />
                        </LegendEntry>
                    </DefaultElement>
                    <Label Font="Tahoma, 8pt" GlowColor="" Type="UseFont">
                    </Label>
                    <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                        <ScaleBreakLine Color="Gray" />
                        <TimeScaleLabels MaximumRangeRows="4">
                        </TimeScaleLabels>
                        <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                        <ZeroTick>
                            <Line Length="3" />
                            <Label GlowColor="" Type="UseFont">
                            </Label>
                        </ZeroTick>
                        <DefaultTick>
                            <Line Length="3" />
                            <Label GlowColor="" Text="%Value" Type="UseFont">
                            </Label>
                        </DefaultTick>
                        <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                        <AlternateGridBackground ShadingEffectMode="None" />
                        <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                            Type="UseFont">
                        </Label>
                    </YAxis>
                    <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                        <ScaleBreakLine Color="Gray" />
                        <TimeScaleLabels MaximumRangeRows="4">
                        </TimeScaleLabels>
                        <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                        <ZeroTick>
                            <Line Length="3" />
                            <Label GlowColor="" Type="UseFont">
                            </Label>
                        </ZeroTick>
                        <DefaultTick>
                            <Line Length="3" />
                            <Label GlowColor="" Text="%Value" Type="UseFont">
                            </Label>
                        </DefaultTick>
                        <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                        <AlternateGridBackground ShadingEffectMode="None" />
                        <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                            Type="UseFont">
                        </Label>
                    </XAxis>
                    <Background ShadingEffectMode="None" />
                    <TitleBox Position="Left" Visible="True">
                        <HeaderLabel GlowColor="" Type="UseFont">
                        </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                        <Label Color="Black" GlowColor="" Type="UseFont">
                        </Label>
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
                        <HeaderLabel GlowColor="" Type="UseFont">
                        </HeaderLabel>
                        <HeaderBackground ShadingEffectMode="None" />
                        <Background ShadingEffectMode="None" />
                    </LegendBox>
                </ChartArea>
                <DefaultElement ShapeType="None">
                    <DefaultSubValue Name="">
                    </DefaultSubValue>
                    <SmartLabel GlowColor="" Type="UseFont">
                    </SmartLabel>
                    <LegendEntry ShapeType="None">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" />
                    </LegendEntry>
                </DefaultElement>
                <NoDataLabel GlowColor="" Type="UseFont">
                </NoDataLabel>
                <TitleBox Position="Left" Visible="True">
                    <HeaderLabel GlowColor="" Type="UseFont">
                    </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <Label Color="Black" GlowColor="" Type="UseFont">
                    </Label>
                </TitleBox>
                <Hotspot URL="../reports/summary_campuses.aspx">
                </Hotspot>
            </dotnet:Chart>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
         
         
    </form>
</body>
</html>
