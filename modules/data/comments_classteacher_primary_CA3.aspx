<%@ Page Language="VB" AutoEventWireup="false" CodeFile="comments_classteacher_primary_CA3.aspx.vb" Inherits="modules_data_comments_classteacher_primary_CA3" %>

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
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Append Class Teacher Comments (Primary School, BEFORE the Mid-Term)"></asp:Label></td>
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
                                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "ClassName"), String).ToUpper %>'></asp:Label>
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
                                        OnRowDataBound="gvDetail_RowDataBound" ShowFooter="True">
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
                                                    <asp:Label ID="Label1" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "MidTermSubjectScore"), Double), 1).ToString %>'></asp:Label>
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
                                              <td width="30%" align="left"><strong><u>GRADE KEY</u></strong></td>
                                              <td width="30%" rowspan="6" align="left" valign="top">
                                                  <asp:Image ID="Image2" runat="server" BorderWidth="2px" 
                                                      ImageUrl="~/images/logos/logo.15.jpg" />
                                                </td>
                                              <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left">&nbsp;</td>
                                              <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left"><strong>A+</strong>:&nbsp;&nbsp;&nbsp;90% and above</td>
                                              <td align="left"><strong>B</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50 to 59%</td>
                                            </tr>
                                            <tr>
                                              <td align="left"><strong>A</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;80 to 89%</td>
                                              <td align="left"><strong>E</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40 to 49%</td>
                                            </tr>
                                            <tr>
                                              <td align="left"><strong>B</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70 to 79%</td>
                                              <td align="left"><strong>F</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30 to 39%</td>
                                            </tr>
                                            <tr>
                                              <td align="left"><strong>C</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60 to 69%</td>
                                              <td align="left"><strong>G</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Below 30%</td>
                                            </tr>
                                          </table></td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                Physical Education:
                                                <asp:TextBox ID="txtPE" runat="server" Columns="130" 
                                                    CssClass="defaultFormElementStyle" 
                                                    
                                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "Score_PE"), String) %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">Clubs and Extra Curriculars Attended:
                                              <asp:TextBox ID="txtClubs" runat="server" Columns="109" 
                                                  CssClass="defaultFormElementStyle" 
                                                  
                                                  Text='<%# CType(Databinder.Eval(Container.DataItem, "ClubsAndExtras"), String) %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">Number of Days Absent:
                                              <asp:DropDownList ID="ddlDaysAbsent" runat="server" 
                                                  CssClass="defaultFormElementStyle" 
                                                  DataSourceID="dsObjAbsentAndPunctuality" 
                                                  SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "DaysAbsent"), String) %>'>
                                              </asp:DropDownList>
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Punctuality:
                                              <asp:DropDownList ID="ddlPunctuality" runat="server" 
                                                  CssClass="defaultFormElementStyle" 
                                                  SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "Punctuality"), String) %>'>
                                                  <asp:ListItem Value="3">Always punctual</asp:ListItem>
                                                  <asp:ListItem Value="2">Sometimes punctual</asp:ListItem>
                                                  <asp:ListItem Value="1">Never punctual</asp:ListItem>
                                                  <asp:ListItem Value="0">Unspecified</asp:ListItem>
                                              </asp:DropDownList>
                                              &nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td align="left" colspan="3" valign="top">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                Class Teacher&#39;s Comment:</td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3" valign="top">
                                                <asp:TextBox ID="txtComments" runat="server" Columns="150" 
                                                    CssClass="defaultFormElementStyle" Rows="20" TextMode="MultiLine" 
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
