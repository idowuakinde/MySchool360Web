<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mysyllabus.aspx.vb" Inherits="modules_academics_mysyllabus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../inc_functions_js.js" ></script>
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <table width="800" cellpadding="0" cellspacing="0">
        <tr>
            <td>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: LESSON NOTES"></asp:Label></td>
                            <td width="40%" align="right" valign="middle">
                                &nbsp;
                                <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage();" />
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" CssClass="noBorderedMenuTable" 
                            DataKeyNames="ShortName" DataSourceID="dsSqlSubjects" 
                            ForeColor="#333333" GridLines="None" Width="1200px" AllowSorting="True" 
                            EnableModelValidation="True" 
                    EmptyDataText="No record(s) available.">
                    <Columns>
                        <asp:TemplateField HeaderText="SN">
                            <ItemTemplate>
                                <asp:Label ID="Label52" runat="server" Text='<%# serialSubjects + 1 %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SUBJECT" SortExpression="SubjectName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label> / <asp:Label ID="Label4" runat="server" Text='<%# studentClass %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LESSON NOTES">
                            <ItemTemplate>
                                <asp:GridView ID="gvDetail" runat="server" AllowSorting="True" 
                                    AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                                    DataKeyNames="LessonPlanId" DataSourceID="dsSqlSyllabus" 
                                    EmptyDataText="No lesson notes available." EnableModelValidation="True" 
                                    ForeColor="#333333" GridLines="None" Width="1000px" 
                                    OnRowDataBound="gvDetail_RowDataBound">
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
                                <asp:SqlDataSource ID="dsSqlSyllabus" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                    DeleteCommand="STP_SYLLABUS_DELETE_TEMPSyllabusLessonPlan" 
                                    DeleteCommandType="StoredProcedure" 
                                    InsertCommand="STP_SYLLABUS_INSERT_TEMPSyllabusLessonPlan" 
                                    InsertCommandType="StoredProcedure" SelectCommand="  " 
                                    UpdateCommand="STP_SYLLABUS_UPDATE_TEMPSyllabusLessonPlan" 
                                    UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ClassName" QueryStringField="b" />
                                        <asp:ControlParameter ControlID="gvSubjects" Name="SubjectShortName" 
                                            PropertyName="DataKeyNames(0)" />
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
                                        <%--                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
--%>
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
                        </asp:TemplateField>
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
                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_SYLLABUS_DELETE_TEMPSyllabusLessonPlan" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_SYLLABUS_INSERT_TEMPSyllabusLessonPlan" InsertCommandType="StoredProcedure"
                        SelectCommand=" SELECT * FROM dbo.TEMPSubject where ShortName IN (SELECT SubjectShortName FROM dbo.TEMPStudentSubject WHERE PortalNumber = @PortalNumber) "
                        UpdateCommand="STP_SYLLABUS_UPDATE_TEMPSyllabusLessonPlan" 
                    UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="PortalNumber" QueryStringField="a" />
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
<%--                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
--%>                        
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
                </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
            </td>
        </tr>
    </table>
    </form>
    </body>
</html>
