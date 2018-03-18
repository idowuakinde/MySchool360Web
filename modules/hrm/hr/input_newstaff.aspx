<%@ Page Language="VB" AutoEventWireup="false" CodeFile="input_newstaff.aspx.vb" Inherits="modules_hr_input_newstaff" %>

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
                <td colspan="2">
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Add New Staff"></asp:Label></td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
            DataKeyNames="StaffId" DataSourceID="dsoUsers" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Insert" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="700px">
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="250px" 
                VerticalAlign="Top" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <Fields>
                <asp:TemplateField HeaderText="BASIC INFO">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:BoundField DataField="StaffId" HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Staff Id:" 
                    SortExpression="StaffId" InsertVisible="False" ReadOnly="True" 
                    Visible="False">
                </asp:BoundField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Surname:" 
                    SortExpression="Surname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Surname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Surname") %>' 
                            Columns="20"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Other Names:" 
                    SortExpression="OtherNames">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OtherNames") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OtherNames") %>' 
                            Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("OtherNames") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Gender:" 
                    SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Date Of Birth:" 
                    SortExpression="DateOfBirth">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlDateBirth_Month" runat="server" 
                            CssClass="defaultFormElementStyle" AutoPostBack="True">
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
                            CssClass="defaultFormElementStyle" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateBirth_Year" runat="server" 
                            CssClass="defaultFormElementStyle" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Marital Status:" 
                    SortExpression="MaritalStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MaritalStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("MaritalStatus") %>'>
                            <asp:ListItem Value="D">Divorced</asp:ListItem>
                            <asp:ListItem Value="M">Married</asp:ListItem>
                            <asp:ListItem Value="S">Single</asp:ListItem>
                            <asp:ListItem Value="W">Widowed</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("MaritalStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Wedding Date:" 
                    SortExpression="WeddingDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox39" runat="server" Text='<%# Bind("WeddingDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox47" runat="server" Columns="20" 
                            CssClass="defaultFormElementStyle" Text='<%# Bind("WeddingDate") %>'></asp:TextBox>
                        &nbsp;<br />
                        (Please leave blank if you&#39;re not married)
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label39" runat="server" Text='<%# Bind("WeddingDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Religion:" 
                    SortExpression="ReligionId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("ReligionId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList10" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlReligions" 
                            DataTextField="ReligionName" DataValueField="ReligionId" 
                            SelectedValue='<%# Bind("ReligionId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlReligions" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [ReligionId], [ReligionName] FROM [HR_Religion] ORDER BY [ReligionName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label19" runat="server" Text='<%# Bind("ReligionId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Telephone:" 
                    SortExpression="Telephone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        0<asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Telephone") %>' 
                            Columns="40"></asp:TextBox>
                        &nbsp;<br />
                        (Please leave out the first zero, e.g. 8023801506, 7041495226.)
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Email:" 
                    SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Email") %>' 
                            Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Residential Address:" 
                    SortExpression="Residence">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Residence") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Residence") %>' 
                            Columns="50" CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("Residence") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Permanent Residence:" 
                    SortExpression="PermanentResidence">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" 
                            Text='<%# Bind("PermanentResidence") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" 
                            Text='<%# Bind("PermanentResidence") %>' Columns="50" 
                            CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("PermanentResidence") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Hometown:" 
                    SortExpression="Hometown">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Hometown") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Hometown") %>' 
                            Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("Hometown") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;LGA Of Origin:" 
                    SortExpression="LGAOfOriginId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("LGAOfOriginId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList11" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlLGAs" 
                            DataTextField="LgaName" DataValueField="LgaId" 
                            SelectedValue='<%# Bind("LGAOfOriginId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlLGAs" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [LgaId], ' (' + [StateName] + ') ' + [LgaName] + ' LGA' AS LgaName FROM [Core_Lga] a INNER JOIN [Core_State] b ON a.StateId = b.StateId ORDER BY [LgaName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label20" runat="server" Text='<%# Bind("LGAOfOriginId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EMPLOYMENT INFO">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Date Of Employment:" 
                    SortExpression="DateOfEmployment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" 
                            Text='<%# Bind("DateOfEmployment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlDateEmploy_Month" runat="server" 
                            CssClass="defaultFormElementStyle">
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
                        <asp:DropDownList ID="ddlDateEmploy_Day" runat="server" 
                            CssClass="defaultFormElementStyle">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateEmploy_Year" runat="server" 
                            CssClass="defaultFormElementStyle" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:Label ID="lblEmployDate" runat="server" 
                            Text='<%# Bind("DateOfEmployment") %>'></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("DateOfEmployment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Location:" 
                    SortExpression="LocationId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("LocationId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocations" 
                            DataTextField="LocationName" DataValueField="LocationId" 
                            SelectedValue='<%# Bind("LocationId") %>' AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlLocations" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [LocationId], [LocationName] + ' (' + [StateName] + ') ' AS LocationName FROM [HR_Location] a INNER JOIN [Core_State] b ON a.StateId = b.StateId ORDER BY [LocationName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("LocationId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Department:" 
                    SortExpression="Department">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlDepartments1" 
                            DataTextField="DepartmentName" DataValueField="DepartmentId" 
                            SelectedValue='<%# Bind("Department") %>' AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlDepartments1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT left(DepartmentName, charindex('.', DepartmentName) - 1) as DepartmentId, [DepartmentName] FROM [Core_Department] ORDER BY [DepartmentName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Designation (Current Position):" 
                    SortExpression="DesignationId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("DesignationId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlDesignations1" 
                            DataTextField="DesignationName" DataValueField="DesignationId" 
                            SelectedValue='<%# Bind("DesignationId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlDesignations1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [DesignationId], [DesignationName] FROM [HR_Designation] ORDER BY [DesignationName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("DesignationId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Staff Code:" SortExpression="StaffCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StaffCode") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Button ID="btnStaffCode_Gen" runat="server" 
                            CssClass="defaultButtonStyle" 
                            Text="&nbsp;Re-generate&nbsp;&gt;&nbsp;" />
                        &nbsp;<asp:Label ID="lblStaffCode" runat="server" 
                            Text='<%# Bind("StaffCode") %>'></asp:Label>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Grade Level:" 
                    SortExpression="JobLevelId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("JobLevelId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlJobLevels1" 
                            DataTextField="JobLevelName" DataValueField="JobLevelId" 
                            SelectedValue='<%# Bind("JobLevelId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlJobLevels1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [JobLevelId], [JobLevelName] FROM [HR_JobLevel] ORDER BY [JobLevelName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("JobLevelId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Confirmation Status:" 
                    SortExpression="ConfirmationStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" 
                            Text='<%# Bind("ConfirmationStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("ConfirmationStatus") %>'>
                            <asp:ListItem Value="C">Confirmed</asp:ListItem>
                            <asp:ListItem Value="P">Probation</asp:ListItem>
                            <asp:ListItem Value="U">Unconfirmed</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ConfirmationStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Retired ?:" 
                    SortExpression="RetirementStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" 
                            Text='<%# Bind("RetirementStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("RetirementStatus") %>'>
                            <asp:ListItem Value="N">No</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("RetirementStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Area(s) of Special Interest:" 
                    SortExpression="AreaOfInterest">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox34" runat="server" Text='<%# Bind("AreaOfInterest") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label34" runat="server" Text='<%# Bind("AreaOfInterest") %>'></asp:Label>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox48" runat="server" Columns="40" 
                            CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SALARY INFO">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Preferred Bank:" 
                    SortExpression="BankId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("BankId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList12" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlBanks" 
                            DataTextField="BankName" DataValueField="BankId" 
                            SelectedValue='<%# Bind("BankId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsSqlBanks" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [BankId], [BankName] FROM [HR_Bank] ORDER BY [BankName]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label22" runat="server" Text='<%# Bind("BankId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Bank Account Number:" 
                    SortExpression="BankAccountNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox23" runat="server" 
                            Text='<%# Bind("BankAccountNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox23" runat="server" 
                            Text='<%# Bind("BankAccountNumber") %>' Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label23" runat="server" Text='<%# Bind("BankAccountNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Max. Medical Allowance:" 
                    SortExpression="MaxMedical">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("MaxMedical") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        N
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("MaxMedical") %>' 
                            Columns="10"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label21" runat="server" Text='<%# Bind("MaxMedical") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Co-op Monthly Deduction:" 
                    SortExpression="Coop_MonthlyDeduction" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox32" runat="server" 
                            Text='<%# Bind("Coop_MonthlyDeduction") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        N
                        <asp:TextBox ID="TextBox32" runat="server" 
                            Text='<%# Bind("Coop_MonthlyDeduction") %>' Columns="10"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label32" runat="server" 
                            Text='<%# Bind("Coop_MonthlyDeduction") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Co-op Loan Repayment Amount:" 
                    SortExpression="Coop_LoanRepayment" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox33" runat="server" 
                            Text='<%# Bind("Coop_LoanRepayment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        N
                        <asp:TextBox ID="TextBox33" runat="server" 
                            Text='<%# Bind("Coop_LoanRepayment") %>' Columns="10"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label33" runat="server" Text='<%# Bind("Coop_LoanRepayment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MISCELLANEOUS">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Blood Group:" 
                    SortExpression="BloodGroup">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("BloodGroup") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label29" runat="server" Text='<%# Bind("BloodGroup") %>'></asp:Label>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox49" runat="server" Columns="5" 
                            CssClass="defaultFormElementStyle" Text='<%# Bind("BloodGroup") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Genotype:" 
                    SortExpression="Genotype">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("Genotype") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList27_2" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Genotype") %>'>
                            <asp:ListItem>AA</asp:ListItem>
                            <asp:ListItem>AS</asp:ListItem>
                            <asp:ListItem>SS</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label30" runat="server" Text='<%# Bind("Genotype") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Eye Colour:" 
                    SortExpression="EyeColour">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("EyeColour") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList13" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("EyeColour") %>'>
                            <asp:ListItem>Black</asp:ListItem>
                            <asp:ListItem>Blue</asp:ListItem>
                            <asp:ListItem>Brown</asp:ListItem>
                            <asp:ListItem>Green</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label24" runat="server" Text='<%# Bind("EyeColour") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Physically Challenged ?:" 
                    SortExpression="Visa">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("Visa") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4_2" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Visa") %>'>
                            <asp:ListItem Value="N">No</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label40" runat="server" Text='<%# Bind("Visa") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Height:" 
                    SortExpression="Height">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Height") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Height") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;(in metres)
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label25" runat="server" Text='<%# Bind("Height") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Weight:" 
                    SortExpression="Weight">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("Weight") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("Weight") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;(in kilograms)
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label26" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Trouser Length:" 
                    SortExpression="TrouserLength">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("TrouserLength") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("TrouserLength") %>' 
                            Columns="10"></asp:TextBox>
                        &nbsp;(in centimetres)
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label27" runat="server" Text='<%# Bind("TrouserLength") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Shoe Size:" 
                    SortExpression="ShoeSize">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("ShoeSize") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("ShoeSize") %>' 
                            Columns="10"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label28" runat="server" Text='<%# Bind("ShoeSize") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Hobbies:" 
                    SortExpression="Hobbies">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("Hobbies") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("Hobbies") %>' 
                            Columns="50" CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label31" runat="server" Text='<%# Bind("Hobbies") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Visa Type:" 
                    SortExpression="VisaType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox35" runat="server" Text='<%# Bind("VisaType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList14" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("VisaType") %>'>
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>Expatriate Staff</asp:ListItem>
                            <asp:ListItem>Management Staff</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label35" runat="server" Text='<%# Bind("VisaType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NEXT OF KIN">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Name of Next of Kin:" 
                    SortExpression="NextOfKinName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("NextOfKinName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Columns="40" 
                            Text='<%# Bind("NextOfKinName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label36" runat="server" Text='<%# Bind("NextOfKinName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Address of Next of Kin:" 
                    SortExpression="NextOfKinAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox37" runat="server" 
                            Text='<%# Bind("NextOfKinAddress") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Columns="50" 
                            CssClass="defaultFormElementStyle" Rows="5" 
                            Text='<%# Bind("NextOfKinAddress") %>' TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label37" runat="server" Text='<%# Bind("NextOfKinAddress") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Relationship to Next of Kin:" 
                    SortExpression="NextOfKinRelationship">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox38" runat="server" 
                            Text='<%# Bind("NextOfKinRelationship") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList15" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("NextOfKinRelationship") %>'>
                            <asp:ListItem>Wife</asp:ListItem>
                            <asp:ListItem>Husband</asp:ListItem>
                            <asp:ListItem>Brother</asp:ListItem>
                            <asp:ListItem>Sister</asp:ListItem>
                            <asp:ListItem>Daughter</asp:ListItem>
                            <asp:ListItem>Son</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label38" runat="server" 
                            Text='<%# Bind("NextOfKinRelationship") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" ButtonType="Link" HeaderStyle-Height="25px" HeaderStyle-VerticalAlign="Middle" >
