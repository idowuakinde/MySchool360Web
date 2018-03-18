<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sendfeedback.aspx.vb" Inherits="modules_feedback_sendfeedback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
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
                        Text=":: Send a new Feedback Message"></asp:Label></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataSourceID="dsSqlFeedback" Height="50px" CssClass="borderedTableGrey" 
                    DefaultMode="Insert" Width="700px" CellPadding="4" EnableModelValidation="True" 
                    ForeColor="#333333" GridLines="None">
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" />
            <Fields>
                <asp:BoundField DataField="FeedbackId" HeaderText="FeedbackId" InsertVisible="False"
                    ReadOnly="True" SortExpression="FeedbackId" />
                <asp:TemplateField HeaderText="Portal Number:" SortExpression="MatricNumber">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlPortalNumber" 
                            DataTextField="StudentFullName" DataValueField="PortalNumber" 
                            SelectedValue='<%# Bind("MatricNumber") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlPortalNumber" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT CustomerCode as PortalNumber, CustomerCode + ' (' + FirstName + ' ' + Lastname + ')' as StudentFullName FROM dbo.TEMPCustomers WHERE CustomerCode = @PortalNumber">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="PortalNumber" QueryStringField="a" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# portalNumber %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Feedback Category:" SortExpression="FeedbackCategory">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="defaultFormElementStyle"
                            DataSourceID="dsSqlFeedbackCategories" 
                            DataTextField="FeedbackCategoryName" DataValueField="FeedbackCategoryId" 
                            SelectedValue='<%# Bind("FeedbackCategoryId") %>'>
                        </asp:DropDownList><asp:SqlDataSource ID="dsSqlFeedbackCategories" runat="server"
                            ConnectionString="<%$ ConnectionStrings:iTecon_School %>" SelectCommand="SELECT [FeedbackCategoryId], [FeedbackCategoryName] FROM [TEMPFeedbackCategory] ORDER BY [FeedbackCategoryName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FeedbackCategory") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Feedback Message:" SortExpression="FeedbackMessage">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FeedbackText") %>' 
                            Columns="70" CssClass="defaultFormElementStyle" Rows="10" 
                            TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("FeedbackMessage") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem Value="New">New</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" InsertText="Submit" 
                    ShowInsertButton="True" />
            </Fields>
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <EditRowStyle Wrap="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Top" 
                BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsSqlFeedback" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
            SelectCommand="SELECT [FeedbackId], Sender, [MatricNumber], [Class], [StudentName], [Sex], [FeedbackCategory], [FeedbackMessage], [TimeStamp], [Status], [ClosingTimeStamp] FROM dbo.[VW_Feedback] WHERE ([MatricNumber] = @MatricNumber) ORDER BY [TimeStamp] DESC" InsertCommand="STP_METADATA_INSERT_FEEDBACK" InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Direction="InputOutput" Name="FeedbackId" Type="Int32" />
                <asp:Parameter Name="MatricNumber" Type="String" />
                <asp:Parameter Name="FeedbackCategoryId" Type="Int32" />
                <asp:Parameter Name="FeedbackText" Type="String" />
                <%--<asp:Parameter Name="TimeStamp" Type="DateTime" />--%>
                <asp:Parameter Name="Status" Type="String" />
                <%--<asp:Parameter Name="ClosingTimeStamp" Type="DateTime" />--%>
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;</td>
          </tr>
            <tr>
                <td>
                </td>
                <td>
        <hr color="black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="lblHeader" runat="server" Text=":: Feedback Message History" 
                        Font-Bold="True" Font-Size="Small"></asp:Label></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:GridView ID="gvUsers" runat="server" CssClass="borderedTableGrey" PageSize="30" 
                    DataSourceID="dsSqlFeedback" AllowSorting="True" 
                    EmptyDataText="&lt;br /&gt;&lt;br /&gt;No records found.&lt;br /&gt;&lt;br /&gt;&amp;nbsp;" 
                    Width="100%" AutoGenerateColumns="False" CellPadding="4" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" >
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sent On" SortExpression="TimeStamp">
                    <ItemTemplate>
                        <%--<asp:Label ID="Label1" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container, "TimeStamp"), Date)).ToString %>'></asp:Label>--%>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("TimeStamp") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Sender" HeaderText="From" SortExpression="Sender" />
                <asp:BoundField DataField="FeedbackCategory" HeaderText="Message Type" 
                    SortExpression="FeedbackCategory" />
                <asp:BoundField DataField="FeedbackMessage" HeaderText="Message Text" 
                    SortExpression="FeedbackMessage" >
                <ItemStyle Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                <asp:BoundField DataField="StudentName" HeaderText="Student Concerned" 
                    SortExpression="StudentName" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="MatricNumber" HeaderText="Portal #" 
                    SortExpression="MatricNumber" />
                <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                <asp:BoundField DataField="Sex" HeaderText="Gender" SortExpression="Sex" />
                <asp:BoundField DataField="ClosingTimeStamp" HeaderText="ClosingTimeStamp" 
                    SortExpression="ClosingTimeStamp" Visible="False" />
            </Columns>
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle HorizontalAlign="Left" BackColor="#990000" Font-Bold="True" 
                ForeColor="White" />
        </asp:GridView>
                &nbsp; &nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
