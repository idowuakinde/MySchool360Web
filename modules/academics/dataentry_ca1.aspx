﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dataentry_ca1.aspx.vb" Inherits="modules_academics_dataentry_ca1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
				    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Data Entry Page (Subject by Subject) for "></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
            <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="MatricNumber" DataSourceID="dsoUsers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        SelectedIndex="0" EmptyDataText="No records to display." 
                        EnableModelValidation="True" >
            <Columns>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serialNumber %>"></asp:Label>
                    </ItemTemplate>
                     <ItemStyle Width="20px" />
               </asp:TemplateField>
                <asp:TemplateField HeaderText="Portal No." SortExpression="MatricNumber">
                    <EditItemTemplate>
                        <asp:Label ID="TextBox47" runat="server" Text='<%# Bind("MatricNumber") %>'></asp:Label>
                   </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label49" runat="server" Text='<%# Bind("MatricNumber") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Image ID="Image1" runat="server" Height="30px" ToolTip="Click to enlarge." 
                            ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & ".jpg")) %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" /><br /><asp:Label ID="Label49_2" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "CustomerName").ToString.ToUpper %>'></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:CommandField SelectText="Add/Edit Scores" ShowSelectButton="True">
                <ItemStyle Width="100px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="SCORES">
                    <ItemTemplate>
                        <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" 
                            AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
                            AutoGenerateSelectButton="True" CellPadding="4" CssClass="noBorderedMenuTable" 
                            DataKeyNames="FormOrderDetailId" DataSourceID="dsSqlGetDetail" 
                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No record(s) to display.&lt;br /&gt;&amp;nbsp;" 
                            ForeColor="#333333" GridLines="None" Visible="False" Width="600px" 
                            Font-Bold="False" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="FormOrderDetailId" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="FormOrderDetailId" />
                                <asp:TemplateField HeaderText="FormOrderHeaderId" 
                                    SortExpression="FormOrderHeaderId" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("FormOrderHeaderId") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label50" runat="server" Text='<%# Bind("FormOrderHeaderId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject" SortExpression="ShortName">
                                    <EditItemTemplate>
                                        <asp:Label ID="TextBox48" runat="server" Text='<%# Eval("ShortName") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label51" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score Obtained" SortExpression="SubjectScore">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox49" runat="server" Columns="7" CssClass="defaultFormElementStyle" Text='<%# Bind("SubjectScore") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label52" runat="server" Text='<%# Bind("SubjectScore") %>'></asp:Label>
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
                            Text=":: Add a New Subject Score" Visible="False"></asp:Label>
                        <br />
                        <asp:DetailsView ID="dvSubjectScore" runat="server" CellPadding="4" 
                            ForeColor="#333333" GridLines="None" Height="50px" Width="600px" 
                            AutoGenerateRows="False" DataKeyNames="FormOrderDetailId" 
                            DataSourceID="dsSqlGetDetail" DefaultMode="Insert" Visible="False" 
                            OnItemInserted="DetailsViewItemInserted" EnableModelValidation="True">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="FormOrderDetailId" HeaderText="FormOrderDetailId" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="FormOrderDetailId" />
                                <asp:TemplateField HeaderText="This result pertains to:" 
                                    SortExpression="FormOrderHeaderId">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlResultDetails" 
                                            DataTextField="ResultDesc" DataValueField="FormOrderHeaderId" 
                                            SelectedValue='<%# Bind("FormOrderHeaderId") %>'>
                                        </asp:DropDownList>                                        
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectId">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                            DataTextField="ShortName" DataValueField="SubjectId" 
                                            SelectedValue='<%# Bind("SubjectId") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT [SubjectId], [ShortName] FROM [TEMPSubject]">
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score:" SortExpression="SubjectScore">
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubjectScore") %>' 
                                            Columns="10"></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Skip?" SortExpression="Field1">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" 
                                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Field1") %>'>
                                            <asp:ListItem Value="N">No</asp:ListItem>
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="350px" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <br />
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
                    <asp:SqlDataSource ID="dsSqlGetDetail" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand=" SELECT a.FormOrderDetailId, a.FormOrderHeaderId, a.SubjectId, b.SubjectName, b.ShortName, a.SubjectScore FROM dbo.TEMPFormOrderDetail a INNER JOIN dbo.TEMPSubject b ON a.SubjectId = b.SubjectId INNER JOIN dbo.TEMPFormOrderHeader c ON a.FormOrderHeaderId = c.FormOrderHeaderId WHERE c.PortalNumber = @PortalNumber AND c.TermId = @TermId " 
                        DeleteCommand="STP_DATAENTRY_DELETE_TEMPFormOrderDetail" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_DATAENTRY_INSERT_TEMPFormOrderDetail" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_DATAENTRY_UPDATE_TEMPFormOrderDetail" 
                        UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaster" Name="PortalNumber" PropertyName="SelectedValue" />
                            <asp:QueryStringParameter Name="TermId" QueryStringField="c" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="FormOrderDetailId" Type="Int64" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FormOrderDetailId" Type="Int64" />
<%--                            <asp:Parameter Name="FormOrderHeaderId" Type="Int64" />
                            <asp:Parameter Name="SubjectId" Type="Int32" />
--%>                            <asp:Parameter Name="SubjectScore" Type="Decimal" />
<%--                            <asp:Parameter Name="Field1" Type="String" />
                            <asp:Parameter Name="Field2" Type="String" />
                            <asp:Parameter Name="Field3" Type="String" />
--%>                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="FormOrderDetailId" Type="Int64" />
                            <asp:Parameter Name="FormOrderHeaderId" Type="Int64" />
                            <asp:Parameter Name="SubjectId" Type="Int32" />
                            <asp:Parameter Name="SubjectScore" Type="Decimal" />
                            <asp:Parameter Name="Field1" Type="String" />
                            <asp:Parameter Name="Field2" Type="String" />
                            <asp:Parameter Name="Field3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsoUsers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                                    SelectCommand="">
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
