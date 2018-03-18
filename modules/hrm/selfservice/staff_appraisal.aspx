<%@ Page Language="VB" AutoEventWireup="false" CodeFile="staff_appraisal.aspx.vb" Inherits="modules_selfservice_staff_appraisal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../../inc_functions_js.js" ></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td>
				<table width="800"  border="0" cellspacing="5">
                    <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="75%">
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=""></asp:Label>
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                </tr>
              </table></td>
                    </tr>
                  <tr>
                    <td style="margin-left: 200px" class="borderedTable">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="CustomerCode" 
                            DataSourceID="dsSqlTeacherPerf" DefaultMode="Insert" EmptyDataText="No data." 
                            ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
                            <HeaderTemplate>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="center" rowspan="8" valign="middle" width="200">
                                            <img border="2" height="120" 
                                                src="../../images/ajinomoto_logo.jpg" /></td>
                                        <td align="center" rowspan="8" valign="middle">
                                            APPRAISAL GRADE SCALE</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center" width="150">
                                            &nbsp;</td>
                                        <td align="center" width="130" rowspan="7">
                                            <asp:Image ID="imgPhoto" runat="server" Height="120px" 
                                                
                                                ImageUrl='<%# "~\_uploads\photos\photo_" & Request.QueryString("b").ToString & ".jpg" %>' 
                                                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            5</td>
                                        <td align="center">
                                            EXCELLENT</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            4</td>
                                        <td align="center">
                                            VERY GOOD</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            3</td>
                                        <td align="center">
                                            GOOD</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            2</td>
                                        <td align="center">
                                            FAIR</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            1</td>
                                        <td align="center">
                                            POOR</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <Fields>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="1). RESULT:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Accuracy of Reports.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Punctuality of Reports.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Effectiveness & Efficiency of Working Time.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Communication & Support with other Departments.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Sense of Responsibility for the Work.">
                                    <InsertItemTemplate>
                                        <table width="400px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>EVALUATOR 1</b></td>
                                            <td><b>EVALUATOR 2</b></td>
                                            <td><b>EVALUATOR 3 - FINAL</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    2</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    2</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    4</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    3</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    2</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    2</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    2</td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SUB-TOTAL (1):">
                                    <InsertItemTemplate>
                                        <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>16</b></td>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>16</b></td>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>13</b></td>
                                              </tr>
                                            </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="2). GROWTH AND WORKING ABILITY:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Better understanding of Job Assignment.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Improvement on job & Proposal activity for improvement.">
                                    <InsertItemTemplate>
                                        <table width="400px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>EVALUATOR 1</b></td>
                                            <td><b>EVALUATOR 2</b></td>
                                            <td><b>EVALUATOR 3 - FINAL</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    4</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    4</td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SUB-TOTAL (2):">
                                    <InsertItemTemplate>
                                        <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>10</b></td>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>10</b></td>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>8</b></td>
                                              </tr>
                                            </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="3). ATTITUDE:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Discipline and Politeness.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Motivation & Loyalty to the job.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Honesty.">
                                    <InsertItemTemplate>
                                        <table width="400px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>EVALUATOR 1</b></td>
                                            <td><b>EVALUATOR 2</b></td>
                                            <td><b>EVALUATOR 3 - FINAL</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    4</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    4</td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    4</td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    5</td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SUB-TOTAL (3):">
                                    <InsertItemTemplate>
                                        <table width="100%" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>15</b></td>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>13</b></td>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>14</b></td>
                                              </tr>
                                            </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="4). OTHER FACTORS:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Query.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Warning.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Others.">
                                    <InsertItemTemplate>
                                        <table width="200px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>Frequency x {Points}</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="4" cellspacing="4">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    1&nbsp;x
                                                    <asp:Label ID="lblAppraisalQuery" runat="server" Font-Bold="True" Text="0"></asp:Label> = <b>3</b>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    2&nbsp;x&nbsp;<asp:Label ID="lblAppraisalWarning" runat="server" Font-Bold="True" Text="0"></asp:Label> = <b>4</b>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    3&nbsp;x&nbsp;<asp:Label ID="lblAppraisalOthers" runat="server" Font-Bold="True" Text="0"></asp:Label> = <b>3</b>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SUB-TOTAL (4):">
                                    <InsertItemTemplate>
                                        <table width="200px" border="0" class="borderedTable" cellpadding="4" 
                                                    cellspacing="4" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle" width="33%">
                                                    <b>10</b></td>
                                              </tr>
                                            </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="5). GRAND TOTAL:">
                                    <InsertItemTemplate>
                                        <table width="200px" border="0">
                                          <tr align="center">
                                            <td class="borderedTable" width="50%" valign="middle"><b>Sub-Total<br />1 + 2 + 3</b></td>
                                            <td class="borderedTable" bgcolor="#CCCCCC" valign="middle">
                                                <table border="0">
                                                    <tr>
                                                        <td colspan="2">
                                                            <b>115</b>
                                                        </td>
                                                    </tr>
                                                </table>                                   
                                            </td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td class="borderedTable" width="50%" valign="middle"><b>Sub-Total<br />4</b></td>
                                            <td class="borderedTable" bgcolor="#CCCCCC" valign="middle">
                                                <table border="0">
                                                    <tr>
                                                        <td width="40%">
                                                            <b>-</b>
                                                        </td>
                                                        <td>
                                                            <b>10</b>
                                                        </td>
                                                    </tr>
                                                </table>                                   
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="GRAND TOTAL (1+2+3) - 4:">
                                    <InsertItemTemplate>
                                        <table width="400px" border="0">
                                          <tr align="center" valign="top">
                                            <td class="borderedTable" bgcolor="#CCCCCC" width="50%"><b>105 / 150</b></td>
                                            <td class="borderedTable" bgcolor="#CCCCCC"><b>70%</b></td>
                                          </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="6). COMMENTS:">
                                    <InsertItemTemplate>
                                        <table width="400px" border="0" class="borderedTable">
                                          <tr valign="top">
                                            <td height="50px">
                                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;
                                              </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="7). PROMOTED?">
                                    <InsertItemTemplate>
                                        <table width="400px" border="0" class="borderedTable" bgcolor="#CCCCCC">
                                          <tr valign="top">
                                            <td>
                                                &nbsp;<font color="black"><b>YES</b></font></td>
                                      </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                            </Fields>
                            <FieldHeaderStyle Font-Bold="True" Width="400px" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
                            <EditRowStyle Wrap="True" />
                            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
                            <FooterStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="28px" 
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True" />
                            <RowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="dsSqlTeacherPerf" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [StaffGUID], [StaffId], [StaffCode], UPPER([Surname]) AS Surname, UPPER([OtherNames]) AS OtherNames FROM [HR_Staff_Base] ORDER BY [Surname], [OtherNames]">
                        </asp:SqlDataSource>
                      </td>
                  </tr>
                  </table>
                    </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
