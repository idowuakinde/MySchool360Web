<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageclasssubjects.aspx.vb" Inherits="modules_system_setups_metadata_manageclasssubjects" Trace="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    &nbsp;<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Assign a New Subject to a Class"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        CssClass="noBorderedMenuTable" DefaultMode="Insert" Height="50px" Width="600px" 
                        DataSourceID="dsSqlClassSubjects" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" EnableModelValidation="True" 
                        DataKeyNames="ClassSubjectId">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="ClassSubjectId" SortExpression="ClassSubjectId" 
                                InsertVisible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassSubjectId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class:" SortExpression="ClassName">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectShortName">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectName" DataValueField="ShortName" 
                                        SelectedValue='<%# Bind("SubjectShortName") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Assign Selected Subject to the Selected Class" />
                        </Fields>
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Existing Classes &amp; Their Assigned Subjects"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        AutoGenerateDeleteButton="True" AutoGenerateSelectButton="True" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlClassSubjects" DataKeyNames="ClassSubjectId" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="ClassSubjectId" HeaderText="Id" 
                                SortExpression="ClassSubjectId" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="ClassName" HeaderText="Class" 
                                SortExpression="ClassName" />
                            <asp:BoundField DataField="SubjectShortName" HeaderText="Subject" 
                                SortExpression="SubjectShortName" />
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlClassSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPClassSubject" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPClassSubject" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPClassSubject" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPClass" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
<%--                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
--%>                            
                            <asp:Parameter Name="ClassSubjectId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClassId" Type="Int32" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="ClassAlias" Type="String" />
                            <asp:Parameter Name="ClassColor" Type="String" />
                            <asp:Parameter Name="Teacher" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ClassSubjectId" Type="Int32" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlClasses" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        
                        SelectCommand="SELECT [ClassName] FROM [TEMPClass] ORDER BY [ListingOrder]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        
                                        
                        SelectCommand="SELECT [ShortName], [SubjectName] FROM [TEMPSubject] ORDER BY [SubjectName]">
                    </asp:SqlDataSource>
                    &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
