<%@ Page Language="VB" AutoEventWireup="false" CodeFile="edit_staff.aspx.vb" Inherits="modules_hr_edit_staff" %>

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
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
          <tr>
            <td colspan="2"><asp:Label ID="lblHeader" runat="server" Text=":: Edit Staff Records, or <a href='../../system/setups/users/default.aspx'><font color='red'>Add New</font></a> Staff" Font-Bold="True" Font-Size="Small"></asp:Label></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td valign="middle">
                      <b>Find:</b>
                      <asp:TextBox ID="txtSearch" runat="server" Columns="50" 
                          CssClass="defaultFormElementStyle"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSearch" runat="server" CssClass="defaultButtonStyle" 
                          Text="   Search >   " /></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>
        <asp:GridView ID="gvUsers" runat="server" CssClass="noBorderedMenuTable" 
                    AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                    DataKeyNames="StaffId" DataSourceID="dsoUsers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="6000px" 
                    PageSize="50" 
                    
                    
                    EmptyDataText="&lt;br /&gt;&lt;br /&gt;No staff records found&lt;br /&gt;&lt;br /&gt;&amp;nbsp;" 
                    EnableModelValidation="True" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="hLink_NewStaff" runat="server" Font-Bold="True" 
                            NavigateUrl="../../system/setups/users/default.aspx" ForeColor="Red">New</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label999" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "StaffCode").ToString & "','Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                        <asp:Image ID="Image1" runat="server" Height="30px" 
                            ImageUrl='<%# "~\images\pp_staff\" & Databinder.Eval(Container.DataItem, "StaffCode").ToString & ".jpg" %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StaffId" HeaderText="Staff Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="StaffId" />
                <asp:TemplateField HeaderText="Staff Code" SortExpression="StaffCode">
                    <EditItemTemplate>
                        <asp:Label ID="TextBox1" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                   </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Surname" SortExpression="Surname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Surname") %>' 
                            Columns="20"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Other Names" SortExpression="OtherNames">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("OtherNames") %>' 
                            Columns="30"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("OtherNames") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList16" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Common.GetMaleOrFemale(Databinder.Eval(Container.DataItem, "Gender").ToString) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Birth" SortExpression="DateOfBirth">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateOfBirth"), Date)) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Marital Status" SortExpression="MaritalStatus">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1_2" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("MaritalStatus") %>'>
                            <asp:ListItem Value="D">Divorced</asp:ListItem>
                            <asp:ListItem Value="M">Married</asp:ListItem>
                            <asp:ListItem Value="S">Single</asp:ListItem>
                            <asp:ListItem Value="W">Widowed</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Common.GetFullMaritalStatus(Databinder.Eval(Container.DataItem, "MaritalStatus").ToString) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Wedding Date" SortExpression="WeddingDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("WeddingDate")  %>'> (Please leave this value as is ("1/1/1900 12:00:00 AM") if you're not married)</asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "WeddingDate"), Date)) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Religion" SortExpression="ReligionId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList17" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlReligions" 
                            DataTextField="ReligionName" DataValueField="ReligionId" 
                            SelectedValue='<%# Bind("ReligionId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlReligions" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [ReligionId], [ReligionName] FROM [HR_Religion] ORDER BY [ReligionName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label21" runat="server" Text='<%# Bind("ReligionName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Telephone" SortExpression="Telephone">
                    <EditItemTemplate>
                        0<asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Telephone") %>' 
                            Columns="30"></asp:TextBox>
                        <br />
                        (Please leave out the first zero, e.g. 8023801506)
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label20" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Email") %>' 
                            Columns="30"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Residential Address" SortExpression="Residence">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Residence") %>' 
                            Columns="30" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("Residence") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Permanent Residence" 
                    SortExpression="PermanentResidence">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox19" runat="server" 
                            Text='<%# Bind("PermanentResidence") %>' Columns="30" Rows="3" 
                            TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label19" runat="server" Text='<%# Bind("PermanentResidence") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Home Town" SortExpression="Hometown">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("BankId") %>' 
                            Columns="30"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label24" runat="server" Text='<%# Bind("BankId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LGA of Origin" SortExpression="LGAOfOriginId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList18" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlLGAs" 
                            DataTextField="LgaName" DataValueField="LgaId" 
                            SelectedValue='<%# Bind("LGAOfOriginId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlLGAs" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [LgaId], ' (' + [StateName] + ') ' + [LgaName] + ' LGA' AS LgaName FROM [Core_Lga] a INNER JOIN [Core_State] b ON a.StateId = b.StateId ORDER BY [LgaName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label23" runat="server" Text='<%# Bind("LgaName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Employment" 
                    SortExpression="DateOfEmployment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" 
                            Text='<%# Bind("DateOfEmployment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateOfEmployment"), Date)) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" SortExpression="Department">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList19" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlDepartments2" 
                            DataTextField="DepartmentName" DataValueField="DepartmentId" 
                            SelectedValue='<%# Bind("Department") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlDepartments2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT left(DepartmentName, charindex('.', DepartmentName) - 1) as DepartmentId, DepartmentName FROM [Core_Department] ORDER BY [DepartmentName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location" SortExpression="LocationId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList20" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocations2" 
                            DataTextField="LocationName" DataValueField="LocationId" 
                            SelectedValue='<%# Bind("LocationId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlLocations2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [LocationId], [LocationName] FROM [HR_Location] ORDER BY [LocationName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("LocationName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Designation" SortExpression="DesignationId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList21" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlDesignations2" 
                            DataTextField="DesignationName" DataValueField="DesignationId" 
                            SelectedValue='<%# Bind("DesignationId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlDesignations2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [DesignationId], [DesignationName] FROM [HR_Designation] ORDER BY [DesignationName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("DesignationName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Grade Level" SortExpression="JobLevelId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList22" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlJoblevels2" 
                            DataTextField="JobLevelName" DataValueField="JobLevelId" 
                            SelectedValue='<%# Bind("JobLevelId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlJoblevels2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [JobLevelId], [JobLevelName] FROM [HR_JobLevel] ORDER BY [JobLevelName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("JobLevelName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Confirmed?" 
                    SortExpression="ConfirmationStatus">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList23" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("ConfirmationStatus") %>'>
                            <asp:ListItem Value="C">Confirmed</asp:ListItem>
                            <asp:ListItem Value="P">Probation</asp:ListItem>
                            <asp:ListItem Value="U">Unconfirmed</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Common.GetConfirmationStatus(Databinder.Eval(Container.DataItem, "ConfirmationStatus").ToString) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Retired?" 
                    SortExpression="RetirementStatus">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList24" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("RetirementStatus") %>'>
                            <asp:ListItem Value="N">No</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "RetirementStatus").ToString) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Area of Interest" 
                    SortExpression="AreaOfInterest">
                    <ItemTemplate>
                        <asp:Label ID="Label41" runat="server" 
                            Text='<%# Bind("AreaofInterest") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox47" runat="server" Columns="20" 
                            CssClass="defaultFormElementStyle" Text='<%# Bind("AreaOfInterest") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Preferred Bank" SortExpression="BankId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList25" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlBanks2" 
                            DataTextField="BankName" DataValueField="BankId" 
                            SelectedValue='<%# Bind("BankId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlBanks2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [BankId], [ShortName] + ' (' + [BankName] + ')' AS BankName FROM [HR_Bank] ORDER BY [ShortName]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label43" runat="server" Text='<%# Bind("BankName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Account Number" 
                    SortExpression="BankAccountNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox43" runat="server" Columns="30" 
                            Text='<%# Bind("BankAccountNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label44" runat="server" Text='<%# Bind("BankAccountNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Max. Medical Allowance" 
                    SortExpression="MaxMedical">
                    <EditItemTemplate>
                        N
                        <asp:TextBox ID="TextBox44" runat="server" Columns="10" 
                            Text='<%# Bind("MaxMedical") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label45" runat="server" Text='<%# Bind("MaxMedical") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Co-op Monthly Deduction" 
                    SortExpression="Coop_MonthlyDeduction" Visible="False">
                    <EditItemTemplate>
                        N
                        <asp:TextBox ID="TextBox37" runat="server" 
                            Text='<%# Bind("Coop_MonthlyDeduction") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label37" runat="server" 
                            Text='<%# Bind("Coop_MonthlyDeduction") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Co-op Loan Repayment Amount" 
                    SortExpression="Coop_LoanRepayment" Visible="False">
                    <EditItemTemplate>
                        N
                        <asp:TextBox ID="TextBox38" runat="server" 
                            Text='<%# Bind("Coop_LoanRepayment") %>' Columns="10"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label38" runat="server" Text='<%# Bind("Coop_LoanRepayment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Blood Group" SortExpression="BloodGroup">
                    <ItemTemplate>
                        <asp:Label ID="Label39" runat="server" Text='<%# Bind("BloodGroup") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox48" runat="server" Columns="5" 
                            CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("BloodGroup") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Genotype" SortExpression="Genotype">
                    <ItemTemplate>
                        <asp:Label ID="Label33" runat="server" Text='<%# Bind("Genotype") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox49" runat="server" Columns="5" 
                            CssClass="defaultFormElementStyle" Text='<%# Bind("Genotype") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Eye Colour" SortExpression="EyeColour">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList28" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("EyeColour") %>'>
                            <asp:ListItem>Black</asp:ListItem>
                            <asp:ListItem>Blue</asp:ListItem>
                            <asp:ListItem>Brown</asp:ListItem>
                            <asp:ListItem>Green</asp:ListItem>
                            <asp:ListItem>Grey</asp:ListItem>
                            <asp:ListItem>Red</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label27" runat="server" Text='<%# Bind("EyeColour") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Physically Challenged?" SortExpression="Visa">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList24_2" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("Visa") %>'>
                            <asp:ListItem Value="N">No</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "Visa").ToString) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Height" SortExpression="Height">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Height") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;<br />
                        (in metres)
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label28" runat="server" Text='<%# Bind("Height") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Weight" SortExpression="Weight">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Weight") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;<br />
                        (in kilograms)
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label29" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Trouser Length" SortExpression="TrouserLength">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("TrouserLength") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;<br />
                        (in centimetres)
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label30" runat="server" Text='<%# Bind("TrouserLength") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Shoe Size" SortExpression="ShoeSize">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("ShoeSize") %>' 
                            Columns="10"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label31" runat="server" Text='<%# Bind("ShoeSize") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hobbies" SortExpression="Hobbies">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("NextOfKinName") %>' 
                            Columns="30" CssClass="defaultFormElementStyle" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label40" runat="server" Text='<%# Bind("NextOfKinName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Visa Type" SortExpression="VisaType">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList14_2" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("VisaType") %>'>
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>Expatriate Staff</asp:ListItem>
                            <asp:ListItem>Management Staff</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label36" runat="server" Text='<%# Bind("VisaType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name of Next of Kin" 
                    SortExpression="NextOfKinName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox45" runat="server" Columns="30" 
                            Text='<%# Bind("NextOfKinName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label46" runat="server" Text='<%# Bind("NextOfKinName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address of Next of Kin" 
                    SortExpression="NextOfKinAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox46" runat="server" 
                            Text='<%# Bind("NextOfKinAddress") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label47" runat="server" Text='<%# Bind("NextOfKinAddress") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Relationship to Next of Kin" 
                    SortExpression="NextOfKinRelationship">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList31" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("NextofKinRelationship") %>'>
                            <asp:ListItem>--Unknown--</asp:ListItem>
                            <asp:ListItem>Brother</asp:ListItem>
                            <asp:ListItem>Daughter</asp:ListItem>
                            <asp:ListItem>Father</asp:ListItem>
                            <asp:ListItem>Husband</asp:ListItem>
                            <asp:ListItem>Mother</asp:ListItem>
                            <asp:ListItem>Sister</asp:ListItem>
                            <asp:ListItem>Son</asp:ListItem>
                            <asp:ListItem>Wife</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label48" runat="server" 
                            Text='<%# Bind("NextOfKinRelationship") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                Font-Bold="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" VerticalAlign="Middle" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsoUsers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="" 
                    DeleteCommand="STP_HR_DELETE_HR_Staff_Base" DeleteCommandType="StoredProcedure" 
                    InsertCommand="STP_HR_INSERT_HR_Staff_Base" InsertCommandType="StoredProcedure" 
                    UpdateCommand="STP_HR_UPDATE_HR_Staff_Base" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="StaffId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="StaffId" Type="Int32" />
                <asp:Parameter Name="StaffCode" Type="String" />
                <asp:Parameter Name="MaritalStatus" Type="String" />
                <asp:Parameter Name="WeddingDate" Type="DateTime" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                <asp:Parameter Name="ConfirmationStatus" Type="String" />
                <asp:Parameter Name="RetirementStatus" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="OtherNames" Type="String" />
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="DateOfEmployment" Type="DateTime" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="DesignationId" Type="Int32" />
                <asp:Parameter Name="JobLevelId" Type="Int32" />
                <asp:Parameter Name="LocationId" Type="Int32" />
                <asp:Parameter Name="Residence" Type="String" />
                <asp:Parameter Name="PermanentResidence" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="ReligionId" Type="Int32" />
                <asp:Parameter Name="Hometown" Type="String" />
                <asp:Parameter Name="LGAOfOriginId" Type="Int32" />
                <asp:Parameter Name="BankId" Type="Int32" />
                <asp:Parameter Name="BankAccountNumber" Type="String" />
                <asp:Parameter Name="Visa" Type="String" />
                <asp:Parameter Name="EyeColour" Type="String" />
                <asp:Parameter Name="Height" Type="String" />
                <asp:Parameter Name="Weight" Type="String" />
                <asp:Parameter Name="TrouserLength" Type="String" />
                <asp:Parameter Name="ShoeSize" Type="String" />
                <asp:Parameter Name="BloodGroup" Type="String" />
                <asp:Parameter Name="Genotype" Type="String" />
                <asp:Parameter Name="Hobbies" Type="String" />
                <asp:Parameter Name="AreaOfInterest" Type="String" />
                <asp:Parameter Name="VisaType" Type="String" />
                <asp:Parameter Name="Coop_MonthlyDeduction" Type="Decimal" />
                <asp:Parameter Name="Coop_LoanRepayment" Type="Decimal" />
                <asp:Parameter Name="MaxMedical" Type="Decimal" />
                <asp:Parameter Name="NextOfKinName" Type="String" />
                <asp:Parameter Name="NextOfKinAddress" Type="String" />
                <asp:Parameter Name="NextOfKinRelationship" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Direction="InputOutput" Name="StaffId" Type="Int32" />
                <asp:Parameter Name="StaffCode" Type="String" />
                <asp:Parameter Name="MaritalStatus" Type="String" />
                <asp:Parameter Name="WeddingDate" Type="DateTime" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                <asp:Parameter Name="ConfirmationStatus" Type="String" />
                <asp:Parameter Name="RetirementStatus" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="OtherNames" Type="String" />
                <asp:Parameter Name="Department" Type="String" />
                <asp:Parameter Name="DateOfEmployment" Type="DateTime" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="DesignationId" Type="Int32" />
                <asp:Parameter Name="JobLevelId" Type="Int32" />
                <asp:Parameter Name="LocationId" Type="Int32" />
                <asp:Parameter Name="Residence" Type="String" />
                <asp:Parameter Name="PermanentResidence" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="ReligionId" Type="Int32" />
                <asp:Parameter Name="Hometown" Type="String" />
                <asp:Parameter Name="LGAOfOriginId" Type="Int32" />
                <asp:Parameter Name="BankId" Type="Int32" />
                <asp:Parameter Name="BankAccountNumber" Type="String" />
                <asp:Parameter Name="Visa" Type="String" />
                <asp:Parameter Name="EyeColour" Type="String" />
                <asp:Parameter Name="Height" Type="String" />
                <asp:Parameter Name="Weight" Type="String" />
                <asp:Parameter Name="TrouserLength" Type="String" />
                <asp:Parameter Name="ShoeSize" Type="String" />
                <asp:Parameter Name="BloodGroup" Type="String" />
                <asp:Parameter Name="Genotype" Type="String" />
                <asp:Parameter Name="Hobbies" Type="String" />
                <asp:Parameter Name="AreaOfInterest" Type="String" />
                <asp:Parameter Name="VisaType" Type="String" />
                <asp:Parameter Name="Coop_MonthlyDeduction" Type="Decimal" />
                <asp:Parameter Name="Coop_LoanRepayment" Type="Decimal" />
                <asp:Parameter Name="MaxMedical" Type="Decimal" />
                <asp:Parameter Name="NextOfKinName" Type="String" />
                <asp:Parameter Name="NextOfKinAddress" Type="String" />
                <asp:Parameter Name="NextOfKinRelationship" Type="String" />
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
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
