<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dashboard_student.aspx.vb" Inherits="modules_dashboards_school_dashboard_student" %>
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
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: My Dashboard 
        - highlighting my Academic Progress over a period of time.</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td colspan="3" align="center" class="defaultHeaderTextStyle">
          <asp:Label ID="LabelA" runat="server" Font-Bold="True">YOUR OVERALL PROGRESS MONITOR (ALL SUBJECTS)</asp:Label></td>
        </tr>
      
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td colspan="3" align="center" valign="middle" class="defaultHeaderTextStyle borderedTable"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="#FFFFCC">
              <td width="48%">&nbsp;
                <dotnet:Chart ID="Chart0" runat="server" BorderColor="Black" BorderStyle="None"
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
                </dotnet:Chart></td>
              <td width="4%">&nbsp;</td>
              <td align="left" valign="top">&nbsp;
                <dotnet:Chart ID="Chart0b" runat="server" BorderColor="Black" BorderStyle="None"
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
                </dotnet:Chart></td>
            </tr>
        </table></td>
      </tr>
      
      <tr>
        <td width="5%" align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td width="45%" class="defaultHeaderTextStyle">&nbsp;</td>
        <td width="5%" align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="center" class="defaultHeaderTextStyle">A. 
          <asp:Label ID="lblTermsTitle" runat="server" Font-Bold="True" Font-Underline="true">TEST-BY-TEST BREAKDOWN</asp:Label></td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="center" class="defaultHeaderTextStyle">B.
          <asp:Label ID="lblTermsTitle2" runat="server" Font-Bold="True" Font-Underline="true">SUBJECT-BY-SUBJECT BREAKDOWN</asp:Label></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="center" valign="top">
            <asp:GridView 
                ID="gvTests" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="AssessmentType" DataSourceID="dsSqlTests" ShowHeader="False" 
                Width="100%" BorderColor="White" BorderStyle="None" BorderWidth="0px" 
                EnableModelValidation="True">
            <columns>
                <asp:TemplateField>
                    <itemtemplate>
                        <table border="0" width="100%" bgcolor="#FFFFCC">
                            <tr>
                                <td align="center"><asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                        Text='<%# Databinder.Eval(Container.DataItem, "AssessmentType").ToString.ToUpper %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="center" class="defaultHeaderTextStyle borderedTable"><dotnet:Chart ID="chartTest" runat="server" BorderColor="Black" 
                                        BorderStyle="None" BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
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
                                        <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" 
                                                TimeInterval="Minutes">
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
                                            <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" 
                                                    linealignment="Center" type="UseFont"> </label>
                                        </YAxis>
                                        <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" 
                                                TimeInterval="Minutes">
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
                                            <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" 
                                                    linealignment="Center" type="UseFont"> </label>
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
                                            <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" 
                                                    Visible="False">
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
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">&nbsp;</td>
                            </tr>
                        </table>
                    </itemtemplate>
                </asp:TemplateField>
                </columns>
        </asp:GridView>
            <asp:SqlDataSource ID="dsSqlTests" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                SelectCommand=" Select 'Before Mid-Term' AS AssessmentType UNION ALL SELECT 'After Mid-Term' ">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" />
                </SelectParameters>
            </asp:SqlDataSource>
              </td>
        <td align="right" valign="top" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="center" valign="top"><asp:GridView 
                ID="gvSubjects" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="SubjectId" DataSourceID="dsSqlSubjects" ShowHeader="False" 
                Width="100%" BorderColor="White" BorderStyle="None" BorderWidth="0px" 
                EnableModelValidation="True">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table border="0" width="100%" bgcolor="#FFFFCC">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Label" runat="server" Font-Bold="True" Text='<%# "SUBJECT " & (serialSubjects + 1).ToString & ": " & Databinder.Eval(Container.DataItem, "SubjectName").ToString.ToUpper %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="defaultHeaderTextStyle borderedTable">
                                    <dotnet:Chart ID="chartSubject" runat="server" BorderColor="Black" 
                                        BorderStyle="None" BorderWidth="1px" Height="220px" ShadingEffectMode="Three" 
                                        Width="440px">
                                        <DefaultTitleBox Visible="False">
                                            <HeaderLabel GlowColor="" Type="UseFont">
                                            </HeaderLabel>
                                            <HeaderBackground ShadingEffectMode="None" />
                                            <Background ShadingEffectMode="None" />
                                            <label glowcolor="" type="UseFont">
                                            </label>
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
                                            <label font="Tahoma, 8pt" glowcolor="" type="UseFont">
                                            </label>
                                            <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" 
                                                TimeInterval="Minutes">
                                                <ScaleBreakLine Color="Gray" />
                                                <TimeScaleLabels MaximumRangeRows="4">
                                                </TimeScaleLabels>
                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                <ZeroTick>
                                                    <Line Length="3" />
                                                    <label glowcolor="" type="UseFont">
                                                    </label>
                                                </ZeroTick>
                                                <DefaultTick>
                                                    <Line Length="3" />
                                                    <label glowcolor="" text="%Value" type="UseFont">
                                                    </label>
                                                </DefaultTick>
                                                <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                <AlternateGridBackground ShadingEffectMode="None" />
                                                <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" 
                                                    linealignment="Center" type="UseFont">
                                                </label>
                                            </YAxis>
                                            <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" 
                                                TimeInterval="Minutes">
                                                <ScaleBreakLine Color="Gray" />
                                                <TimeScaleLabels MaximumRangeRows="4">
                                                </TimeScaleLabels>
                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                <ZeroTick>
                                                    <Line Length="3" />
                                                    <label glowcolor="" type="UseFont">
                                                    </label>
                                                </ZeroTick>
                                                <DefaultTick>
                                                    <Line Length="3" />
                                                    <label glowcolor="" text="%Value" type="UseFont">
                                                    </label>
                                                </DefaultTick>
                                                <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                <AlternateGridBackground ShadingEffectMode="None" />
                                                <label alignment="Center" font="Arial, 9pt, style=Bold" glowcolor="" 
                                                    linealignment="Center" type="UseFont">
                                                </label>
                                            </XAxis>
                                            <Background ShadingEffectMode="None" />
                                            <TitleBox Position="Left" Visible="True">
                                                <HeaderLabel GlowColor="" Type="UseFont">
                                                </HeaderLabel>
                                                <HeaderBackground ShadingEffectMode="None" />
                                                <Background ShadingEffectMode="None" />
                                                <label color="Black" glowcolor="" type="UseFont">
                                                </label>
                                            </TitleBox>
                                            <LegendBox CornerBottomRight="Cut" Orientation="TopRight" Padding="4">
                                                <LabelStyle GlowColor="" Type="UseFont" />
                                                <DefaultEntry ShapeType="None">
                                                    <Background ShadingEffectMode="None" />
                                                    <LabelStyle GlowColor="" Type="UseFont" />
                                                </DefaultEntry>
                                                <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" 
                                                    Visible="False">
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
                                            <label color="Black" glowcolor="" type="UseFont">
                                            </label>
                                        </TitleBox>
                                    </dotnet:Chart>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">&nbsp;
                                    </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                SelectCommand="  ">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" />
                    <asp:Parameter Name="SessionName" />
                    <asp:Parameter Name="TermName" />
                </SelectParameters>
            </asp:SqlDataSource>
          </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
