<%@ Page Language="VB" strict="false" AutoEventWireup="false" CodeFile="frameset_main_admin.aspx.vb" Inherits="frameset_main_admin" %>
<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
    </style>

<script language="JavaScript">
<!--

//Top Nav Bar I v2.1- By Constantin Kuznetsov Jr.
//Modified by Dynamic Drive for various improvements
//Visit http://www.dynamicdrive.com for this script

var keepstatic=1 //specify whether menu should stay static (works only in IE4+)
var menucolor="#BEC9DB" //specify menu color
var submenuwidth=200 //specify sub menus' width

var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = open(URLStr, 'popUpWin', 'toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbar=yes,resizable=yes,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
//-->
</script>
<link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<script language="JavaScript" src="../../menu.js"></script>
<script language="JavaScript" src="../../menucontext.js"></script>
<script language="JavaScript">
//showToolbar();
</script>
<script language="JavaScript">
function UpdateIt(){
if (ie&&keepstatic&&!opr6)
document.all["MainTable"].style.top = document.body.scrollTop;
setTimeout("UpdateIt()", 200);
}
UpdateIt();
</script>

    <table width="100%"  border="0">
  
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA">&nbsp;:: Welcome to HR360<sup>o</sup> - 
        World-Class Human Resource Management with in-Built Payroll Administration and 
        Business Intelligence Capabilities.</span></td>
  </tr>
  
  <tr>
    <td valign="top"><table width="100%"  border="0">
      <tr>
        <td width="307" align="left" valign="top">
            <table width="268"  border="0" cellpadding="0" cellspacing="0" class="borderedTable">
                <tr>
                  <td colspan="2" valign="top">
                      <img src="../../images/logos/logo.15.jpg" style="height: 321px" /> </td>
                </tr>
              </table>
                  <asp:SqlDataSource ID="dsSqlBirthdays" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                SelectCommand=" SELECT UserId as AnnouncementId, UserCode as StaffGUID, Username as StaffCode, DateOfBirth as DatePublished, RTRIM(LTRIM(IsNull(FirstName,'') + ' ' + IsNull(MiddleName,'') + ' ' + UPPER(IsNull(SurName,'')))) AS Message from dbo.Core_User WHERE MONTH(DateOfBirth) = MONTH(GETDATE()) ORDER BY DAY(DateOfBirth) "> </asp:SqlDataSource>
                  <asp:SqlDataSource ID="dsSqlLeaveApplicants" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                SelectCommand=" SELECT UserId as AnnouncementId, UserCode as StaffGUID, Username as StaffCode, DateOfBirth as DatePublished, RTRIM(LTRIM(IsNull(FirstName,'') + ' ' + IsNull(MiddleName,'') + ' ' + UPPER(IsNull(SurName,'')))) AS Message from dbo.Core_User WHERE MONTH(DateOfBirth) = MONTH(GETDATE()) + 1 ORDER BY DAY(DateOfBirth) "> </asp:SqlDataSource>
              </td>
        <td width="1000" rowspan="2" valign="top">
        <table width="100%" border="0">
          <tr>
            <td align="left" valign="top" class="borderedTableGrey"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <% If Request.QueryString("b") = "1" Or Request.QueryString("b") = "18" Or Request.QueryString("b") = "27" Or Request.QueryString("b") = "28" Or Request.QueryString("b") = "30" Then%>
              <tr>
                <td>
                  <dotnet:Chart ID="Chart1" runat="server" BorderColor="Black" BorderStyle="None"
                    BorderWidth="1px" Height="200px" ShadingEffectMode="Three" 
                	Width="750px">
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
                    <ChartArea CornerTopLeft="Square" StartDateOfYear="" 
                    Title="">
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
                        <label color="Black" glowcolor="" type="UseFont" 
                      text="" font="Arial, 8pt, style=Bold"> </label>
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
                      <label color="Black" glowcolor="" type="UseFont" 
                    text="" font="Arial, 8pt, style=Bold"> </label>
                      </TitleBox>
                  </dotnet:Chart></td>
                </tr>
              <% End if %>
            </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25"><span class="defaultHeaderTextStyle" style="color:#FD0100">Birthdays in <%=MonthName(Month(Now), False).ToUpper%></span></td>
                <td><span class="defaultHeaderTextStyle" style="color:#FD0100">Leave Roster for <%=MonthName(Month(Now), False).ToUpper%>*</span></td>
              </tr>
              <tr>
                <td width="375" valign="top">
                  <asp:GridView ID="gvBirthdays" runat="server" DataSourceID="dsSqlBirthdays" 
                      AutoGenerateColumns="False" CssClass="defaultFormElementStyle" 
                      DataKeyNames="AnnouncementId" Width="370px" 
                      CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No birthdays to display.&lt;br /&gt;&amp;nbsp;" 
                        PageSize="4">
                    <RowStyle ForeColor="#333333" BackColor="#FFFBD6" />
                    <columns>
                      <asp:TemplateField HeaderText="S/N" InsertVisible="False" 
                          SortExpression="AnnouncementId">
                        <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                          </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Right" />
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Staff Name" SortExpression="Message">
                        <itemtemplate>
                          <a href="<%# "javascript:window.open('hr/photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "StaffCode").ToString & "','Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Label ID="Label4" runat="server" Text='<%# Left(DataBinder.Eval(Container.DataItem, "Message"),50) %>'></asp:Label>
                            </a>
                          </itemtemplate>
                        <headerstyle HorizontalAlign="Left" />                
                        <itemstyle VerticalAlign="Top" Width="75%" />                
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Birthday" SortExpression="DatePublished">
                        <edititemtemplate>
                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DatePublished") %>'></asp:TextBox>
                          </edititemtemplate>
                        <itemtemplate>
                          <asp:Label ID="Label3" runat="server" Text='<%# Common.GetSpecialDateFormatShort(CType(DataBinder.Eval(Container.DataItem, "DatePublished"), datetime)) %>'></asp:Label>
                          </itemtemplate>
                        <headerstyle HorizontalAlign="Left" />                
                        <itemstyle VerticalAlign="Top" Width="50%" />                
                        </asp:TemplateField>
                      </columns>
                    <footerstyle BackColor="#990000" ForeColor="White" Font-Bold="True" />                
                    <pagerstyle ForeColor="#333333" 
                        HorizontalAlign="Center" BackColor="#FFCC66" />                
                    <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
                    <headerstyle BackColor="#990000" Font-Bold="True" ForeColor="White" />                
                    <AlternatingRowStyle BackColor="White" />
                  </asp:GridView></td>
                <td valign="top">
                  <asp:GridView ID="gvUpcomingLeaves" runat="server" DataSourceID="dsSqlLeaveApplicants" 
                      AutoGenerateColumns="False" CssClass="defaultFormElementStyle" 
                      DataKeyNames="AnnouncementId" Width="370px" 
                      CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No leave schedules to display.&lt;br /&gt;&amp;nbsp;" 
                        PageSize="4">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <columns>
                      <asp:TemplateField HeaderText="S/N" InsertVisible="False" 
                          SortExpression="AnnouncementId">
                        <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# serial3 + 1 %>'></asp:Label>
                          </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Right" />
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Staff Name" SortExpression="Message">
                        <edititemtemplate>
                          <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                          </edititemtemplate>
                        <itemtemplate>
                          <a href="<%# "javascript:window.open('hr/photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "StaffCode").ToString & "','Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Label ID="Label6" runat="server" Text='<%# Left(DataBinder.Eval(Container.DataItem, "Message"),50) %>'></asp:Label>
                            </a>
                          </itemtemplate>
                        <headerstyle HorizontalAlign="Left" />                
                        <itemstyle VerticalAlign="Top" Width="75%" />                
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Starting" SortExpression="DatePublished">
                        <edititemtemplate>
                          <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DatePublished") %>'></asp:TextBox>
                          </edititemtemplate>
                        <itemtemplate>
                          <asp:Label ID="Label5" runat="server" 
                                  Text='<%# Common.GetSpecialDateFormatShort(CType(DataBinder.Eval(Container.DataItem, "DatePublished"), datetime)) %>'></asp:Label>
                          </itemtemplate>
                        <headerstyle HorizontalAlign="Left" />                
                        <itemstyle VerticalAlign="Top" Width="50%" />                
                        </asp:TemplateField>
                      </columns>
                    <footerstyle BackColor="#990000" Font-Bold="True" ForeColor="White" />                
                    <pagerstyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />                
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <headerstyle BackColor="#990000" Font-Bold="True" ForeColor="White" />                
                    <AlternatingRowStyle BackColor="White" />
                  </asp:GridView></td>
              </tr>
            </table></td>
          </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
    </form>
</body>
</html>
