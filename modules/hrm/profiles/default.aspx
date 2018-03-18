<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="modules_profiles_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
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
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: My Profile"></asp:Label></td>
            </tr>
            <tr>
                <td>                </td>
                <td></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataSourceID="dsSqlStaffProfile" Height="50px" CssClass="borderedTableGrey" 
                    Width="500px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    BackColor="#000001" 
                    EmptyDataText="&lt;br /&gt;&lt;br /&gt;No staff records found&lt;br /&gt;&lt;br /&gt;&amp;nbsp;">
            <EmptyDataRowStyle BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="150px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="Usercode" HeaderText="Usercode" SortExpression="Usercode"
                    Visible="False" />
                <asp:BoundField DataField="Username" HeaderText="Username:" 
                    SortExpression="Username" ReadOnly="True">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Firstname" HeaderText="First Name:" SortExpression="Firstname">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Middlename" HeaderText="Middle Name:" SortExpression="Middlename">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Surname" HeaderText="Surname:" SortExpression="Surname">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Sex" HeaderText="Sex:" ReadOnly="True" SortExpression="Sex">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Date Of Birth:" SortExpression="DateOfBirth">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateOfBirth", "{0:D}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:BoundField DataField="MaritalStatus" HeaderText="Marital Status:" ReadOnly="True"
                    SortExpression="MaritalStatus">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="DepartmentName" HeaderText="Department:" SortExpression="DepartmentName">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email:" SortExpression="Email">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Telephone" HeaderText="Telephone:" SortExpression="Telephone">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="ResidenceStreet" HeaderText="Street Address:" SortExpression="ResidenceStreet">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="StateName" HeaderText="State:" SortExpression="StateName">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="CountryName" HeaderText="Country:" SortExpression="CountryName">
                    <HeaderStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <EditRowStyle Wrap="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Top" 
                BackColor="#FFFBD6" ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="dsSqlStaffProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="SELECT [Usercode], [Username], [DateOfBirth], [Email], [Telephone], [MaritalStatus], [Firstname], [Middlename], [Surname], [ResidenceStreet], [StateName], [CountryName], [Sex], [DepartmentName] FROM [VW_StaffProfiles] WHERE ([Username] = @Username)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Username" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>                </td>
          </tr>
          <tr>
            <td colspan="2"></td>
          </tr>
          </table>
      </div>
    </form>
</body>
</html>
