<%@ Page Language="VB" AutoEventWireup="false" CodeFile="approve_student_scores_CA1.aspx.vb" Inherits="modules_data_approve_student_scores_CA1" %>

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
        <table border="0" width="100%">
            <tr>
                <td>
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Approve/Reject Students' Scores for September Test"></asp:Label></td>
            </tr>
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" 
                        AutoGenerateColumns="False" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1500px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." 
                        AutoGenerateSelectButton="True" >
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serialNumber + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:BoundField DataField="TeacherName" HeaderText="Teacher" 
                    SortExpression="TeacherName" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    SortExpression="ClassName" >
                <ItemStyle Width="100px" Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="SubjectShortName" HeaderText="Subject" 
                    SortExpression="SubjectShortName" >
                <ItemStyle Font-Bold="True" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="SessionName" HeaderText="Session" 
                    SortExpression="SessionName" >
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="TermName" HeaderText="Term" 
                    SortExpression="TermName" >
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Assessment Type" SortExpression="AssessmentType">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#  "<b>" & Databinder.Eval(Container.DataItem, "AssessmentType").ToString & "</b> (September)" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:BoundField DataField="PortalNumber" HeaderText="Portal Number" 
                    SortExpression="PortalNumber" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" >
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle Font-Bold="True" HorizontalAlign="Right" Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="Comment" HeaderText="Teacher's Comment" 
                    SortExpression="Comment" >
                <ItemStyle Font-Bold="True" Width="650px" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                            <asp:Button ID="btnApprove" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      Approve Scores &gt;      " UseSubmitBehavior="False" />
                            &nbsp;<asp:Button ID="btnReject" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      Give More Time      " UseSubmitBehavior="False" />
                            </td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        SelectCommand=" SELECT CustomerId, e.FirstName + ' ' + e.Surname AS TeacherName, DistrictCode as ClassName, b.SubjectShortName, b.SessionName, b.TermName, b.AssessmentType, CustomerCode as PortalNumber, a.FirstName, a.LastName, b.Score, b.Comment FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubjectScore b ON a.CustomerCode = b.PortalNumber INNER JOIN dbo.TEMPSubject c ON b.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPUserSubject d ON c.SubjectId = d.SubjectId AND a.DistrictCode = d.ClassName INNER JOIN dbo.Core_User e ON d.UserId = e.UserId ORDER BY TeacherName, ClassName, SubjectShortName, SessionName, TermName, AssessmentType, PortalNumber, a.FirstName, a.LastName, Score, Comment ">
        </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
