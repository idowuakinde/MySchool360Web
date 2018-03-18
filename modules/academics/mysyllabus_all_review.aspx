<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mysyllabus_all_review.aspx.vb" Inherits="modules_academics_mysyllabus_all_review" %>

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
                            <td width="800"><asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                    Font-Size="Small"></asp:Label></td>
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
                                            DataKeyNames="LessonNoteId" DataSourceID="dsSqlSyllabus" 
                                            EmptyDataText="No lesson notes available." EnableModelValidation="True" 
                                            ForeColor="#333333" GridLines="None" OnRowDataBound="gvDetail_RowDataBound" 
                                            Width="100%" OnRowDeleted="gvDetail_RowDeleted" 
                                            OnRowEditing="gvDetail_RowEditing" BorderColor="Black" BorderStyle="Solid" 
                                            BorderWidth="1px">
                                            <Columns>
                                                <asp:TemplateField Visible="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="hlnkEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="hlnkUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                                                        <asp:LinkButton ID="hlnkCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SN">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label51" runat="server" Text="<%# serialLessons + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Id" SortExpression="LessonNoteId" InsertVisible="False">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtLessonNoteId" runat="server" Columns="3" 
                                                            CssClass="defaultFormElementStyle" ReadOnly="True" 
                                                            Text='<%# Bind("LessonNoteId") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("LessonNoteId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Subject / Class" SortExpression="ShortName">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>,
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "ShortName"), String) %>'></asp:Label>,
                                                        <asp:Label ID="Label2" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "ClassName"), String) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="90" />
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="WeekNumber" HeaderText="Week">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlWeekNumberEdit" runat="server" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjSerialNumbers" 
                                                            SelectedValue='<%# Bind("WeekNumber") %>'>
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" 
                                                            Text='<%# "Week " & CType(Databinder.Eval(Container.DataItem, "WeekNumber"), String) %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="50" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Lesson" SortExpression="LessonNumber">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3b" runat="server" Columns="5" 
                                                            Text='<%# Bind("LessonNumber") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        Lesson <asp:Label ID="Label4" runat="server" Text='<%# Bind("LessonNumber") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Topic" SortExpression="LessonTopic">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox9" runat="server" Columns="20" 
                                                            CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("LessonTopic") %>' 
                                                            TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("LessonTopic") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Objectives" SortExpression="LessonObjectives">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Columns="20" 
                                                            CssClass="defaultFormElementStyle" Rows="7" 
                                                            Text='<%# Bind("LessonObjectives") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("LessonObjectives") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Method" SortExpression="LessonMethod">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Columns="55" 
                                                            CssClass="defaultFormElementStyle" Rows="7" Text='<%# Bind("LessonMethod") %>' 
                                                            TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("LessonMethod") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Homework" SortExpression="LessonHomework">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Columns="20" 
                                                            CssClass="defaultFormElementStyle" Rows="7" 
                                                            Text='<%# Bind("LessonHomework") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("LessonHomework") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100px" />
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
                                        <asp:SqlDataSource ID="dsSqlSyllabus" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                                            DeleteCommand="STP_LESSONNOTE_DELETE_TEMPLessonNote" DeleteCommandType="StoredProcedure"
                                            InsertCommand="STP_LESSONNOTE_INSERT_TEMPLessonNote" InsertCommandType="StoredProcedure"
                                            SelectCommand="  "
                                            UpdateCommand="STP_LESSONNOTE_UPDATE_TEMPLessonNote" 
                                            UpdateCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="" Name="ClassName" />
                                                <asp:Parameter DefaultValue="" Name="SubjectShortName" />
                                                <asp:Parameter DefaultValue="" Name="TermName" />
                                                <asp:Parameter DefaultValue="" Name="SessionName" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="LessonNoteId" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="LessonNoteId" Type="Int32" />
                                                <asp:Parameter Name="SubjectShortName" Type="String" />
                                                <asp:Parameter Name="ClassName" Type="String" />
                                                <asp:Parameter Name="WeekNumber" Type="Int32" />
                                                <asp:Parameter Name="LessonNumber" Type="String" />
                                                <asp:Parameter Name="LessonTopic" Type="String" />
                                                <asp:Parameter Name="LessonObjectives" Type="String" />
                                                <asp:Parameter Name="LessonMethod" Type="String" />
                                                <asp:Parameter Name="LessonHomework" Type="String" />
                                                <asp:Parameter Name="Remark" Type="String" />
                                                <asp:Parameter Name="Remark2" Type="String" />
                                                <asp:Parameter Name="Remark3" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Direction="InputOutput" Name="LessonNoteId" Type="Int32" />
                                                <asp:Parameter Name="SubjectShortName" Type="String" />
                                                <asp:Parameter Name="ClassName" Type="String" />
                                                <asp:Parameter Name="WeekNumber" Type="Int32" />
                                                <asp:Parameter Name="LessonNumber" Type="String" />
                                                <asp:Parameter Name="LessonTopic" Type="String" />
                                                <asp:Parameter Name="LessonObjectives" Type="String" />
                                                <asp:Parameter Name="LessonMethod" Type="String" />
                                                <asp:Parameter Name="LessonHomework" Type="String" />
                                                <asp:Parameter Name="Remark" Type="String" />
                                                <asp:Parameter Name="Remark2" Type="String" />
                                                <asp:Parameter Name="Remark3" Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30">
                                        &nbsp;</td>
                                    <td>
                                        <hr width="100%" noshade="noshade" color="black" />
                                    </td>
                                </tr>
                            </table>
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
                    SelectCommand=" SELECT * FROM dbo.TEMPSubject where SubjectId IN (SELECT DISTINCT SubjectId FROM dbo.TEMPUserSubject WHERE ClassName = @ClassName) ORDER BY SubjectName">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ClassName" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjSerialNumbers" runat="server" 
                                            SelectMethod="GetIntegerSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="minimum" Type="Int32" />
                            <asp:Parameter DefaultValue="20" Name="maximum" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
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
