<%@ Page Language="VB" AutoEventWireup="false" CodeFile="techer_perf_student.aspx.vb" Inherits="modules_profiles_teacher_performance_techer_perf_student" %>

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
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: SCORE MY TEACHER (STUDENT'S VIEW)"></asp:Label></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Insert" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="100%" 
                    DataKeyNames="CustomerCode" EmptyDataText="No data." 
                    DataSourceID="dsSqlTeacherPerf">
            <HeaderTemplate>
					<table cellpadding="2" cellspacing="2" width="100%" border="0">
                      <tr bgcolor="tan">
                        <td align="center" colspan="5"><p>DEAR <%=GetStudentDetails(0).Item("CustomerName").ToString.ToUpper%> (<%=portalNumber%>), WE NEED YOU TO TELL US HOW EFFECTIVE YOUR TEACHERS HAVE BEEN IN CLASS.<br />&nbsp;<br />THIS 
                            WILL GO A LONG WAY IN IMPROVING THE QUALITY OF EDUCATION THAT WE ARE ABLE TO 
                            DELIVER TO YOU.</p>
                        <p>FOR EACH OF THE AREAS LISTED BELOW, KINDLY SCORE YOUR TEACHER BY CLICKING A NUMBER BETWEEN 1 (POOR PERFORMANCE) AND 4 (EXCELLENT PERFORMANCE).</p></td>
                      </tr>
                      <tr>
                        <td width="150" rowspan="7" align="center" valign="middle">
                            <img src="../../../images/logos/logo.15.jpg" height="120" border="2" /></td>
                        <td rowspan="7" align="center" valign="middle">TEACHER SCORE SCALE</td>
                        <td align="center">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td width="150" rowspan="6" align="right"><a>
                            <asp:Image ID="imgPhoto" runat="server" BorderStyle="Solid" BorderWidth="2px" 
                                EnableViewState="False" Height="120px" Imageurl="" 
                                ToolTip="Passport Photograph..." />
                            </a></td>
                      </tr>
                      <tr>
                        <td align="center">1</td>
                        <td align="center">POOR</td>
                      </tr>
                      <tr>
                        <td align="center">2</td>
                        <td align="center">BELOW AVERAGE</td>
                      </tr>
                      <tr>
                        <td align="center">3</td>
                        <td align="center">AVERAGE</td>
                      </tr>
                      <tr>
                        <td align="center">4</td>
                        <td align="center">EXCELLENT</td>
                      </tr>
                    </table>
            </HeaderTemplate>
            <FooterTemplate>
            </FooterTemplate>
            <Fields>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="SELECT A TEACHER:">
                    <EditItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("CustomerName") %>' 
                            Font-Bold="True"></asp:Label>
                        &nbsp;(<asp:Label ID="Label12" runat="server" Font-Bold="True" 
                            Text='<%# Eval("CustomerCode") %>'></asp:Label>)
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlTeachers" runat="server" AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlTeachers" DataTextField="UserDetails" 
                            DataValueField="Username">
                            <asp:ListItem Selected="True" Value="---">Please select a teacher to evaluate:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlTeachers" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [Username], UPPER([Surname]) + ', ' + [Firstname] + ' ' + [Middlename] + ' (' + [Sex] + ') ' AS UserDetails FROM dbo.Core_User WHERE [DepartmentId] = @DepartmentId ORDER BY [Surname], [Firstname], [Middlename] ">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="9" Name="DepartmentId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="1). TIME MANAGEMENT:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher always gets the class started on time, and always has materials and supplies ready at hand at the start of every lesson.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo1" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="2). CONTROL OF STUDENTS' BEHAVIOUR:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher has clearly communicated the rules for his/her class.<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher also enforces those rules, while upholding the dignity of the students.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo2" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="3). PRESENTATION STYLE:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher breaks down difficult concepts in such a way that the whole class can understand and relate with the concepts taught.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo3" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="4). STUDENT PERFORMANCE MONITORING:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher knows every student's learning pace and learning ability, and takes this into consideration when conducting lessons. ">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo4" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="5). FEEDBACK DURING CLASSES:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher uses effective verbal and non-verbal communication techniques to encourage active participation and teamwork during classes.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo5" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="6). ADAPTABILITY:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher's teaching style takes every student's unique learning ability into account, during lessons.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo6" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="7). COMMUNICATING OUTSIDE THE CLASSROOM:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher consistently explains the benefits of extra-curricular activities to the students and encourages them to take part in them.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo7" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="8). PERFORMING NON-INSTRUCTIONAL DUTIES:<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher expresses concern for and is caring to all students both inside and outside the classroom.">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="rdo8" runat="server" RepeatDirection="Horizontal" Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:CommandField ButtonType="Button" InsertText="Submit" 
                    ShowCancelButton="False">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
            </Fields>
            <FieldHeaderStyle Font-Bold="True" Width="850px" />
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
                    
                    SelectCommand="SELECT UPPER(DistrictCode) AS DistrictCode, [CustomerCode], UPPER(CustomerName) AS CustomerName FROM [TEMPcustomers] WHERE ([DistrictCode] = @DistrictCode) ORDER BY [CustomerName]">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="DistrictCode" QueryStringField="a" 
                            Type="String" />
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
