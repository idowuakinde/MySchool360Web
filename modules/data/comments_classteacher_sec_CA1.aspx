﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="comments_classteacher_sec_CA1.aspx.vb" Inherits="modules_data_comments_classteacher_sec_CA1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    <style type="text/css">
        .style17
        {
            width: 100%;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="880">
            <tr>
                <td>
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Append Class Teacher Comments (Secondary School, BEFORE the Mid-Term)"></asp:Label></td>
            </tr>
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="PortalNumber" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="880px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." 
                        AllowPaging="True" PageSize="1" SelectedIndex="0" >
            <Columns>
                <asp:TemplateField HeaderText="Please enter your comments using the boxes provided below. &lt;br /&gt;Remember to click 'Save' before clicking 'Next'!">
                    <ItemTemplate>
                        <table border="0" width="100%">
                            <tr>
                                <td height="50">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr class="pageHeaderStyle">
                                            <td align="center" colspan="4">
                                                <asp:Label ID="lblPagePosition" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="pageHeaderStyle">
                                            <td align="center" colspan="4" height="40">
                                                <asp:Image ID="Image1" runat="server" BorderWidth="2px" 
                                                    ImageUrl="~/images/logos/logo.15.jpg" Height="50px" Width="50px" />
                                                <br />
                                                <asp:Label ID="lblHeader0" runat="server" 
                                                    Text="THE CHILDVILLE SENIOR REPORT"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblHeader" runat="server" Text="MID-TERM REPORT FOR STUDENT NO."></asp:Label>&nbsp;<asp:Label ID="lblPortalNumber" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String) %>'></asp:Label>,
                                                <asp:Label ID="lblTermName" runat="server" 
                                                    Text='<%# termName & " " & sessionName & " Session" %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr class="pageHeaderStyle">
                                            <td align="right" width="150">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td align="right" width="50">
                                                &nbsp;</td>
                                            <td width="200">
                                                &nbsp;</td>
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
                                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "ClassName"), String).ToUpper %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <asp:GridView ID="gvDetail" runat="server" AllowSorting="True" 
                                        AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                                        DataSourceID="dsSqlSubjects" EmptyDataText="No subject(s) found." 
                                        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                        OnRowDataBound="gvDetail_RowDataBound" PageSize="1" Width="98%">
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
                                                    <br />
                                                    <asp:Label ID="Label3" runat="server" Text="<%# innerSerial + 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SUBJECT" SortExpression="SubjectName">
                                                <ItemTemplate>
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" 
                                                        Text='<%# CTYpe(Databinder.Eval(Container.DataItem, "SubjectName"), String).ToUpper %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle Font-Bold="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BREAKDOWN">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MARK">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RESULT">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <br />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TEACHER'S COMMENT">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                                <ItemStyle Width="220px" />
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
                                          <td align="left" colspan="3" valign="top" class="pageHeaderStyle">
                                              <strong>Grade Thresholds</strong></td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" valign="top">
                                                <table align="center" border="1" class="style17">
                                                    <tr>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>Grade</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>A*</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>A</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>B+</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>B</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>C+</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>C</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>D</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>E</b></td>
                                                        <td align="center" class="pageHeaderStyle">
                                                            <b>F</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            <b>
                                                            <br />
                                                            Threshold</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />100 - 90</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />89 - 85</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />84 - 80</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />79 - 75</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />74 - 70</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />69 - 65</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />64 - 60</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle">
                                                            %<b><br />59 - 50</b></td>
                                                        <td align="center" class="pageHeaderStyle">
                                                            %<b><br />49 - 0</b></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="center" colspan="3" valign="top"><span style='width: 90%'><i>Grade 
                                              Description: A* = Excellent; A = Very Good; B+ = Good; B = Good; C+ = 
                                              Satisfactory; C = Satisfactory; D = Unsatisfactory; E = Unsatisfactory;
                                              <br />
                                              F = Poor.</span></i></td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top" class="pageHeaderStyle">
                                                <strong>Analysis of Results</strong></td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" valign="top">
                                                <table align="center" border="1" class="style17">
                                                    <tr>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>Grade</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>A*</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>A</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>B+</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>B</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>C+</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>C</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>D</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>E</b></td>
                                                        <td align="center" class="pageHeaderStyle"><b>F</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><b>No. Obtained</b></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countAstar %></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countA%></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countBplus%></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countB%></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countCplus%></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countC %></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countD%></td>
                                                        <td align="center" width="10%" class="pageHeaderStyle"><%= countE%></td>
                                                        <td align="center" class="pageHeaderStyle"><%= countF %></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" valign="top" class="pageHeaderStyle">
                                                <b>STUDENT&#39;S AVERAGE SCORE:
                                                <asp:Label ID="Label6" runat="server" Text='<%# FormatNumber(Common.GetStudentsPersonalAverage(CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String), className, sessionName, TermName, assessmentType), 1) %>'></asp:Label>
                                                </b></td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="pageHeaderStyle" colspan="3" valign="top">
                                                <b>CLASS AVERAGE SCORE:
                                                <asp:Label ID="lblClassAverage" runat="server" 
                                                    Text="<%# FormatNumber(Common.GetClassAverage(className, sessionName, TermName, assessmentType), 1) %>"></asp:Label>
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top" class="pageHeaderStyle">
                                                <strong>YEAR CO-ORDINATOR&#39;S COMMENT:</strong></td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                <asp:TextBox ID="txtComments" runat="server" Columns="162" 
                                                    CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine" 
                                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "ClassTeacherComment"), String) %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" valign="top">
                                                <strong>IMPORTANT NOTICE</strong>: You must click the &quot;Save Comments&quot; button below 
                                                to save your changes before moving to the next student in this class.</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" valign="top">&nbsp;
                                                </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" valign="top">
                                                <asp:Button ID="btnSaveScores" runat="server" 
                                                    CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                                    CommandName="Select" CssClass="defaultButtonStyle" 
                                                    Text="      Save Comments &gt;      " />
                                                &nbsp;<input id="Reset2" class="defaultButtonStyle" type="reset" 
                                            value="   Clear   " /> &nbsp;</td>
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
