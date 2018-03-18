<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_staff_all.aspx.vb" Inherits="modules_profiles_profile_staff_all" %>

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
                        Text=":: All Staff Profiles"></asp:Label></td>
            </tr>
            <tr>
                <td>                </td>
                <td></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView5" runat="server" AllowSorting="True" 
                    CssClass="borderedTableGrey" DataSourceID="dsSqlStaffProfile" 
                    AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="Username" ForeColor="#333333" GridLines="None" PageSize="5" 
                    Width="1500px" EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Usercode" HeaderText="Usercode" 
                            SortExpression="Usercode" />
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" />
                        <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" 
                            SortExpression="DateOfBirth" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Telephone" HeaderText="Telephone" 
                            SortExpression="Telephone" />
                        <asp:BoundField DataField="MaritalStatus" HeaderText="MaritalStatus" 
                            ReadOnly="True" SortExpression="MaritalStatus" />
                        <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                            SortExpression="Firstname" />
                        <asp:BoundField DataField="Middlename" HeaderText="Middlename" 
                            SortExpression="Middlename" />
                        <asp:BoundField DataField="Surname" HeaderText="Surname" 
                            SortExpression="Surname" />
                        <asp:BoundField DataField="ResidenceStreet" HeaderText="ResidenceStreet" 
                            SortExpression="ResidenceStreet" />
                        <asp:BoundField DataField="StateName" HeaderText="StateName" 
                            SortExpression="StateName" />
                        <asp:BoundField DataField="CountryName" HeaderText="CountryName" 
                            SortExpression="CountryName" />
                        <asp:BoundField DataField="Sex" HeaderText="Sex" ReadOnly="True" 
                            SortExpression="Sex" />
                        <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" 
                            SortExpression="DepartmentName" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlStaffProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [Usercode], [Username], [DateOfBirth], [Email], [Telephone], [MaritalStatus], [Firstname], [Middlename], [Surname], [ResidenceStreet], [StateName], [CountryName], [Sex], [DepartmentName] FROM [VW_StaffProfiles] ">
                </asp:SqlDataSource>                </td>
          </tr>
          <tr>
            <td></td>
            <td>
                <hr color="black" /></td>
          </tr>
          <tr>
            <td colspan="2"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: Profile of Staff Selected Above"></asp:Label></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataSourceID="dsSqlStaffProfile0" Height="50px" CssClass="borderedTableGrey" 
                    Width="400px" AutoGenerateEditButton="True" CellPadding="4" DefaultMode="Edit" 
                    ForeColor="#333333" GridLines="None">
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="Usercode" HeaderText="Usercode" SortExpression="Usercode"
                    Visible="False" />
                <asp:BoundField DataField="Username" HeaderText="Username:" SortExpression="Username">
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
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
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
            </Fields>
            <EditRowStyle Wrap="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Top" 
                BackColor="#FFFBD6" ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="dsSqlStaffProfile0" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    
                    SelectCommand="SELECT [Usercode], [Username], [DateOfBirth], [Email], [Telephone], [MaritalStatus], [Firstname], [Middlename], [Surname], [ResidenceStreet], [StateName], [CountryName], [Sex], [DepartmentName] FROM [VW_StaffProfiles] WHERE ([Username] = @Username)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView5" Name="Username" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>                </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0">
              <tr>
                <td width="400px" valign="top">
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Skill Set of Staff Selected Above"></asp:Label>&nbsp;</td>
                <td valign="top">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Subject Specializations of Staff Selected Above"></asp:Label>&nbsp;</td>
                <td valign="top"><asp:Label ID="Label3" runat="server" Font-Bold="True" 
                        Font-Size="Small" Text=":: Notable Awards of Staff Selected Above"></asp:Label></td>
              </tr>
              <tr>
                <td width="400px" valign="top"><asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="UserSkillId" DataSourceID="dsSqlStaffSkills" Width="300px" 
                        EmptyDataText="No data." CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                  <Columns>
                      <asp:TemplateField HeaderText="S/N">
                          <ItemTemplate>
                              <asp:Label ID="Label4" runat="server" Text='<%# serialNumber+1 %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="UserSkillId" HeaderText="UserSkillId" InsertVisible="False"
                          ReadOnly="True" SortExpression="UserSkillId" Visible="False" />
                      <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"
                          Visible="False" />
                      <asp:BoundField DataField="SkillName" HeaderText="Skill" SortExpression="SkillName" />
                  </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                  <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />                
                    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
                  <asp:SqlDataSource ID="dsSqlStaffSkills" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [UserSkillId], [UserName], [SkillName] FROM [VW_StaffSkillSet] WHERE ([UserName] = @UserName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView5" Name="UserName" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                  </asp:SqlDataSource>                </td>
                <td width="400px" valign="top"><asp:GridView ID="GridView3" runat="server" 
                        AutoGenerateColumns="False" CssClass="borderedTableGrey" 
                        DataSourceID="dsSqlStaffSubjects" Width="300px" EmptyDataText="No data." 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# serialSubjects+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserSubjectId" HeaderText="UserSubjectId" InsertVisible="False"
                            ReadOnly="True" SortExpression="UserSubjectId" Visible="False" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"
                            Visible="False" />
                        <asp:BoundField DataField="SubjectName" HeaderText="Subject" SortExpression="SubjectName" />
                    </Columns>
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlStaffSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [UserSubjectId], [UserName], [SubjectName] FROM [VW_StaffSubjects] WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView5" Name="UserName" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>                </td>
                <td valign="top"><asp:GridView ID="GridView4" runat="server" 
                        AutoGenerateColumns="False" CssClass="borderedTableGrey" 
                        DataSourceID="dsSqlStaffAwards" Width="400px" EmptyDataText="No data." 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# serialAwards+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserAwardId" HeaderText="UserAwardId" InsertVisible="False"
                            ReadOnly="True" SortExpression="UserAwardId" Visible="False" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"
                            Visible="False" />
                        <asp:BoundField DataField="AwardName" HeaderText="Award" SortExpression="AwardName" />
                        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                        <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                        <asp:BoundField DataField="Internal" HeaderText="Internal?" SortExpression="Internal" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlStaffAwards" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [UserAwardId], [UserName], [AwardName], [Year], [Class], [Internal] FROM [VW_StaffAwards] WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView5" Name="UserName" 
                                PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                  </asp:SqlDataSource></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
