<%@ Page Language="VB" AutoEventWireup="false" CodeFile="summary_branches.aspx.vb" Inherits="modules_reports_school_summary_branches" %>
<%@ Register Assembly="dotnetCHARTING" Namespace="dotnetCHARTING" TagPrefix="dotnet" %>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {font-weight: bold}
-->
</style>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="800"  border="0">
  <tr>
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Branch Analysis for <%=Request.QueryString("a")%></span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td align="right" valign="top">&nbsp;</td>
        <td valign="bottom" class="borderedTable" style="width: 773px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="75%"><dotnet:Chart id="Chart"  runat="server" Height="200px" Width="550px" BorderColor="Black" BorderStyle="None" BorderWidth="1px">
                  <DefaultTitleBox>
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
                    <TitleBox Position="Left">
                      <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                      <HeaderBackground ShadingEffectMode="None" />
                      <Background ShadingEffectMode="None" />
                      <label color="Black" glowcolor="" type="UseFont"> </label>
                    </TitleBox>
                    <LegendBox CornerBottomRight="Cut" Padding="4" Orientation="TopRight">
                      <LabelStyle GlowColor="" Type="UseFont" />
                      <DefaultEntry ShapeType="None">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" />
                      </DefaultEntry>
                      <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" Visible="False">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" Font="Arial, 8pt, style=Bold" />
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
                  <TitleBox Position="Left">
                    <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <label color="Black" glowcolor="" type="UseFont"> </label>
                  </TitleBox>
              </dotnet:Chart></td>
              <td align="right"><dotnet:Chart id="Chart1"  runat="server" Height="200px" Width="190px" BorderColor="Black" BorderStyle="None" BorderWidth="1px" Type="Pies">
                  <DefaultTitleBox>
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
                    <TitleBox Position="Left">
                      <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                      <HeaderBackground ShadingEffectMode="None" />
                      <Background ShadingEffectMode="None" />
                      <label color="Black" glowcolor="" type="UseFont"> </label>
                    </TitleBox>
                    <LegendBox CornerBottomRight="Cut" Padding="4" Orientation="TopRight">
                      <LabelStyle GlowColor="" Type="UseFont" />
                      <DefaultEntry ShapeType="None">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" />
                      </DefaultEntry>
                      <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" Visible="False">
                        <Background ShadingEffectMode="None" />
                        <LabelStyle GlowColor="" Type="UseFont" Font="Arial, 8pt, style=Bold" />
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
                  <TitleBox Position="Left">
                    <HeaderLabel GlowColor="" Type="UseFont"> </HeaderLabel>
                    <HeaderBackground ShadingEffectMode="None" />
                    <Background ShadingEffectMode="None" />
                    <label color="Black" glowcolor="" type="UseFont"> </label>
                  </TitleBox>
                </dotnet:Chart>              </td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2" align="right" class="defaultHeaderTextStyle">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="right" class="defaultHeaderTextStyle"><hr noshade="noshade" /></td>
        </tr>
      
      <tr>
        <td width="2%" align="right" valign="top">&nbsp;</td>
        <td valign="bottom">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Font-Underline="True"></asp:Label>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="right" class="defaultHeaderTextStyle"><hr noshade="noshade" /></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle">
            <asp:GridView ID="gvUsers" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" CssClass="borderedTableGrey"
                DataSourceID="dsSqlBranchSummaries" PageSize="30" Width="100%" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="S/N">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# serialNumber %>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BANK" SortExpression="Bank" FooterText="TOTAL:">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Bank") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bank") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BRANCH" SortExpression="Branch">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Branch") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "details_branch.aspx?a=" & Databinder.Eval(Container.DataItem, "Bank").ToString & "&b=" & Databinder.Eval(Container.DataItem, "Branch").ToString & "&c=" & filterDate_Start & "&d=" & filterDate_End  %>'
                                Text='<%# Eval("Branch").ToString & " (" & Eval("TransactionCount").ToString & " transactions)" %>'></asp:HyperLink>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# FormatNumber(totalTransactionCount,0).ToString & " transactions" %>'></asp:Label>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="REVENUE" SortExpression="Revenue">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Revenue") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Revenue", "N {0:N}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# "N " & FormatNumber(totalBankRevenue,2).ToString %>'></asp:Label>
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" Font-Bold="True" />
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#D0D4DB" />
                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle CssClass="defaultFormElementStyle" />
                <FooterStyle BackColor="Black" BorderColor="WhiteSmoke" BorderStyle="Solid" Font-Bold="True"
                    ForeColor="WhiteSmoke" HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" Font-Size="Small" />
                <HeaderStyle BackColor="Black" BorderColor="WhiteSmoke" BorderStyle="Solid" ForeColor="WhiteSmoke"
                    Wrap="False" />
                <AlternatingRowStyle BackColor="Orange" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsSqlBranchSummaries" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                SelectCommand="SELECT UPPER(NewBankName) AS Bank, BankBranch AS Branch, Count(*) as TransactionCount, SUM(Amount) AS Revenue FROM TEMPOfficeEntries WHERE (NewBankName = @Param1) AND TransactionDate BETWEEN @Param2 AND @Param3 GROUP BY NewBankName, BankBranch ORDER BY Revenue DESC">            
                <SelectParameters>
                    <asp:QueryStringParameter Name="Param1" QueryStringField="a" />
                    <asp:QueryStringParameter Name="Param2" QueryStringField="b" />
                    <asp:QueryStringParameter Name="Param3" QueryStringField="c" />
                </SelectParameters>
            </asp:SqlDataSource>        </td>
      </tr>
      
    </table></td>
  </tr>
</table>
    </form>
</body>
</html>
