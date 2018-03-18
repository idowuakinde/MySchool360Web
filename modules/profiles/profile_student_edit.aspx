<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_student_edit.aspx.vb" Inherits="modules_profiles_profile_student_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" type="text/css" rel="stylesheet" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="880"  border="0" id="TABLE1">
            <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="225" align="left" valign="middle"><asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Edit Student Profile"></asp:Label></td>
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
            DataKeyNames="CustomerCode" DataSourceID="dsSqlEditStudent" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Edit" CellPadding="4" 
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
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                            Text='<%# Bind("CustomerCode") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Surname:" 
                    SortExpression="Surname">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditSurname" runat="server" Text='<%# Bind("LastName") %>' 
                            Columns="30" CssClass="defaultFormElementStyle"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vldEditSurname" runat="server" 
                            ControlToValidate="txtEditSurname" ErrorMessage="* Required" 
                            Font-Bold="True"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Fore Names:" 
                    SortExpression="OtherNames">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditOtherNames" runat="server" Text='<%# Bind("FirstName") %>' 
                            Columns="40" CssClass="defaultFormElementStyle"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vldEditOtherNames" runat="server" 
                            ControlToValidate="txtEditOtherNames" ErrorMessage="* Required" 
                            Font-Bold="True"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Date Of Birth:" 
                    SortExpression="DateOfBirth">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDateBirth_Month" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(this, dvNewStudent_ddlDateBirth_Day, dvNewStudent_ddlDateBirth_Year, dvNewStudent_lblBirthDate, hidBirthDate);" 
                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "MeterDate"), Date).Month %>'>
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
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateBirth_Month, this, dvNewStudent_ddlDateBirth_Year, dvNewStudent_lblBirthDate, hidBirthDate);" 
                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "MeterDate"), Date).Day %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateBirth_Year" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateBirth_Month, dvNewStudent_ddlDateBirth_Day, this, dvNewStudent_lblBirthDate, hidBirthDate);" SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "MeterDate"), Date).Year %>'>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2009</asp:ListItem>
                            <asp:ListItem>2008</asp:ListItem>
                            <asp:ListItem>2007</asp:ListItem>
                            <asp:ListItem>2006</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                            <asp:ListItem>2004</asp:ListItem>
                            <asp:ListItem>2003</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2000</asp:ListItem>
                            <asp:ListItem>1999</asp:ListItem>
                            <asp:ListItem>1998</asp:ListItem>
                            <asp:ListItem>1997</asp:ListItem>
                            <asp:ListItem>1996</asp:ListItem>
                            <asp:ListItem>1995</asp:ListItem>
                            <asp:ListItem>1994</asp:ListItem>
                            <asp:ListItem>1993</asp:ListItem>
                            <asp:ListItem>1992</asp:ListItem>
                            <asp:ListItem>1991</asp:ListItem>
                            <asp:ListItem>1990</asp:ListItem>
                            <asp:ListItem>1989</asp:ListItem>
                            <asp:ListItem>1988</asp:ListItem>
                            <asp:ListItem>1987</asp:ListItem>
                            <asp:ListItem>1986</asp:ListItem>
                            <asp:ListItem>1985</asp:ListItem>
                            <asp:ListItem>1984</asp:ListItem>
                            <asp:ListItem>1983</asp:ListItem>
                            <asp:ListItem>1982</asp:ListItem>
                            <asp:ListItem>1981</asp:ListItem>
                            <asp:ListItem>1980</asp:ListItem>
                            <asp:ListItem>1979</asp:ListItem>
                            <asp:ListItem>1978</asp:ListItem>
                            <asp:ListItem>1977</asp:ListItem>
                            <asp:ListItem>1976</asp:ListItem>
                            <asp:ListItem>1975</asp:ListItem>
                            <asp:ListItem>1974</asp:ListItem>
                            <asp:ListItem>1973</asp:ListItem>
                            <asp:ListItem>1972</asp:ListItem>
                            <asp:ListItem>1971</asp:ListItem>
                            <asp:ListItem>1970</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Eval("MeterDate") %>' EnableViewState="True"></asp:Label>
                        <input id="hidBirthDate" name="hidBirthDate" type="hidden" value='<%= birthDate_label.Text %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Gender:" 
                    SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditGender" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("SyncStatus") %>'>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="U">Unknown</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Class:" 
                    SortExpression="DistrictCode">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditClass" 
                            DataTextField="ClassDesc" DataValueField="ClassName" 
                            SelectedValue='<%# Bind("DistrictCode") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Student's Password:" 
                    SortExpression="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Password") %>' 
                            Columns="30"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;State (and Country) of Origin:">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlState" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditState" 
                            DataTextField="StateName" DataValueField="StateId" 
                            SelectedValue='<%# Bind("State") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Boarder?:" 
                    SortExpression="Boarder">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Activated") %>'>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                            <asp:ListItem Value="N" Selected="True">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Enrolment Test Score:" 
                    SortExpression="LastPmt">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LastPmt") %>' 
                            Columns="5" CssClass="defaultFormElementStyleRightAligned" ReadOnly="True"></asp:TextBox>/200
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PARENT DATA">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Father's E-mail, Telephone:" 
                    SortExpression="EmailAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmailAddress") %>' 
                            Columns="30"></asp:TextBox>
                        ,
                        <asp:TextBox ID="TextBox31" runat="server" Columns="30" 
                            Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Mother's E-mail, Telephone:" 
                    SortExpression="CurrentBal">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CurrentBal") %>' 
                            Columns="30"></asp:TextBox>
                        ,
                        <asp:TextBox ID="TextBox51" runat="server" Columns="30" 
                            Text='<%# Bind("Extension") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Parent's Password:" SortExpression="RA">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("RA") %>' Columns="30"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" UpdateText="Save Changes" />
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
        <asp:SqlDataSource ID="dsSqlEditStudent" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="STP_DATAENTRY_SELECT_Student" 
                    UpdateCommand="STP_DATAENTRY_UPDATE_Student" 
                    UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="PortalNumber" QueryStringField="a" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DistrictCode" Type="String" />
                <asp:Parameter Name="CustomerCode" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Activated" Type="String" />
                <asp:Parameter Name="CurrentBal" Type="String" />
                <asp:Parameter Name="LastPmt" Type="Int32" />
                <asp:Parameter Name="RA" Type="String" />
                <asp:Parameter Name="MeterDate" Type="DateTime" />
                <asp:Parameter Name="SyncStatus" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Extension" Type="String" />
                <asp:Parameter Name="State" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsSqlEditClass" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="SELECT [ClassId], [ClassName], [ClassName] AS ClassDesc FROM dbo.[TEMPClass] ORDER BY [ClassName]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsSqlEditState" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="SELECT a.[StateId], UPPER(b.CountryName + '  ---&gt;  ' + a.StateName) AS StateName FROM dbo.[Core_State] a INNER JOIN dbo.Core_Country b ON a.CountryId = b.CountryId ORDER BY StateName ">
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
