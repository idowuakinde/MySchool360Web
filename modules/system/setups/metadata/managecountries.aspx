<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managecountries.aspx.vb" Inherits="modules_system_setups_metadata_managecountries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Edit Countries"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        AutoGenerateEditButton="True" AutoGenerateSelectButton="True" CssClass="noBorderedMenuTable"
                        DataKeyNames="CountryId" DataSourceID="dsSqlCountries" AllowPaging="True" 
                        PageSize="50" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        Width="800px" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="CountryId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="CountryId" />
                            <asp:BoundField DataField="CountryName" HeaderText="Country" 
                                SortExpression="CountryName" />
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlCountries" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="DELETE FROM [Core_Country] WHERE [CountryId] = @CountryId" InsertCommand="INSERT INTO [Core_Country] ([CountryName]) VALUES (@CountryName)"
                        SelectCommand="SELECT [CountryId], [CountryName] FROM [Core_Country] ORDER BY [CountryName]"
                        UpdateCommand="UPDATE [Core_Country] SET [CountryName] = @CountryName WHERE [CountryId] = @CountryId">
                        <DeleteParameters>
                            <asp:Parameter Name="CountryId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CountryName" Type="String" />
                            <asp:Parameter Name="CountryId" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CountryName" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
