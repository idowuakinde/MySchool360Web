﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print_student_result_primary_CA3.aspx.vb" Inherits="modules_data_print_student_result_primary_CA3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="880">
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="PortalNumber" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="880px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." 
                        AllowPaging="True" PageSize="1" SelectedIndex="0" ShowHeader="False" 
                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table border="0" width="100%">
                            <tr>
                                <td height="50">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="right" colspan="4">
                                                <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:document.getElementById('btnPrint').style.display = 'none';GenerateDynamicPDF('print_student_result_primary_CA3_pdf.aspx?a=<%= portalNumber %>&c=<%= sessionName %>');" />
                                            </td>
                                        </tr>
                                        <tr class="pageHeaderStyle">
                                            <td align="center" colspan="4" height="40">
                                                <asp:Image ID="Image1" runat="server" BorderWidth="2px" 
                                                    ImageUrl="~/images/logos/logo.15.jpg" />
                                                <br />
                                                <asp:Label ID="lblHeader" runat="server" Text="MID-TERM REPORT FOR STUDENT NO."></asp:Label>&nbsp;<asp:Label ID="lblPortalNumber" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String) %>'></asp:Label>,
                                                <asp:Label ID="lblTermName" runat="server" 
                                                    Text='<%# termName & " " & sessionName & " Session" %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="pageHeaderStyle">
                                            <td align="right" width="150">
                                                NAME:&nbsp;&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lblStudentName" runat="server" 
                                                    Text='<%# "<b>" & Databinder.Eval(Container.DataItem, "LastName").ToString.ToUpper & "</b> " & Databinder.Eval(Container.DataItem, "FirstName").ToString %>'></asp:Label>
                                            </td>
                                            <td align="right" width="50">
                                                CLASS:&nbsp;&nbsp;</td>
                                            <td width="200">
                                                <asp:Label ID="lblStudentClass" runat="server" 
                                                    Text='<%# className.ToUpper %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <asp:GridView ID="gvDetail" runat="server" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        CssClass="noBorderedMenuTable" DataSourceID="dsSqlSubjects" 
                                        EmptyDataText="No subject(s) found." EnableModelValidation="True" 
                                        ForeColor="#333333" GridLines="None" PageSize="1" Width="98%" 
                                        OnRowDataBound="gvDetail_RowDataBound" ShowFooter="True" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerSettings FirstPageText="First" LastPageText="Last" 
                                            Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                                            Position="TopAndBottom" PreviousPageText="Previous" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />

                                        <SelectedRowStyle BackColor="#FFFBD6" Font-Bold="True" ForeColor="#333333" 
                                            HorizontalAlign="Left" VerticalAlign="Top" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                            VerticalAlign="Top" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                            HorizontalAlign="Left" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="SN">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text="<%# innerSerial + 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SubjectName" HeaderText="SUBJECT" 
                                                SortExpression="SubjectName" FooterText="PUPIL'S AVERAGE:" >
                                            <FooterStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="%" SortExpression="MidTermSubjectScore">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "MidTermSubjectScore"), Double), 1) %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                                                        Text="<%# FormatNumber(innerTotal / innerSerial, 1) %>"></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" Width="200px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle CssClass="defaultFormElementStyle" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" valign="top">&nbsp;
                                                </td>
                                            <td align="left" valign="top">&nbsp;
                                                </td>
                                            <td align="left" valign="top">&nbsp;
                                                </td>
                                        </tr>
                                        <tr>
                                          <td align="center" colspan="3" valign="top"><table width="90%" border="0">
                                            <tr>
                                              <td width="30%" align="left" class="pageHeaderStyle"><strong><u>GRADE KEY</u></strong></td>
                                              <td width="30%" rowspan="5" align="left" valign="top" class="pageHeaderStyle">
                                                  <asp:Image ID="Image2" runat="server" BorderWidth="2px" 
                                                      ImageUrl="~/images/logos/logo.15.jpg" Height="97px" Width="88px" />
                                                </td>
                                              <td class="pageHeaderStyle">&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" class="pageHeaderStyle"><strong>A+</strong>:&nbsp;&nbsp;&nbsp;90% and above</td>
                                              <td align="left" class="pageHeaderStyle">D:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50 to 59%</td>
                                            </tr>
                                              <tr>
                                                  <td align="left" class="pageHeaderStyle">
                                                      <strong>A</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;80 to 89%</td>
                                                  <td align="left" class="pageHeaderStyle">
                                                      <strong>E</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40 to 49%</td>
                                              </tr>
                                            <tr>
                                              <td align="left" class="pageHeaderStyle"><strong>B</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70 to 79%</td>
                                              <td align="left" class="pageHeaderStyle"><strong>F</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30 to 39%</td>
                                            </tr>
                                            <tr>
                                              <td align="left" class="pageHeaderStyle"><strong>C</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60 to 69%</td>
                                              <td align="left" class="pageHeaderStyle"><strong>G</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Below 30%</td>
                                            </tr>
                                          </table></td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top" class="pageHeaderStyle">
                                                Physical Education:
                                                <asp:Label ID="Label5" runat="server" 
                                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "Score_PE"), String) %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top" class="pageHeaderStyle">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top" class="pageHeaderStyle">Clubs and Extra Curriculars Attended:
                                              <asp:Label ID="Label6" runat="server" 
                                                  Text='<%# CType(Databinder.Eval(Container.DataItem, "ClubsAndExtras"), String) %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top" class="pageHeaderStyle">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top" class="pageHeaderStyle">Number of Days 
                                              Absent:
                                              <asp:Label ID="Label7" runat="server" 
                                                  Text='<%# CType(Databinder.Eval(Container.DataItem, "DaysAbsent"), String) %>'></asp:Label>
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Punctuality:
                                              <asp:Label ID="Label8" runat="server" 
                                                  Text='<%# CType(Databinder.Eval(Container.DataItem, "Punctuality"), String) %>'></asp:Label>
                                              &nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top" class="pageHeaderStyle">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top" class="pageHeaderStyle">
                                                Class Teacher&#39;s Comment:</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top" class="borderedTable pageHeaderStyle">
                                                <asp:Label ID="lblClassTeacherComments" runat="server" 
                                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "ClassTeacherComment"), String) %>'></asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                Class teacher&#39;s Signature: <%= Common.GetReportCardSignature(className) %>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                <table align="left" border="0" width="100%">
                                                    <tr>
                                                        <td align="right" class="pageHeaderStyle" width="50%">
                                                            Head Teacher&#39;s Signature:
                                                        </td>
                                                        <td align="left" class="pageHeaderStyle">
                                                        <%= Common.GetRespectiveSchoolHeadSignature(className) %>&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                    </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="First" LastPageText="Last" 
                Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                Position="TopAndBottom" PreviousPageText="Previous" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFFBD6" Font-Bold="True" ForeColor="#333333" 
                HorizontalAlign="Left" VerticalAlign="Top" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        SelectCommand="  ">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="ClassName" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsSqlSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        SelectCommand="  ">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="AssessmentType" />
                <asp:ControlParameter ControlID="gvMaster" DefaultValue="" Name="PortalNumber" PropertyName="SelectedValue" />
                <asp:Parameter Name="SessionName" />
                <asp:Parameter Name="TermName" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjAbsentAndPunctuality" runat="server" 
                            SelectMethod="GetIntegerSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="minimum" Type="Int32" />
                            <asp:Parameter DefaultValue="100" Name="maximum" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
