<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mysyllabus_all_1.aspx.vb" Inherits="modules_academics_mysyllabus_all_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    // <!CDATA[

    function TABLE1_onclick() {

    }

    // ]]>
</script>
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="1100"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td width="400"><asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                    Font-Size="Small" Text=""></asp:Label></td>
                            <td align="right"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>
                <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ShortName" DataSourceID="dsSqlSubjects" Width="100%" 
                        EmptyDataText="No subjects to display." 
                        EnableModelValidation="True" ShowHeader="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" BorderWidth="1px" >
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Lesson Notes">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                                Text='<%# (serialSubjects + 1).ToString & ". " & CType(Databinder.Eval(Container.DataItem, "SubjectName"), String).ToUpper %>'></asp:Label>
                            <br />&nbsp;
                            <table width="100%">
                                <tr>
                                    <td width="30">
                                        &nbsp;</td>
                                    <td>
                                        <asp:GridView ID="gvLessonNotes" runat="server" AllowSorting="True" 
                                            AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                                            DataKeyNames="LessonPlanId" DataSourceID="dsSqlSyllabus" 
                                            EmptyDataText="No lesson notes available." EnableModelValidation="True" 
                                            ForeColor="#333333" GridLines="None" OnRowDataBound="gvDetail_RowDataBound" 
                                            Width="100%" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                            <Columns>
                                                <asp:BoundField DataField="LessonPlanId" HeaderText="Id" InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="LessonPlanId" Visible="False" />
                                                <asp:TemplateField HeaderText="SN">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label51" runat="server" Text="<%# serialLessons + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Subject / Class" SortExpression="ShortName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" 
                                                            Text='<%# CType(Databinder.Eval(Container.DataItem, "ShortName"), String) & ", " & CType(Databinder.Eval(Container.DataItem, "ClassName"), String) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="90" />
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="WeekNumber">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" 
                                                            Text='<%# "Week " & CType(Databinder.Eval(Container.DataItem, "WeekNumber"), String) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="50" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="LessonNumber" HeaderText="Lesson" 
                                                    SortExpression="LessonNumber" />
                                                <asp:BoundField DataField="LessonTopic" HeaderText="Topic" 
                                                    SortExpression="LessonTopic" />
                                                <asp:BoundField DataField="LessonObjectives" HeaderText="Objectives" 
                                                    SortExpression="LessonObjectives" />
                                                <asp:BoundField DataField="LessonMethod" HeaderText="Method" 
                                                    SortExpression="LessonMethod" />
                                                <asp:BoundField DataField="LessonHomework" HeaderText="Homework" 
                                                    SortExpression="LessonHomework" />
                                            </Columns>
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                HorizontalAlign="Left" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30">
                                        &nbsp;</td>
                                    <td><hr width="100%" noshade="noshade" color="black" /></td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="dsSqlSyllabus" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                DeleteCommand="STP_SYLLABUS_DELETE_TEMPSyllabusLessonPlan" 
                                DeleteCommandType="StoredProcedure" 
                                InsertCommand="STP_SYLLABUS_INSERT_TEMPSyllabusLessonPlan" 
                                InsertCommandType="StoredProcedure" SelectCommand="  " 
                                UpdateCommand="STP_SYLLABUS_UPDATE_TEMPSyllabusLessonPlan" 
                                UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="" Name="ClassName" />
                                    <asp:Parameter DefaultValue="" Name="SubjectShortName" />
                                    <asp:Parameter DefaultValue="" Name="TermName" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="LessonPlanId" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="LessonPlanId" Type="Int32" />
                                    <asp:Parameter Name="SubjectId" Type="Int32" />
                                    <asp:Parameter Name="WeekNumber" Type="Int32" />
                                    <asp:Parameter Name="LessonPlanDetails" Type="String" />
                                    <asp:Parameter Name="Remark" Type="String" />
                                    <asp:Parameter Name="Remark2" Type="String" />
                                    <asp:Parameter Name="Remark3" Type="String" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="LessonPlanId" Type="Int32" />
                                    <asp:Parameter Name="SubjectId" Type="Int32" />
                                    <asp:Parameter Name="WeekNumber" Type="Int32" />
                                    <asp:Parameter Name="LessonPlanDetails" Type="String" />
                                    <asp:Parameter Name="Remark" Type="String" />
                                    <asp:Parameter Name="Remark2" Type="String" />
                                    <asp:Parameter Name="Remark3" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    </asp:TemplateField>
                </Columns>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                        ForeColor="#333333" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle 
                    HorizontalAlign="Left" BackColor="#990000" Font-Bold="True" 
                        ForeColor="White" />
                <EditRowStyle CssClass="defaultFormElementStyle" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand=" SELECT * FROM dbo.TEMPSubject where ShortName IN (SELECT SubjectShortName FROM dbo.TEMPStudentSubject WHERE PortalNumber = @PortalNumber) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="PortalNumber" QueryStringField="a" />
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