<HeaderStyle VerticalAlign="Middle" Height="25px"></HeaderStyle>

                <ItemStyle BackColor="PaleGoldenrod" />
                </asp:CommandField>
            </Fields>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <EditRowStyle Wrap="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Middle" 
                BackColor="#FFFBD6" ForeColor="#333333" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsoUsers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    
                    SelectCommand="SELECT [StaffId], [StaffGUID], [StaffCode], [MaritalStatus], [WeddingDate], [Gender], [DateOfBirth], [ConfirmationStatus], [RetirementStatus], [Surname], [OtherNames], [Department], right(b.DepartmentName, len(b.DepartmentName) - charindex('.', b.DepartmentName)) AS DepartmentName, [DateOfEmployment], [Email], a.[DesignationId], c.DesignationName, a.[JobLevelId], d.JobLevelName, a.[LocationId], e.LocationName, [Residence], [PermanentResidence], [Telephone], a.[ReligionId], f.ReligionName, [Hometown], a.[LGAOfOriginId], g.LgaName + ' LGA (' + h.StateName + ')' AS LgaName, a.[BankId], i.BankName, [BankAccountNumber], [Visa], [EyeColour], [Height], [Weight], [TrouserLength], [ShoeSize], [BloodGroup], [Genotype], [Hobbies], a.[AreaOfInterest], [VisaType], [Coop_MonthlyDeduction], [Coop_LoanRepayment], [MaxMedical], [NextOfKinName], [NextOfKinAddress], [NextOfKinRelationship] FROM [dbo].[HR_Staff_Base] a INNER JOIN dbo.[Core_Department] b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) INNER JOIN dbo.[HR_Designation] c ON a.DesignationId = c.DesignationId INNER JOIN dbo.[HR_JobLevel] d ON a.JobLevelId = d.JobLevelId INNER JOIN dbo.[HR_Location] e ON a.LocationId = e.LocationId INNER JOIN dbo.[HR_Religion] f ON a.ReligionId = f.ReligionId INNER JOIN dbo.[Core_Lga] g ON a.LgaOfOriginId = g.LgaId INNER JOIN dbo.[Core_State] h ON g.StateId = h.StateId INNER JOIN dbo.[HR_Bank] i ON a.BankId = i.BankId ORDER BY Surname, OtherNames  " 
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
