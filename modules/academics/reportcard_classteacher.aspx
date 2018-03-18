<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reportcard_classteacher.aspx.vb" Inherits="modules_academics_reportcard_classteacher" %>

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
            <td colspan="2"><asp:Label CssClass="pageHeaderStyleAMMA" Font-Bold="True" Font-Size="Small" ID="Label10" runat="server" Text=":: Students' Report Card Manager for Class Teachers"></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataSourceID="dsSqlReportCard" EmptyDataText="No data." Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="ReportHeaderId">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ReportHeaderId" HeaderText="Id" InsertVisible="False"
                            ReadOnly="True" SortExpression="ReportHeaderId" >
                            <ItemStyle Width="15px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" >
                            <ItemStyle Width="60px" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PortalNumber" HeaderText="Portal Number" ReadOnly="True"
                            SortExpression="PortalNumber" >
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="House Points" SortExpression="HousePoints">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Columns="5" CssClass="defaultFormElementStyle"
                                    Text='<%# Bind("HousePoints") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("HousePoints") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Merits" SortExpression="Merits">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Columns="5" CssClass="defaultFormElementStyle"
                                    Text='<%# Bind("Merits") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Merits") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Demerits" SortExpression="Demerits">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Columns="5" CssClass="defaultFormElementStyle"
                                    Text='<%# Bind("Demerits") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Demerits") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Late Days" SortExpression="DaysLate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Columns="5" CssClass="defaultFormElementStyle"
                                    Text='<%# Bind("DaysLate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("DaysLate") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Absent Days" SortExpression="DaysAbsent">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Columns="5" CssClass="defaultFormElementStyle"
                                   Text='<%# Bind("DaysAbsent") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("DaysAbsent") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Form Tutor Comments" SortExpression="FormTutorComments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Columns="30" CssClass="defaultFormElementStyle"
                                    Rows="5" Text='<%# Bind("FormTutorComments") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("FormTutorComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boarding House Comments" SortExpression="BoardingHouseComments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="30" CssClass="defaultFormElementStyle"
                                    Rows="5" Text='<%# Bind("BoardingHouseComments") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("BoardingHouseComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle VerticalAlign="Top" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlReportCard" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="STP_CORE_SELECTALL_TEMPReportHeader" DeleteCommand="STP_CORE_DELETE_TEMPReportHeader" DeleteCommandType="StoredProcedure" InsertCommand="STP_CORE_INSERT_TEMPReportHeader" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="STP_CORE_UPDATE_TEMPReportHeader" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ReportHeaderId" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ReportHeaderId" Type="Int32" />
<%--                    <asp:Parameter Name="TermId" Type="Int32" />  --%> 
<%--                    <asp:Parameter Name="PortalNumber" Type="String" />  --%>
                        <asp:Parameter Name="HousePoints" Type="Int32" />
                        <asp:Parameter Name="Merits" Type="Int32" />
                        <asp:Parameter Name="Demerits" Type="Int32" />
                        <asp:Parameter Name="DaysLate" Type="Int32" />
                        <asp:Parameter Name="DaysAbsent" Type="Int32" />
                        <asp:Parameter Name="FormTutorComments" Type="String" />
                        <asp:Parameter Name="BoardingHouseComments" Type="String" />
<%--                        <asp:Parameter Name="TimeStamp" Type="DateTime" />
                        <asp:Parameter Name="Published" Type="String" />
--%>                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Direction="InputOutput" Name="ReportHeaderId" Type="Int32" />
                        <asp:Parameter Name="TermId" Type="Int32" />
                        <asp:Parameter Name="PortalNumber" Type="String" />
                        <asp:Parameter Name="HousePoints" Type="Int32" />
                        <asp:Parameter Name="Merits" Type="Int32" />
                        <asp:Parameter Name="Demerits" Type="Int32" />
                        <asp:Parameter Name="DaysLate" Type="Int32" />
                        <asp:Parameter Name="DaysAbsent" Type="Int32" />
                        <asp:Parameter Name="FormTutorComments" Type="String" />
                        <asp:Parameter Name="BoardingHouseComments" Type="String" />
                        <asp:Parameter Name="TimeStamp" Type="DateTime" />
                        <asp:Parameter Name="Published" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;</td>
          </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
      </table>
      </div>
    </form>
</body>
</html>
