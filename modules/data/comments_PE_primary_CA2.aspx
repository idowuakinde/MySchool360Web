<%@ Page Language="VB" AutoEventWireup="false" CodeFile="comments_PE_primary_CA2.aspx.vb" Inherits="modules_data_comments_PE_primary_CA2" %>

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
        <table border="0" width="980">
            <tr>
                <td>
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        
                            Text=":: Append Physical Education Comments (Primary School, AFTER the Mid-Term)"></asp:Label></td>
            </tr>
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvPEComments" runat="server" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        CssClass="noBorderedMenuTable" DataSourceID="dsSqlSubjects" 
                                        EmptyDataText="No student(s) found." EnableModelValidation="True" 
                                        ForeColor="#333333" GridLines="None" PageSize="1" Width="100%" 
                                        ShowFooter="True" 
                        DataKeyNames="PortalNumber">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="First" LastPageText="Last" 
                                            Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                                            Position="TopAndBottom" PreviousPageText="Previous" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFFBD6" Font-Bold="True" ForeColor="#333333" 
                                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                            VerticalAlign="Top" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                            HorizontalAlign="Left" />
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text="<%# serialNumber + 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ClassName" HeaderText="Class" 
                                                SortExpression="ClassName" >
                            </asp:BoundField>
                            <asp:BoundField DataField="PortalNumber" HeaderText="Portal #" 
                                SortExpression="PortalNumber" />
                            <asp:BoundField DataField="StudentNames" HeaderText="Student Names" 
                                SortExpression="StudentNames" />
                            <asp:TemplateField HeaderText="Comment (Physical Education ONLY)">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtPEComment" runat="server" Text='<%# Bind("Score_PE") %>' 
                                        Columns="80" CssClass="defaultFormElementStyle" Rows="3" 
                                        TextMode="MultiLine"></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="imgSaveConfirmation" runat="server" Height="15px" 
                                        ImageUrl="~/images/correct---Copy smaller.gif" Visible="False" Width="15px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="     Save     " 
                                ShowSelectButton="True">
                            <ControlStyle CssClass="defaultButtonStyle" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="dsSqlSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="  ">
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
