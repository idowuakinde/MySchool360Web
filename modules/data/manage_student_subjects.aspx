﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student_subjects.aspx.vb" Inherits="modules_profiles_manage_student_subjects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td>
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: View/Edit Students' Subjects"></asp:Label>&nbsp;&nbsp;(<%= gvMaster.Rows.Count.ToString & " Students" %>)</td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="PortalNumber" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        SelectedIndex="0" EnableModelValidation="True" 
                        EmptyDataText="No record(s) found." >
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <asp:Label ID="lblSerial" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Portal Number" SortExpression="PortalNumber">
                    <ItemTemplate>
                        <asp:Label ID="Label49" runat="server" Text='<%# "<b>" & CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String) & "</b><br /><b>" & CType(Databinder.Eval(Container.DataItem, "ClassName"), String).Replace(".2012", "") & "</b><br />Boarder: " & Common.GetYesOrNo(CType(Databinder.Eval(Container.DataItem, "Boarder"), String)) & "<br />Gender: " & Common.GetMaleOrFemale(CType(Databinder.Eval(Container.DataItem, "Gender"), String)) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Image ID="Image1" runat="server" Height="30px" 
                            ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & ".jpg")) %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                        </a>
                        <br /><asp:Label ID="Label49_2" runat="server" Text='<%# "<b>" & Databinder.Eval(Container.DataItem, "LastName").ToString.ToUpper & " " & Databinder.Eval(Container.DataItem, "FirstName").ToString.ToUpper & "</b>" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:CommandField SelectText='Show Subjects' ShowSelectButton="True">
                <ItemStyle Width="150px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="REGISTERED SUBJECTS">
                    <ItemTemplate>
                        <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" 
                            AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
                            AutoGenerateSelectButton="True" CellPadding="4" CssClass="noBorderedMenuTable" 
                            DataKeyNames="StudentSubjectId" DataSourceID="dsSqlGetDetail" 
                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No record(s) to display.&lt;br /&gt;&amp;nbsp;" 
                            ForeColor="#333333" GridLines="None" Visible="False" Width="100%" 
                            Font-Bold="False" EnableModelValidation="True" OnRowDataBound="gvDetail_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="StudentSubjectId" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="StudentSubjectId" />
                                <asp:TemplateField HeaderText="PortalNumber" SortExpression="PortalNumber">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("PortalNumber") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label50" runat="server" Text='<%# Bind("PortalNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject" SortExpression="SubjectShortName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList9" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddSubjects" 
                                            DataTextField="ShortName" DataValueField="ShortName" 
                                            SelectedValue='<%# Bind("SubjectShortName") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label51" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Session" SortExpression="SessionName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList10" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddSession" 
                                            DataTextField="SessionName" DataValueField="SessionName" 
                                            SelectedValue='<%# Bind("SessionName") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label52" runat="server" Text='<%# Bind("SessionName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Term" SortExpression="TermName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList11" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddTerm" 
                                            DataTextField="TermName" DataValueField="TermName" 
                                            SelectedValue='<%# Bind("TermName") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label53" runat="server" Text='<%# Bind("TermName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Top" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Left" VerticalAlign="Top" />
                            <EditRowStyle CssClass="defaultFormElementStyle" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>

                   <br />
                        <asp:Label ID="lblAddNew" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Register a New Subject" CssClass="defaultHeaderTextStyle" 
                            Visible="False"></asp:Label>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" 
                            DataKeyNames="StaffSpouseId" DataSourceID="dsSqlGetDetail" DefaultMode="Insert" 
                            ForeColor="#333333" GridLines="None" Width="100%" Visible="False" 
                            OnItemInserted="DetailsViewItemInserted" EnableModelValidation="True" >
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Middle" Wrap="True" />
                            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" VerticalAlign="Top" 
                                Width="220px" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="StudentSubjectId" HeaderText="StudentSubjectId" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="StudentSubjectId" />
                                <asp:TemplateField HeaderText="Student Concerned:" 
                                    SortExpression="PortalNumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StaffId") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList5" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetSingleStudent" 
                                            DataTextField="StudentDetails" DataValueField="PortalNumber" 
                                            SelectedValue='<%# Bind("PortalNumber") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsSqlGetSingleStudent" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT CustomerCode as PortalNumber, UPPER([LastName]) + ' ' + UPPER([FirstName]) + ' | ' + UPPER(CustomerCode) + ' | (' + UPPER(DistrictCode) + ')' AS StudentDetails FROM dbo.TEMPCustomers WHERE CustomerCode = @PortalNumber ">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="gvMaster" Name="PortalNumber" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectShortName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SpouseName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList6" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddSubjects" 
                                            DataTextField="ShortName" DataValueField="ShortName" 
                                            SelectedValue='<%# Bind("SubjectShortName") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SpouseName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Session:" 
                                    SortExpression="SessionName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SpouseAddress") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList7" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddSession" 
                                            DataTextField="SessionName" DataValueField="SessionName" 
                                            SelectedValue='<%# Bind("SessionName") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SpouseAddress") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Term:" SortExpression="TermName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SpouseTelephone") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList8" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddTerm" 
                                            DataTextField="TermName" DataValueField="TermName" 
                                            SelectedValue='<%# Bind("TermName") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("SpouseTelephone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" InsertText="Add Subject" 
                                    ShowInsertButton="True" />
                            </Fields>
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>

                   </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
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
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT DISTINCT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber WHERE a.belongtocode = @SessionName AND a.CustomerCode LIKE @PortalNumber ORDER BY CustomerCode ">
            <SelectParameters>
                <asp:QueryStringParameter Name="SessionName" QueryStringField="a" />
                <asp:QueryStringParameter Name="PortalNumber" QueryStringField="c" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlGetDetail" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT StudentSubjectId, PortalNumber, SubjectShortName, SessionName, TermName, [Remark1], [Remark2], [Remark3] FROM [dbo].[TEMPStudentSubject] WHERE PortalNumber = @PortalNumber AND SessionName = @SessionName" 
                        DeleteCommand="STP_METADATA_DELETE_TEMPStudentSubject" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_METADATA_INSERT_TEMPStudentSubject" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_METADATA_UPDATE_TEMPStudentSubject" 
                        UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaster" Name="PortalNumber" PropertyName="SelectedValue" />
                            <asp:Parameter Name="SessionName" DefaultValue="" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="StudentSubjectId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StudentSubjectId" Type="Int32" />
                            <asp:Parameter Name="PortalNumber" Type="String" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="StudentSubjectId" Type="Int32" />
                            <asp:Parameter Name="PortalNumber" Type="String" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAddSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ShortName] FROM [TEMPSubject] ORDER BY [ShortName]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAddSession" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [SessionName] FROM [TEMPSession] WHERE CurrentSession = 'Y' ORDER BY [SessionName] DESC">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAddTerm" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [TermName] FROM [TEMPTerm] WHERE CurrentTerm = 'Y' ORDER BY [TermName]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
