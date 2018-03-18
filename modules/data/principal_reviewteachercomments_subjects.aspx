<%@ Page Language="VB" AutoEventWireup="false" CodeFile="principal_reviewteachercomments_subjects.aspx.vb" Inherits="modules_data_principal_reviewteachercomments_subjects" %>

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
                        Text=":: Review Teacher Comments for September Test"></asp:Label></td>
            </tr>
            <tr>
                <td>
						&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="20">&nbsp;</td>
                            <td>
						<asp:Button ID="btnPrintAll" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      PRINT      " UseSubmitBehavior="False" Visible="False" />
                                <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /><br />&nbsp;
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable borderedTableGrey" AutoGenerateColumns="False" 
                    DataKeyNames="CustomerId" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1150px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." >
            <Columns>
                <asp:TemplateField HeaderText="Approved?" SortExpression="ApprovalStatus">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Common.GetApprovalStatus(Databinder.Eval(Container.DataItem, "ApprovalStatus").ToString) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" HorizontalAlign="Center" />
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
                <asp:TemplateField HeaderText="Score">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" style="font-weight: 700" 
                            Text='<%# Bind("Score") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="20px" />
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
        &nbsp;<br />
                    <asp:Button ID="btnPrintAll0" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      PRINT      " UseSubmitBehavior="False" Visible="False" />
                                <input name="btnPrint0" type="button" class="defaultButtonStyle" id="btnPrint0" 
                                    value="   Print This Page   " onclick="javascript:PrintPage()" /><asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        SelectCommand=" SELECT CustomerId, ISNULL(c.ScoreId, 0) AS ScoreId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, b.SubjectShortName, ISNULL(c.Score, 0) AS Score, ISNULL(c.Comment, '') as Comment, ISNULL(c.Remark1, '') AS ApprovalStatus FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName WHERE a.DistrictCode = @ClassName AND b.SubjectShortName = @SubjectShortName ORDER BY CustomerCode ">
            <SelectParameters>
                <asp:QueryStringParameter Name="ClassName" QueryStringField="c" />
                <asp:QueryStringParameter Name="SubjectShortName" QueryStringField="b" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:HiddenField ID="hfHeight" runat="server" />
                <asp:HiddenField ID="hfWidth" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
