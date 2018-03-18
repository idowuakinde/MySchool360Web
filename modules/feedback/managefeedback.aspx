<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managefeedback.aspx.vb" Inherits="modules_feedback_managefeedback" %>

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
            <td colspan="2"><asp:Label ID="lblHeader" runat="server" 
                    Text=":: Feedback Message Log" Font-Bold="True" Font-Size="Small"></asp:Label></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
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
                    <ItemTemplate>
                        <br />
                    </ItemTemplate>
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
        <asp:SqlDataSource ID="dsSqlFeedback" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
            SelectCommand="SELECT [FeedbackId], [MatricNumber], Sender, [Class], [StudentName], [Sex], [FeedbackCategory], [FeedbackMessage], [TimeStamp], [Status], [ClosingTimeStamp] FROM dbo.[VW_Feedback] WHERE ([Class] = (SELECT ClassName FROM dbo.TEMPClass WHERE Teacher = @Username)) ORDER BY [TimeStamp] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="Username" QueryStringField="a" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
