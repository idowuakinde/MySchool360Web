<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_student_new.aspx.vb" Inherits="modules_profiles_profile_student_new" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" media="screen, print" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="880"  border="0" id="TABLE1">
            <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="225" align="left" valign="middle"><asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Enrol New Student"></asp:Label></td>
                            <td align="left" valign="middle"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                        </tr>
                </table></td>
            </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td>
        <table width="100%" border="0">
          <tr>
            <td width="150" valign="top">
                <a>
                    <asp:Image Imageurl='' ID="imgPhoto" 
                    runat="server" BorderStyle="Solid" BorderWidth="2px" Height="140px" 
                    Width="140px" 
                    ToolTip="Passport Photograph..." EnableViewState="False" /></a>
                <br />
                <asp:FileUpload ID="filePassport" runat="server" 
                                        Width="250px" />
                <br />
                <asp:Button ID="btnPassport" runat="server" CssClass="defaultButtonStyle" 
                    Text=" Upload &gt; " ToolTip="Click me to upload another picture..." 
                    ValidationGroup="grpPhotoUpload" />
                &nbsp;<asp:Button ID="btnRemove" runat="server" CssClass="defaultButtonStyle" 
                    Text=" Remove " ToolTip="Click me to remove current picture..." 
                    ValidationGroup="grpPhotoUpload" />
            </td>
            <td valign="bottom" align="left">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
        </table>
              </td>
          </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td>
        <asp:DetailsView ID="dvNewStudent" runat="server" AutoGenerateRows="False"
            DataKeyNames="CustomerId" DataSourceID="dsSqlAddStudent" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Insert" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="800px" 
                    EnableModelValidation="True">
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" 
                VerticalAlign="Top" />
            <HeaderTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# "PORTAL NUMBER: " & portalNumber %>'></asp:Label>
            </HeaderTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <Fields>
                <asp:TemplateField HeaderText="PERSONAL DATA">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Portal Number:" 
                    SortExpression="MatricNumber">
                    <InsertItemTemplate>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                            Text="<%# portalNumber %>"></asp:Label>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Surname:" 
                    SortExpression="Surname">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAddSurname" runat="server" Text='<%# Bind("LastName") %>' 
                            Columns="30" CssClass="defaultFormElementStyle"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vldAddSurname" runat="server" 
                            ControlToValidate="txtAddSurname" ErrorMessage="* Required" 
                            Font-Bold="True"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Fore Names:" 
                    SortExpression="OtherNames">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAddOtherNames" runat="server" Text='<%# Bind("FirstName") %>' 
                            Columns="40" CssClass="defaultFormElementStyle"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vldAddOtherNames" runat="server" 
                            ControlToValidate="txtAddOtherNames" ErrorMessage="* Required" 
                            Font-Bold="True"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Date Of Birth:" 
                    SortExpression="DateOfBirth">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlDateBirth_Month" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(this, dvNewStudent_ddlDateBirth_Day, dvNewStudent_ddlDateBirth_Year, dvNewStudent_lblBirthDate, hidBirthDate);">
                            <asp:ListItem Value="1">January</asp:ListItem>
                            <asp:ListItem Value="2">February</asp:ListItem>
                            <asp:ListItem Value="3">March</asp:ListItem>
                            <asp:ListItem Value="4">April</asp:ListItem>
                            <asp:ListItem Value="5">May</asp:ListItem>
                            <asp:ListItem Value="6">June</asp:ListItem>
                            <asp:ListItem Value="7">July</asp:ListItem>
                            <asp:ListItem Value="8">August</asp:ListItem>
                            <asp:ListItem Value="9">September</asp:ListItem>
                            <asp:ListItem Value="10">October</asp:ListItem>
                            <asp:ListItem Value="11">November</asp:ListItem>
                            <asp:ListItem Value="12">December</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateBirth_Day" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateBirth_Month, this, dvNewStudent_ddlDateBirth_Year, dvNewStudent_lblBirthDate, hidBirthDate);">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateBirth_Year" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateBirth_Month, dvNewStudent_ddlDateBirth_Day, this, dvNewStudent_lblBirthDate, hidBirthDate);">
                        </asp:DropDownList>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Eval("DateOfBirth") %>' EnableViewState="True"></asp:Label>
                        <input id="hidBirthDate" name="hidBirthDate" type="hidden" value='<%= birthDate_label.Text %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Gender:" 
                    SortExpression="Gender">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlAddGender" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("SyncStatus") %>'>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Class:" 
                    SortExpression="DistrictCode">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddClass" 
                            DataTextField="ClassDesc" DataValueField="ClassName" 
                            SelectedValue='<%# Bind("DistrictCode") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;State (and Country) of Origin:">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlState" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditState" 
                            DataTextField="StateName" DataValueField="StateId" 
                            SelectedValue='<%# Bind("State") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Boarder?:" 
                    SortExpression="Boarder">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Activated") %>'>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                            <asp:ListItem Value="N" Selected="True">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Enrolment Test Score:" 
                    SortExpression="LastPmt">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LastPmt") %>' 
                            Columns="5" ReadOnly="True"></asp:TextBox>/200
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PARENT DATA">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Father's E-mail, Telephone:" 
                    SortExpression="EmailAddress">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmailAddress") %>' 
                            Columns="30"></asp:TextBox>
                        ,
                        <asp:TextBox ID="TextBox31" runat="server" Columns="30" 
                            Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Mother's E-mail, Telephone:" 
                    SortExpression="CurrentBal">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CurrentBal") %>' 
                            Columns="30"></asp:TextBox>
                        ,
                        <asp:TextBox ID="TextBox51" runat="server" Columns="30" 
                            Text='<%# Bind("Extension") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                    HeaderStyle-Height="25px" HeaderStyle-VerticalAlign="Middle" 
                    InsertText="Add New Student" >
                    <HeaderStyle VerticalAlign="Middle" Height="25px"></HeaderStyle>
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:CommandField>
            </Fields>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                Font-Size="Medium" Height="35px" HorizontalAlign="Center" 
                VerticalAlign="Middle" />
            <EditRowStyle Wrap="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Middle" 
                BackColor="#FFFBD6" ForeColor="#333333" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsSqlAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="STP_DATAENTRY_SELECTALL_Student"                     
                    InsertCommand="STP_DATAENTRY_INSERT_Student" 
                    InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="DistrictCode" Type="String" />
                <asp:Parameter Name="CustomerCode" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="Activated" Type="String" />
                <asp:Parameter Name="CurrentBal" Type="String" />
                <asp:Parameter Name="LastPmt" Type="Int32" />
                <asp:Parameter Name="MeterDate" Type="DateTime" />
                <asp:Parameter Name="SyncStatus" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlAddClass" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT [ClassId], [ClassName], [ClassName] AS ClassDesc FROM dbo.[TEMPClass] ORDER BY [ClassName]">
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsSqlEditState" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="SELECT a.[StateId], UPPER(b.CountryName + '  ---&gt;  ' + a.StateName) AS StateName FROM dbo.[Core_State] a INNER JOIN dbo.Core_Country b ON a.CountryId = b.CountryId ORDER BY StateName ">
        </asp:SqlDataSource>
              </td>
          </tr>
            <tr>
                <td colspan="2">&nbsp;
                    </td>
            </tr>
            </table>
      </div>
    </form>
</body>
</html>
