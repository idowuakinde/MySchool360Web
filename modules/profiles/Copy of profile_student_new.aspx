<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Copy of profile_student_new.aspx.vb" Inherits="modules_profiles_profile_student_new" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" media="screen, print" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    </head>
<%--<body topmargin="0" leftmargin="0" onload="javascript:window.parent.allStudentsFrame.location.href = 'profile_student_all.aspx';">--%>
<body topmargin="0" leftmargin="0" onload="javascript:window.parent.allStudentsFrame.location.href = 'profile_student_all.aspx';">
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
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="300px" 
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
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Country / State of Origin:" 
                    SortExpression="OriginState">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlAddOriginState" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddState" 
                            DataTextField="StateName" DataValueField="StateId" 
                            SelectedValue='<%# Bind("OriginState") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt; Residential Address:" 
                    SortExpression="ResidenceAddress">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" 
                            Text='<%# Bind("ResidenceAddress") %>' Columns="50" 
                            CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Residential Address State:" 
                    SortExpression="ResidenceState">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlAddResidenceState" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddState" 
                            DataTextField="StateName" DataValueField="StateId" 
                            SelectedValue='<%# Bind("ResidenceState") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Father's Telephone:" 
                    SortExpression="TelFather">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TelFather") %>' Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Mother's Telephone:" 
                    SortExpression="TelMother">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TelMother") %>' Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Student's Telephone:" 
                    SortExpression="TelStudent">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TelStudent") %>' Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Emergency Telephone:" 
                    SortExpression="TelEmergency">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("TelEmergency") %>' Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Father's E-mail:" 
                    SortExpression="EmailFather">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("EmailFather") %>' 
                            Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Mother's E-mail:" 
                    SortExpression="EmailMother">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("EmailMother") %>' 
                            Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Father's Occupation:" 
                    SortExpression="OccupationFather">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" 
                            Text='<%# Bind("OccupationFather") %>' Columns="50" 
                            CssClass="defaultFormElementStyle" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Mother's Occupation:" 
                    SortExpression="OccupationMother">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" 
                            Text='<%# Bind("OccupationMother") %>' Columns="50" 
                            CssClass="defaultFormElementStyle" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EDUCATIONAL DATA">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Previous School:" 
                    SortExpression="PreviousSchool">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("PreviousSchool") %>' 
                            Columns="50" MaxLength="50"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Previous School State:" 
                    SortExpression="PreviousSchoolState">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlAddPreviousState" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddState" 
                            DataTextField="StateName" DataValueField="StateId" 
                            SelectedValue='<%# Bind("PreviousSchoolState") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Examinations and Years Taken:" 
                    SortExpression="Exam1">
                    <InsertItemTemplate>
                        #1:
                        <asp:DropDownList ID="ddlAddExam1Name" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddExam" DataTextField="ExamName" DataValueField="ExamId" 
                            SelectedValue='<%# Bind("Exam1") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlAddExam1Year" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Exam1Year") %>'>
                        </asp:DropDownList>
                        <br />
                        #2:
                        <asp:DropDownList ID="ddlAddExam2Name" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddExam" DataTextField="ExamName" DataValueField="ExamId" 
                            SelectedValue='<%# Bind("Exam2") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlAddExam2Year" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Exam2Year") %>'>
                        </asp:DropDownList>
                        <br />
                        #3:
                        <asp:DropDownList ID="ddlAddExam3Name" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddExam" DataTextField="ExamName" DataValueField="ExamId" 
                            SelectedValue='<%# Bind("Exam3") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlAddExam3Year" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("Exam3Year") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Proposed Level of Entry:" 
                    SortExpression="Gender">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList11" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddClass" 
                            DataTextField="ClassDesc" DataValueField="ClassName" 
                            SelectedValue='<%# Bind("DistrictCode") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Subjects:" 
                    SortExpression="Subject1">
                    <InsertItemTemplate>
                        # 1:
                        <asp:DropDownList ID="ddlAddSubject1" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddSubject" DataTextField="SubjectName" 
                            DataValueField="SubjectId" SelectedValue='<%# Bind("Subject1") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        # 2:
                        <asp:DropDownList ID="ddlAddSubject2" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddSubject" DataTextField="SubjectName" 
                            DataValueField="SubjectId" SelectedValue='<%# Bind("Subject2") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        # 3:
                        <asp:DropDownList ID="ddlAddSubject3" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddSubject" DataTextField="SubjectName" 
                            DataValueField="SubjectId" SelectedValue='<%# Bind("Subject3") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        # 4:
                        <asp:DropDownList ID="ddlAddSubject4" runat="server" 
                            AppendDataBoundItems="True" CssClass="defaultFormElementStyle" 
                            DataSourceID="dsSqlAddSubject" DataTextField="SubjectName" 
                            DataValueField="SubjectId" SelectedValue='<%# Bind("Subject4") %>'>
                            <asp:ListItem Value="0">--</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Career Prospects:" 
                    SortExpression="DesiredCareer1">
                    <InsertItemTemplate>
                        #1:
                        <asp:TextBox ID="txtAddCareerProspects1" runat="server" 
                            Text='<%# Bind("DesiredCareer1") %>' Columns="50"></asp:TextBox>
                        <br />
                        <br />
                        #2:
                        <asp:TextBox ID="txtAddCareerProspects2" runat="server" Columns="50" 
                            Text='<%# Bind("DesiredCareer2") %>'></asp:TextBox>
                        <br />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Parent's Signature Sighted:" 
                    SortExpression="ParentsSign">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("ParentsSign") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Student's Signature Sighted:" 
                    SortExpression="StudentsSign">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" 
                            Checked='<%# Bind("StudentsSign") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ADMINISTRATIVE DATA">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Entrance Exam Date:" 
                    SortExpression="EntranceExamDate">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlDateExam_Month" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(this, dvNewStudent_ddlDateExam_Day, dvNewStudent_ddlDateExam_Year, dvNewStudent_lblExamDate, hidExamDate);">
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
                        <asp:DropDownList ID="ddlDateExam_Day" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateExam_Month, this, dvNewStudent_ddlDateExam_Year, dvNewStudent_lblExamDate, hidExamDate);">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateExam_Year" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateExam_Month, dvNewStudent_ddlDateExam_Day, this, dvNewStudent_lblExamDate, hidExamDate);">
                        </asp:DropDownList>
                        <asp:Label ID="lblExamDate" runat="server" Text='<%# Eval("EntranceExamDate") %>'></asp:Label>
                        <input id="hidExamDate" name="hidExamDate" type="hidden" value='<%= examDate_label.Text %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Interview Date:" 
                    SortExpression="InterviewDate">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlDateInterview_Month" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(this, dvNewStudent_ddlDateInterview_Day, dvNewStudent_ddlDateInterview_Year, dvNewStudent_lblInterviewDate, hidInterviewDate);">
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
                        <asp:DropDownList ID="ddlDateInterview_Day" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateInterview_Month, this, dvNewStudent_ddlDateInterview_Year, dvNewStudent_lblInterviewDate, hidInterviewDate);">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDateInterview_Year" runat="server" 
                            CssClass="defaultFormElementStyle" onchange="javascript:UpdateDateLabel(dvNewStudent_ddlDateInterview_Month, dvNewStudent_ddlDateInterview_Day, this, dvNewStudent_lblInterviewDate, hidInterviewDate);">
                        </asp:DropDownList>
                        <asp:Label ID="lblInterviewDate" runat="server" Text='<%# Eval("InterviewDate") %>'></asp:Label>
                        <input id="hidInterviewDate" name="hidInterviewDate" type="hidden" value='<%= interviewDate_label.Text %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Results Sighted:" 
                    SortExpression="ResultsSighted">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" 
                            Checked='<%# Bind("ResultsSighted") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Birth Certificate Sighted:" 
                    SortExpression="BirthCertificateSighted">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" 
                            Checked='<%# Bind("BirthCertificateSighted") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Health Report Sighted:" 
                    SortExpression="HealthReportSighted">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox5" runat="server" 
                            Checked='<%# Bind("HealthReportSighted") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Reference Sighted:" 
                    SortExpression="ReferenceSighted">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox6" runat="server" 
                            Checked='<%# Bind("ReferenceSighted") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Receipt Number:" 
                    SortExpression="ReceiptNumber">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ReceiptNumber") %>' Columns="40"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FINAL DECISION">
                    <HeaderStyle BackColor="PaleGoldenrod" Font-Bold="True" Font-Overline="False" Font-Size="Larger" 
                        Font-Underline="False" Height="25px" VerticalAlign="Middle" />
                    <ItemStyle BackColor="PaleGoldenrod" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Decision:" 
                    SortExpression="Decision">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList12" runat="server" 
                            CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Decision") %>'>
                            <asp:ListItem>Accept</asp:ListItem>
                            <asp:ListItem>Reject</asp:ListItem>
                            <asp:ListItem>Decide Later</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Accepted Level of Entry:" 
                    SortExpression="ProgrammeEnrolled">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList13" runat="server" 
                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddClass" 
                            DataTextField="ClassDesc" DataValueField="ClassName" 
                            SelectedValue='<%# Bind("ProgrammeEnrolled") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Boarder:" 
                    SortExpression="Boarder">
                    <InsertItemTemplate>
                        <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Boarder") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&gt;&nbsp;Comments:" 
                    SortExpression="Remarks">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("Remarks") %>' 
                            Columns="40" CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
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
                    SelectCommand="SELECT * FROM [VW_StudentProfiles]"                     
                    InsertCommand="STP_DATAENTRY_INSERT_TEMPcustomers_Childville" 
                    InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="CustomerCode" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="DistrictCode" Type="String" />
                <asp:Parameter Name="SyncStatus" Type="String" />
                <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                <asp:Parameter Name="OriginState" Type="Int32" />
                <asp:Parameter Name="ResidenceAddress" Type="String" />
                <asp:Parameter Name="ResidenceState" Type="Int32" />
                <asp:Parameter Name="TelFather" Type="String" />
                <asp:Parameter Name="TelMother" Type="String" />
                <asp:Parameter Name="TelStudent" Type="String" />
                <asp:Parameter Name="TelEmergency" Type="String" />
                <asp:Parameter Name="EmailFather" Type="String" />
                <asp:Parameter Name="EmailMother" Type="String" />
                <asp:Parameter Name="OccupationFather" Type="String" />
                <asp:Parameter Name="OccupationMother" Type="String" />
                <asp:Parameter Name="PreviousSchool" Type="String" />
                <asp:Parameter Name="PreviousSchoolState" Type="Int32" />
                <asp:Parameter Name="Exam1" Type="Int32" />
                <asp:Parameter Name="Exam1Year" Type="Int32" />
                <asp:Parameter Name="Exam2" Type="Int32" />
                <asp:Parameter Name="Exam2Year" Type="Int32" />
                <asp:Parameter Name="Exam3" Type="Int32" />
                <asp:Parameter Name="Exam3Year" Type="Int32" />
                <asp:Parameter Name="Subject1" Type="Int32" />
                <asp:Parameter Name="Subject2" Type="Int32" />
                <asp:Parameter Name="Subject3" Type="Int32" />
                <asp:Parameter Name="Subject4" Type="Int32" />
                <asp:Parameter Name="DesiredCareer1" Type="String" />
                <asp:Parameter Name="DesiredCareer2" Type="String" />
                <asp:Parameter Name="ParentsSign" Type="Boolean" />
                <asp:Parameter Name="StudentsSign" Type="Boolean" />
                <asp:Parameter Name="EntranceExamDate" Type="DateTime" />
                <asp:Parameter Name="InterviewDate" Type="DateTime" />
                <asp:Parameter Name="ResultsSighted" Type="Boolean" />
                <asp:Parameter Name="BirthCertificateSighted" Type="Boolean" />
                <asp:Parameter Name="HealthReportSighted" Type="Boolean" />
                <asp:Parameter Name="ReferenceSighted" Type="Boolean" />
                <asp:Parameter Name="ReceiptNumber" Type="String" />
                <asp:Parameter Name="Decision" Type="String" />
                <asp:Parameter Name="ProgrammeEnrolled" Type="String" />
                <asp:Parameter Name="Boarder" Type="Boolean" />
                <asp:Parameter Name="Remarks" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlAddState" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT [StateName], [StateId] FROM [VW_StatePerCountry] ORDER BY [StateName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlAddExam" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT [ExamId], [ExamName] FROM [Core_Exam] ORDER BY [ExamName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlAddSubject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT [SubjectId], [SubjectName] FROM [TEMPSubject] ORDER BY [SubjectName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlAddClass" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT [ClassId], [ClassName], [ClassName] + ' (' + [ClassAlias] + ')' AS ClassDesc FROM dbo.[TEMPClass] ORDER BY [ClassName]">
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
