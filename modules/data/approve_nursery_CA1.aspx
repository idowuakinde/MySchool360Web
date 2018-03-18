<%@ Page Language="VB" AutoEventWireup="false" CodeFile="approve_nursery_CA1.aspx.vb" Inherits="modules_data_approve_nursery_CA1" %>

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
                        Text=":: Review Students' Scores for Half-Term"></asp:Label></td>
            </tr>
            <tr>
                <td>
						<asp:Button ID="btnPrintBatch" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      PRINT this Batch of Results      " UseSubmitBehavior="False" />
&nbsp;&nbsp;<asp:Button ID="btnEmailBatch" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      E-mail this Batch of Results      " UseSubmitBehavior="False" />
                </td>
            </tr>
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="CustomerId" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1200px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." >
            <Columns>
                <asp:TemplateField HeaderText="Approved?" SortExpression="ApprovalStatus">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Common.GetApprovalStatus(Databinder.Eval(Container.DataItem, "ApprovalStatus").ToString) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <%--<asp:HyperLink ID="hlnkPrincipalComment" runat="server" Font-Bold="True" NavigateUrl='<%# "print_student_result_principal.asp?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>Principal's Comment</asp:HyperLink>--%>
                        <asp:HyperLink ID="hlnkPrincipalComment" runat="server" Font-Bold="True" NavigateUrl='about:blank'>Principal's Comment</asp:HyperLink>
                        <br />&nbsp;<br />
                        <%--<asp:HyperLink ID="hlnkPrint" runat="server" Font-Bold="True" NavigateUrl='<%# "print_student_result.asp?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>Print Result</asp:HyperLink>--%>
                        <asp:HyperLink ID="hlnkPrint" runat="server" Font-Bold="True" NavigateUrl='about:blank'>Print Result</asp:HyperLink>
                        <%--&nbsp;|&nbsp;<asp:HyperLink ID="hlnkEmail" runat="server" Font-Bold="True" NavigateUrl='<%# "email_to_parents.aspx?a=single&b=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>E-mail</asp:HyperLink>--%>
                        &nbsp;|&nbsp;<asp:HyperLink ID="hlnkEmail" runat="server" Font-Bold="True" NavigateUrl='about:blank'>E-mail</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serialNumber + 1 %>"></asp:Label>
                    </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Image ID="Image1" runat="server" Height="30px" ToolTip="Click to enlarge." 
                            ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & ".jpg")) %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                        </a><br />
                    </ItemTemplate>
                    <ItemStyle Width="60px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="ScoreId" InsertVisible="False" 
                    SortExpression="ScoreId">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="20px" />
                </asp:BoundField>
                <asp:BoundField DataField="PortalNumber" HeaderText="Portal No." 
                    SortExpression="PortalNumber" />
                <asp:TemplateField HeaderText="Full Name" SortExpression="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "FirstName").ToString & " <b>" & Databinder.Eval(Container.DataItem, "LastName").ToString & "</b>" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="250px" />
                </asp:TemplateField>
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    SortExpression="ClassName" />
                <asp:TemplateField HeaderText="Mark" SortExpression="Score">
                    <ItemTemplate>
                        <asp:Label ID="lblMidTermScore" runat="server" Text='<%# "Before Mid-Term: " & Common.GetScoreMask(Common.GetMidTermScore(CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String), CType(Databinder.Eval(Container.DataItem, "ClassName"), String), subjectShortName, sessionName, termName, "CA"), CType(Databinder.Eval(Container.DataItem, "ClassName"), String)) %>'></asp:Label>
                        <br />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" style="font-weight: 700" 
                            Text='<%# Bind("Comment") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="250px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" Height="65px" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                    <asp:Button ID="btnPrintBatch0" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      PRINT this Batch of Results      " UseSubmitBehavior="False" />
                    &nbsp;&nbsp;<asp:Button ID="btnEmailBatch0" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      E-mail this Batch of Results      " UseSubmitBehavior="False" />
                    <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        SelectCommand=" SELECT CustomerId, ISNULL(c.ScoreId, 0) AS ScoreId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, b.SubjectShortName, ISNULL(c.Score, 0) AS Score, ISNULL(c.Comment, '') as Comment, ISNULL(c.Remark1, '') AS ApprovalStatus FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName WHERE a.DistrictCode = @ClassName AND b.SubjectShortName = @SubjectShortName ORDER BY CustomerCode ">
            <SelectParameters>
                <asp:QueryStringParameter Name="ClassName" QueryStringField="c" />
                <asp:QueryStringParameter Name="SubjectShortName" QueryStringField="b" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <hr color="black" size="2" />
                </td>
            </tr>
            <tr>
                <td>
						<asp:Label ID="lblHeader0" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: You can take any of the following actions on the above batch of student results."></asp:Label></td>
            </tr>
            <tr>
                <td>
                            <asp:Button ID="btnApprove" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      APPROVE Scores &gt;      " UseSubmitBehavior="False" />
                            &nbsp;<asp:Button ID="btnReject" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      REJECT (Teacher will be notified by e-mail)      " 
                                UseSubmitBehavior="False" />
        &nbsp;</td>
            </tr>
            <tr>
                <td><table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                        <td width="250" align="left" valign="top">
                        <span class="defaultHeaderTextStyleTopAligned">Please provide Principal's Comments:</span><br />
                            <br />
                            (Please note that the comments entered here will appear on each result listed 
                            above)</td>
                        <td align="left" valign="top"><asp:TextBox ID="txtPrincipalComments" runat="server" Columns="140" 
                                CssClass="defaultFormElementStyle" Rows="10" TextMode="MultiLine" 
                                EnableViewState="False" Text=""></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">&nbsp;</td>
                        <td align="left" valign="top">
                            <asp:Button ID="btnSaveComments" runat="server" CssClass="defaultButtonStyle" 
                                Text="          Save Principal's Comment &gt;          " />                        
&nbsp;<span class="style16">
<input name="btnReset" type="reset" class="defaultButtonStyle" id="button" value="   Clear   " />
</span></td>
                    </tr>
                </table>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
