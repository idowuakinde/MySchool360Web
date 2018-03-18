<%@ Page Language="VB" AutoEventWireup="false" CodeFile="x.aspx.vb" Inherits="modules_profiles_x" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            float: left;
            border: 1px solid #c0c0c0;
        }
    </style>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="ScoreId" DataSourceID="dsSqlScoreSheet" 
                        ForeColor="#333333" GridLines="None" Width="100%" AllowSorting="True">
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                            VerticalAlign="Top" />
                        <Columns>
                            <asp:BoundField DataField="ScoreId" HeaderText="Id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ScoreId" />
                            <asp:TemplateField HeaderText="Term" SortExpression="Semester">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Semester") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    Term
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Semester") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" 
                                SortExpression="MatricNumber" Visible="False" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Student Name" 
                                SortExpression="CustomerName" />
                            <asp:BoundField DataField="SubjectId" HeaderText="SubjectId" 
                                SortExpression="SubjectId" Visible="False" />
                            <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                                SortExpression="SubjectName" />
                            <asp:BoundField DataField="ScoreCA" HeaderText="Score (CA)" 
                                SortExpression="ScoreCA" />
                            <asp:BoundField DataField="ScoreExam" HeaderText="Score (Exam)" 
                                SortExpression="ScoreExam" />
                            <asp:BoundField DataField="Score" HeaderText="Total Score" ReadOnly="True" 
                                SortExpression="Score" />
                            <asp:BoundField DataField="Comment" HeaderText="Comment" 
                                SortExpression="Comment" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlScoreSheet" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [ScoreId], [Semester], [MatricNumber], CustomerName, a.[SubjectId], SubjectName, ScoreCA + ScoreExam AS [Score], [ScoreCA], [ScoreExam], [Comment] FROM dbo.[TEMPScoreSheet] a INNER JOIN dbo.TEMPCustomers b ON a.MatricNumber = right(b.CustomerCode, 5) INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId ORDER BY ScoreId " 
                        InsertCommand="INSERT INTO dbo.TEMPScoreSheet(Semester, MatricNumber, SubjectId, Score, ScoreCA, ScoreExam, Comment) VALUES (@Semester, @MatricNumber, @SubjectId, @Score, @ScoreCA, @ScoreExam, @Comment)">
                        <InsertParameters>
                            <asp:Parameter Name="Semester" />
                            <asp:Parameter Name="MatricNumber" />
                            <asp:Parameter Name="SubjectId" />
                            <asp:Parameter Name="Score" />
                            <asp:Parameter Name="ScoreCA" />
                            <asp:Parameter Name="ScoreExam" />
                            <asp:Parameter Name="Comment" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <a name="DataEntrySection" id="DataEntrySection" />&nbsp;</a><asp:Button 
                        ID="Button1" runat="server" Text="Button" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        CellPadding="4" DataKeyNames="ScoreId" DataSourceID="dsSqlScoreSheet" 
                        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
                        Width="600px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="250px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ScoreId" />
                            <asp:TemplateField HeaderText="Term:" SortExpression="Semester">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Semester") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Semester") %>'>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Semester") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student:" SortExpression="MatricNumber">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MatricNumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudents" 
                                        DataTextField="CustomerName" DataValueField="CustomerCode" 
                                        SelectedValue='<%# Bind("MatricNumber") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlStudents" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [CustomerCode], [CustomerName] FROM [TEMPcustomers] ORDER BY [CustomerName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MatricNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubjectId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectName" DataValueField="SubjectId" 
                                        SelectedValue='<%# Bind("SubjectId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [SubjectId], [SubjectName] FROM [TEMPSubject] ORDER BY [SubjectName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubjectId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ScoreCA" HeaderText="ScoreCA" 
                                SortExpression="ScoreCA" />
                            <asp:BoundField DataField="ScoreExam" HeaderText="ScoreExam" 
                                SortExpression="ScoreExam" />
                            <asp:TemplateField HeaderText="Score" SortExpression="Score">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Score") %>'></asp:Label>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Score") %>'></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Score") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Comment") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
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
