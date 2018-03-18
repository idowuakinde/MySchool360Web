<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print_student_result_nursery_CA5.aspx.vb" Inherits="modules_data_print_student_result_nursery_CA5" %>

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
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="borderedTable" AutoGenerateColumns="False" 
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
                                                <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:document.getElementById('btnPrint').style.display = 'none';GenerateDynamicPDF('print_student_result_nursery_CA5_pdf.aspx?a=<%= portalNumber %>&c=<%= sessionName %>');" />
                                            </td>
                                        </tr>
                                        <tr class="pageHeaderStyle">
                                            <td align="center" colspan="4" height="40">
                                                <table border="0" width="90%">
                                                    <tr>
                                                        <td align="left" class="pageHeaderStyle" width="45%">
                                                            <strong><u>KEY</u></strong></td>
                                                        <td align="left" class="pageHeaderStyle" rowspan="6" valign="top">
                                                            <asp:Image ID="Image3" runat="server" BorderWidth="2px" Height="120px" 
                                                                ImageUrl="~/images/logos/logo.15.jpg" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="pageHeaderStyle">
                                                            1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Excellent</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="pageHeaderStyle">
                                                            2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Very Good</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="pageHeaderStyle">
                                                            3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Good</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="pageHeaderStyle">
                                                            4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Average</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="pageHeaderStyle">
                                                            5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Below Average</td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:Label ID="lblHeader" runat="server" Text="MID-TERM REPORT FOR STUDENT NO."></asp:Label>&nbsp;<asp:Label ID="lblPortalNumber" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String) %>'></asp:Label>
                                                <br />
                                                <br />&nbsp;
                                                <asp:Label ID="lblTermName" runat="server" 
                                                    Text='<%# termName & " " & sessionName & " Session" %>'></asp:Label>
                                                <br />&nbsp;
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
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <asp:GridView ID="gvDetail" runat="server" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        CssClass="borderedTable" DataSourceID="dsSqlSubjects" 
                                        EmptyDataText="No subject(s) found." EnableModelValidation="True" 
                                        ForeColor="#333333" GridLines="None" PageSize="1" Width="98%" 
                                        OnRowDataBound="gvDetail_RowDataBound" ShowFooter="True" 
                                        DataKeyNames="ScoreId">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerSettings FirstPageText="First" LastPageText="Last" 
                                            Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                                            Position="TopAndBottom" PreviousPageText="Previous" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#FFFBD6" Font-Bold="True" ForeColor="#333333" 
                                            HorizontalAlign="Left" VerticalAlign="Top" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                            VerticalAlign="Top" Height="40px" CssClass="borderedTable" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                            HorizontalAlign="Left" Height="25px" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="SN">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text="<%# innerSerial + 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ID" SortExpression="ScoreId" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtScoreIdEdit" runat="server" Columns="10" 
                                                        CssClass="defaultFormElementStyle" ReadOnly="True" 
                                                        Text='<%# Bind("ScoreId") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScoreId" runat="server" Text='<%# Bind("ScoreId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SUBJECT" SortExpression="SubjectName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSubjectName" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MARK" SortExpression="Score">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" 
                                                        Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "Score"), Double), 0) %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" Width="50px" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="COMMENT(S)" SortExpression="Comment">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtSubjectComment" runat="server" 
                                                        Text='<%# Bind("Comment") %>' Columns="70" CssClass="defaultFormElementStyle" 
                                                        Rows="7" TextMode="MultiLine"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle CssClass="defaultFormElementStyle" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="center" valign="top">
                                    <table align="left" border="0" width="100%">
                                        <tr>
                                            <td align="right" class="pageHeaderStyle" width="30%">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle" width="36%">
                                                &nbsp;</td>
                                            <td align="right" class="pageHeaderStyle" width="10%">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="right" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="pageHeaderStyle">
                                                Class Teacher&#39;s Signature:
                                            </td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;<%= Common.GetReportCardSignature(className)%></td>
                                            <td align="right" class="pageHeaderStyle">
                                            </td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="right" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="right" class="pageHeaderStyle">
                                                &nbsp;</td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="pageHeaderStyle">
                                                Head of School Signature:
                                            </td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;<%= Common.GetRespectiveSchoolHeadSignature(className) %></td>
                                            <td align="right" class="pageHeaderStyle">
                                                Date:
                                            </td>
                                            <td align="left" class="pageHeaderStyle">
                                                &nbsp;<%= Common.GetFriendlyDateShort(Now.Date) %></td>
                                        </tr>
                                    </table>
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
                        SelectCommand="  " 
                        UpdateCommand="STP_EXAMS_DATAENTRY_UPDATE_StudentSubjectComment_BeforeMidTerm" 
                        UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="AssessmentType" />
                <asp:ControlParameter ControlID="gvMaster" DefaultValue="" Name="PortalNumber" PropertyName="SelectedValue" />
                <asp:Parameter Name="SessionName" />
                <asp:Parameter Name="TermName" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ScoreId" Type="Int32" />
                <asp:Parameter Name="Comment" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
