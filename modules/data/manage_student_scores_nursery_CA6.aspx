﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student_scores_nursery_CA6.aspx.vb" Inherits="modules_data_manage_student_scores_nursery_CA6" %>

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
                        Text=":: View/Edit Students' Scores AFTER the Mid-Term Break"></asp:Label></td>
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
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1300px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." >
            <Columns>
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
                        <asp:HyperLink ID="hlnkPrint" runat="server" Font-Bold="True" NavigateUrl='<%# "print_student_result.asp?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>Print Result</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="60px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="PortalNumber" HeaderText="Portal No." 
                    SortExpression="PortalNumber" />
                <asp:TemplateField HeaderText="Full Name" SortExpression="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# "<b>" & Databinder.Eval(Container.DataItem, "LastName").ToString.ToUpper & "</b> " & Databinder.Eval(Container.DataItem, "FirstName").ToString %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    SortExpression="ClassName" />
                <asp:TemplateField HeaderText="Mark" SortExpression="Score">
                    <ItemTemplate>
                        <asp:Label ID="lblMidTermScore" runat="server" Text='<%# "Before Mid-Term: " & Common.GetScoreMask(Common.GetMidTermScore(CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String), CType(Databinder.Eval(Container.DataItem, "ClassName"), String), subjectShortName, sessionName, termName, "CA"), CType(Databinder.Eval(Container.DataItem, "ClassName"), String)) %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddlTestScore" runat="server" AppendDataBoundItems="True" CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "Score"), Int32) %>'>
                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Text=''></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <ItemTemplate>
                        <table width="600" border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td>
                                <asp:TextBox ID="txtAddSubjectComment" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine" 
                                        Text='<%# Bind("Comment") %>'></asp:TextBox>
                                &nbsp;</td>
                                <td width="310">
                                <asp:ListBox ID="lstCommentSelector" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddCommentSelector" 
                                        DataTextField="CommentText" DataValueField="CommentText" Rows="7" 
                                        Width="300px" 
                                        onchange='javascript:CopyStandardComment(this, "");'></asp:ListBox>
                                &nbsp;</td>
                            </tr>
                        </table>    
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
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
                            <asp:Button ID="btnSaveScores" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      Save Scores &gt;      " />
                            &nbsp;<input id="Reset1" class="defaultButtonStyle" type="reset" 
                        value="   Clear   " /></td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        SelectCommand="  ">
            <SelectParameters>
                <asp:QueryStringParameter Name="ClassName" QueryStringField="c" />
                <asp:QueryStringParameter Name="SubjectShortName" QueryStringField="b" />
                <asp:Parameter Name="SessionName" />
                <asp:Parameter Name="TermName" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjScores" runat="server" 
                            SelectMethod="GetDoubleSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="minimum" Type="Double" />
                            <asp:Parameter DefaultValue="5" Name="maximum" Type="Double" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Double" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                <asp:SqlDataSource ID="dsSqlAddCommentSelector" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT 0 AS [CommentId], 'Sorry. Generic comments no longer supported. Please contact an Administrator or your Head of School...' AS [CommentText]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="Activated" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
