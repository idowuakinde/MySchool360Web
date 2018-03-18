<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pastoral_care_report.aspx.vb" Inherits="modules_academics_pastoral_care_report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: PASTORAL CARE REPORT CARD (STUDENT/PARENT'S VIEW)"></asp:Label></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" 
                    CssClass="noBorderedMenuTable" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="800px" 
                    DataSourceID="dsSqlPastoralCare" DataKeyNames="CustomerCode" 
                    EmptyDataText="No data.">
            <HeaderTemplate>
                    <table cellpadding="2" cellspacing="2" width="100%" border="0">
                      <tr bgcolor="#640000">
                        <td align="center" colspan="6">GUIDE TO UNDERSTANDING THE SCORES ON THE PASTORAL CARE REPORT&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="150" rowspan="6" align="center" valign="middle">
                            <img src="../../images/logos/logo.15.jpg" height="120" border="2" /></td>
                        <td rowspan="6" align="center" valign="middle">PASTORAL CARE SCALE</td>
                        <td align="center">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="center"><strong><u>LEVELS</u></strong></td>
                        <td width="150" rowspan="6" align="center"><a>
                            <asp:Image ID="imgPhoto" runat="server" BorderStyle="Solid" BorderWidth="2px" 
                                EnableViewState="False" Height="120px" Imageurl="" 
                                ToolTip="Passport Photograph..." />
                            </a></td>
                      </tr>
                      <tr>
                        <td align="center">5</td>
                        <td align="center">EXCELLENT</td>
                        <td align="center">ONLY STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">4</td>
                        <td align="center">VERY GOOD</td>
                        <td align="center">MAJOR STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">3</td>
                        <td align="center">GOOD</td>
                        <td align="center">STRENGTHS OUTWEIGH WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">2</td>
                        <td align="center">FAIR</td>
                        <td align="center">SOME IMPORTANT WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">1</td>
                        <td align="center">WEAK</td>
                        <td align="center">MAJOR WEAKNESSES</td>
                      </tr>
                    </table>
            </HeaderTemplate>
            <FooterTemplate>
                    <table cellpadding="2" cellspacing="2" width="100%" border="0">
                      <tr bgcolor="#640000">
                        <td align="center" colspan="6">GUIDE TO UNDERSTANDING THE SCORES ON THE PASTORAL CARE REPORT&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="150" rowspan="6" align="center" valign="middle">
                            <img src="../../images/logos/logo.15.jpg" height="120" border="2" /></td>
                        <td rowspan="6" align="center" valign="middle">PASTORAL CARE SCALE</td>
                        <td align="center">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="center"><strong><u>LEVELS</u></strong></td>
                        <td width="150" rowspan="6" align="center"><a>
                            <asp:Image ID="imgPhotoFooter" runat="server" BorderStyle="Solid" 
                                BorderWidth="2px" EnableViewState="False" Height="120px" Imageurl="" 
                                ToolTip="Passport Photograph..." />
                            </a></td>
                      </tr>
                      <tr>
                        <td align="center">5</td>
                        <td align="center">EXCELLENT</td>
                        <td align="center">ONLY STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">4</td>
                        <td align="center">VERY GOOD</td>
                        <td align="center">MAJOR STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">3</td>
                        <td align="center">GOOD</td>
                        <td align="center">STRENGTHS OUTWEIGH WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">2</td>
                        <td align="center">FAIR</td>
                        <td align="center">SOME IMPORTANT WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">1</td>
                        <td align="center">WEAK</td>
                        <td align="center">MAJOR WEAKNESSES</td>
                      </tr>
                    </table>
            </FooterTemplate>
            <Fields>
                <asp:TemplateField HeaderText="NAME OF STUDENT:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("CustomerName") %>' 
                            Font-Bold="True"></asp:Label>
                        &nbsp;(<asp:Label ID="Label12" runat="server" Font-Bold="True" 
                            Text='<%# Eval("CustomerCode") %>'></asp:Label>)
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CLASS:">
                    <ItemTemplate>
                        <asp:Label ID="Label111" runat="server" Text='<%# Eval("DistrictCode") %>' Font-Bold="True"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="STUDENT'S PHOTOGRAPH (CLICK TO ZOOM):">
                    <ItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "CustomerCode").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Image ID="imgThumbnail" runat="server" Height="30px" ToolTip="Click to enlarge." 
                            ImageUrl='<%# "..\..\images\pp\" & Databinder.Eval(Container.DataItem, "CustomerCode").ToString & ".jpg" %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                        </a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OVERALL AVERAGE (PASTORAL CARE):">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("AverageAll") %>' Font-Bold="True"></asp:Label><b> out of 5</b>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="1). SOCIAL BEHAVIOUR &gt;">
                    <ItemTemplate>
                        <asp:Label ID="Label29" runat="server" Font-Bold="True" Text='<%# "AVERAGE: " & Databinder.Eval(Container.DataItem, "Average1").ToString %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Pupil Interaction with Peers / Teachers / Visitors">
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("1a") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Courtesy/Respect and Tolerance of Others">
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("1b") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Ability to Work Collaboratively / Trustworthiness">
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("1c") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). General Standard of Behaviour in the School">
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("1d") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Respect for School Property">
                    <ItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("1e") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2). MOTIVATION AND PERSONAL COMMITMENT TO LEARNING &gt;">
                    <ItemTemplate>
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" 
                            Text='<%# "AVERAGE: " & Databinder.Eval(Container.DataItem, "Average2").ToString %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Development of Personal Responsibility for Learning">
                    <ItemTemplate>
                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("2a") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Pupil's Willingness to apply him/herself to task at hand">
                    <ItemTemplate>
                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("2b") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Response of Pupil to Challenging Tasks">
                    <ItemTemplate>
                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("2c") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Capacity of Pupil to Persevere and Complete Tasks When Difficulty Arises">
                    <ItemTemplate>
                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("2d") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Desire of Pupil to Improve his/her Work / Pride in Finished Product">
                    <ItemTemplate>
                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("2e") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f). Readiness to Ask and Answer Questions / Join in Discussions">
                    <ItemTemplate>
                        <asp:Label ID="Label23" runat="server" Text='<%# Eval("2f") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g). Concentration in Listening to the Teacher">
                    <ItemTemplate>
                        <asp:Label ID="Label24" runat="server" Text='<%# Eval("2g") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3). PUPIL CONTRIBUTION TO THE LIFE OF THE SCHOOL &gt;">
                    <ItemTemplate>
                        <asp:Label ID="Label31" runat="server" Font-Bold="True" 
                            Text='<%# "AVERAGE: " & Databinder.Eval(Container.DataItem, "Average3").ToString %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Pupil Participation in Co-Curricular Activities">
                    <ItemTemplate>
                        <asp:Label ID="Label25" runat="server" Text='<%# Eval("3a") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Involvement of Pupil in Other Social / Cultural Activities">
                    <ItemTemplate>
                        <asp:Label ID="Label26" runat="server" Text='<%# Eval("3b") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Sense of Intitiative and Willingness to Take Responsibility">
                    <ItemTemplate>
                        <asp:Label ID="Label27" runat="server" Text='<%# Eval("3c") %>'></asp:Label> out of 5
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4). ATTENDANCE AND PUNCTUALITY &gt;">
                    <ItemTemplate>
                        <asp:Label ID="Label32" runat="server" Font-Bold="True" 
                            Text='<%# "AVERAGE: " & Databinder.Eval(Container.DataItem, "Average3").ToString %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Level of Attendance Recorded">
                    <ItemTemplate>
                        <asp:Label ID="Label28" runat="server" Text='<%# Eval("4a") %>'></asp:Label>% (<asp:Label 
                            ID="Label1" runat="server" Text='<%# Eval("Average4") %>' Font-Bold="True"></asp:Label> out of 5)
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
            </Fields>
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="500px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <EditRowStyle Wrap="True" />
            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Middle" 
                BackColor="#FFFBD6" ForeColor="#333333" Height="28px" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="dsSqlPastoralCare" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand=" SELECT UPPER(DistrictCode) AS DistrictCode, [CustomerCode], UPPER(CustomerName) AS CustomerName, b.*, ([1a] + [1b] + [1c] + [1d] + [1e])/5 AS Average1, ([2a] + [2b] + [2c] + [2d] + [2e] + [2f] + [2g])/7 AS Average2, ([3a] + [3b] + [3c])/3 AS Average3, ([4a]/20) AS Average4, ([1a] + [1b] + [1c] + [1d] + [1e] + [2a] + [2b] + [2c] + [2d] + [2e] + [2f] + [2g] + [3a] + [3b] + [3c] + ([4a]/20))/16 AS AverageAll FROM [TEMPcustomers] a INNER JOIN dbo.TEMPScoreSheet_Pastoral b ON a.CustomerCode = b.MatricNumber WHERE (CustomerCode = @CustomerCode) ORDER BY [CustomerName]  ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CustomerCode" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
