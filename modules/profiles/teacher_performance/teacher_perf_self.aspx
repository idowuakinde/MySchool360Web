<%@ Page Language="VB" AutoEventWireup="false" CodeFile="teacher_perf_self.aspx.vb" Inherits="modules_profiles_teacher_performance_teacher_perf_self" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[
    function TABLE1_onclick() {
    }
// ]]>
</script>
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: TEACHER PERFORMANCE APPRAISAL FORM - APPRAISEE'S VIEW"></asp:Label></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" 
                    CssClass="noBorderedMenuTable" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="100%" 
                    DataKeyNames="Username" EmptyDataText="No data." 
                    DataSourceID="dsSqlTeacherPerf">
            <HeaderTemplate>
            </HeaderTemplate>
            <FooterTemplate>
                    <table cellpadding="2" cellspacing="2" width="100%" border="0">
                      <tr bgcolor="tan">
                        <td align="center" colspan="6">GUIDE TO UNDERSTANDING THE SCORES ON THE TEACHER 
                            PERFORMANCE APPRAISAL FORM&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="150" rowspan="6" align="center" valign="middle">
                            <img src="../../../images/logos/logo.15.jpg" height="120" border="2" /></td>
                        <td rowspan="6" align="center" valign="middle">PERFORMANCE APPRAISAL SCALE</td>
                        <td align="center">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="center" width="250"><strong><u></u></strong></td>
                      </tr>
                      <tr>
                        <td align="center">1</td>
                        <td align="center">UNSATISFACTORY</td>
                        <td align="center">Performance within this function area is consistently inadequate/unacceptable</td>
                      </tr>
                      <tr>
                        <td align="center">2</td>
                        <td align="center">BELOW EXPECTATION</td>
                        <td align="center">Performance within this function area is sometimes inadequate/unacceptable</td>
                      </tr>
                      <tr>
                        <td align="center">3</td>
                        <td align="center">MEETS EXPECTATION</td>
                        <td align="center">Performance within this function area is consistently adequate/acceptable</td>
                      </tr>
                      <tr>
                        <td align="center">4</td>
                        <td align="center">EXCEEDS EXPECTATION</td>
                        <td align="center">Performance within this function area is consistently high</td>
                      </tr>
                    </table>
            </FooterTemplate>
            <Fields>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="TEACHER'S NAME:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" 
                            Text='<%# Eval("TeacherName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="1). TIME MANAGEMENT:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher always gets the class started on time, and always has materials and supplies ready at hand at the start of every lesson.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory1" runat="server" Font-Bold="True" Text='3 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="2). CONTROL OF STUDENTS' BEHAVIOUR:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher has clearly communicated the rules for his/her class.<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher also enforces those rules, while upholding the dignity of the students.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory2" runat="server" Font-Bold="True" Text='4 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="3). PRESENTATION STYLE:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher breaks down difficult concepts in such a way that the whole class can understand and relate with the concepts taught.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory3" runat="server" Font-Bold="True" Text='4 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="4). STUDENT PERFORMANCE MONITORING:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher knows every student's learning pace and learning ability, and takes this into consideration when conducting lessons. ">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory4" runat="server" Font-Bold="True" Text='4 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="5). FEEDBACK DURING CLASSES:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher uses effective verbal and non-verbal communication techniques to encourage active participation and teamwork during classes.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory5" runat="server" Font-Bold="True" Text='4 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="6). ADAPTABILITY:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher's teaching style takes every student's unique learning ability into account, during lessons.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory6" runat="server" Font-Bold="True" Text='4 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="7). COMMUNICATING OUTSIDE THE CLASSROOM:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher consistently explains the benefits of extra-curricular activities to the students and encourages them to take part in them.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory7" runat="server" Font-Bold="True" Text='4 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="8). PERFORMING NON-INSTRUCTIONAL DUTIES:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher expresses concern for and is caring to all students both inside and outside the classroom.">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory8" runat="server" Font-Bold="True" Text='2 out of 4'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="EVALUATOR'S SUMMARY COMMENTS:">
                    <ItemTemplate>
                        <asp:Label ID="lblEvaluatorSummary" runat="server" Font-Bold="True" Text='Mr. Akinde is a very capable teacher. He consistently manages class time effectively and controls/supervises student behaviour efficiently. Mr. Akinde is also able to break down difficult concepts into simple language for his students to understand. Mr. Akinde employs both verbal and non-verbal techniques to elicit votal feedback from students during classes, and Mr. Akinde continually encourages his students to take outside-the-classroom learning as seriously as they do in-class learning. In all, Mr. Akinde has demonstrated himself to be a very capable teacher.'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="YOUR REACTION TO THE APPRAISER'S EVALUATION:">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCommentsReaction" runat="server" Width="350px" CssClass="defaultFormElementStyle" Rows="10" TextMode="MultiLine" Text=""></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:CommandField ButtonType="Button" InsertText="Submit" 
                    ShowInsertButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
            </Fields>
            <FieldHeaderStyle Font-Bold="True" Width="900px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
            <EditRowStyle Wrap="True" />
            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
            <FooterStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <AlternatingRowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#FFFBD6" ForeColor="#333333" Height="28px" />
            <RowStyle BackColor="White" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="dsSqlTeacherPerf" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT UPPER([Firstname] + ' ' +[Middlename] + ' ' + [Surname]) AS TeacherName, [Username] FROM [Core_User] WHERE ([Username] = @Username)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Username" QueryStringField="a" />
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
