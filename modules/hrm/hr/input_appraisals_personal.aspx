<%@ Page Language="VB" AutoEventWireup="false" CodeFile="input_appraisals_personal.aspx.vb" Inherits="modules_hrm_hr_input_appraisals_personal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../../inc_functions_js_CalendarPopup_Combined.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=""></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
				<table width="100%"  border="0" cellspacing="5">
                  <tr>
                    <td style="margin-left: 200px">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="CustomerCode" 
                            DefaultMode="Insert" EmptyDataText="No data." 
                            ForeColor="#333333" GridLines="None" Height="50px" Width="1000px" 
                            EnableModelValidation="True">
                            <HeaderTemplate>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="center" rowspan="7" valign="middle" width="200">
                                            <img border="2" height="120" src="../../../images/logos/logo.15.jpg" /></td>
                                        <td align="center" rowspan="7" valign="middle" width="200">
                                            APPRAISAL GRADE SCALE</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center" rowspan="6" width="200">
                                            <asp:Image ID="imgPhotoHeader" runat="server" BorderColor="Black" 
                                                BorderStyle="Solid" BorderWidth="2px" Height="120px" ImageUrl="" 
                                                Width="120px" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            4</td>
                                        <td align="center">
                                            VERY GOOD</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            3</td>
                                        <td align="center">
                                            GOOD</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            2</td>
                                        <td align="center">
                                            FAIR</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            1</td>
                                        <td align="center">
                                            POOR</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <FooterTemplate>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="center" rowspan="7" valign="middle" width="200">
                                            <img border="2" height="120" src="../../../images/logos/logo.15.jpg" /></td>
                                        <td align="center" rowspan="7" valign="middle" width="200">
                                            APPRAISAL GRADE SCALE</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center" rowspan="6" width="200">
                                            <asp:Image ID="imgPhotoFooter" runat="server" BorderColor="Black" 
                                                BorderStyle="Solid" BorderWidth="2px" Height="120px" ImageUrl="" 
                                                Width="120px" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            4</td>
                                        <td align="center">
                                            VERY GOOD</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            3</td>
                                        <td align="center">
                                            GOOD</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            2</td>
                                        <td align="center">
                                            FAIR</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            1</td>
                                        <td align="center">
                                            POOR</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </FooterTemplate>
                            <Fields>
                                <asp:TemplateField>
                                    <InsertItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STAFF PHOTOGRAPH:">
                                    <InsertItemTemplate>
                                        <asp:Image ID="imgPhoto" runat="server" Height="60px" 
                                            ImageUrl=''
                                            Width="60px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />                                        
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="STAFF DETAILS:">
                                    <InsertItemTemplate>
                                        <table width="100%" border="0" class="borderedTableGrey" cellspacing="5">
                                          <tr valign="top">
                                            <td class="borderedTable">
                                                <b>Appraisal Period: </b>
                                                <asp:Label ID="lblAppraisalPeriod" runat="server" Font-Bold="True" 
                                                    Text="<%# sessionName %>"></asp:Label>
                                              </td>
                                          </tr>
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Staff Name: 
                                                    <asp:Label ID="lblStaffName" runat="server" Font-Bold="True" 
                                                        Text="<%# staffName %>"></asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Staff Designation(s):
                                                    <asp:Label ID="lblStaffDesignation" runat="server" Font-Bold="True" 
                                                        Text="<%# staffDesignation %>"></asp:Label>
                                                    </b></td>
                                            </tr>
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Portal Username:
                                                    <asp:Label ID="lblStaffUsername" runat="server" Font-Bold="True" 
                                                        Text="<%# selectedStaffCode %>"></asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Dates of Meetings and Observations</b><asp:GridView 
                                                        ID="gvMeetingObservations" runat="server" AllowSorting="True" 
                                                        AutoGenerateColumns="False" CellPadding="4" CssClass="borderedTable" 
                                                        DataKeyNames="ResponseHeaderMeetingId" 
                                                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No meetings to display.&lt;br /&gt;&amp;nbsp;" 
                                                        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                                        Width="100%" DataSourceID="dsSqlMeetings" 
                                                        onrowdatabound="gvMeetingObservations_A_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S/N" SortExpression="DomainId">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label9" runat="server" Text="<%# serialInner + 1 %>"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Meeting Date" SortExpression="MeetingDate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MeetingDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="200px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Observation" 
                                                                SortExpression="MeetingObservation">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" 
                                                                        Text='<%# Bind("MeetingObservation") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                            VerticalAlign="Top" />
                                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                            HorizontalAlign="Left" VerticalAlign="Top" />
                                                        <EditRowStyle CssClass="defaultFormElementStyle" />
                                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                                        <AlternatingRowStyle BackColor="White" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="dsSqlMeetings" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                                        SelectCommand="SELECT * FROM [VW_APPRAISAL_ResponseHeaderMeetings] WHERE (([SessionName] = @SessionName) AND ([Username] = @Username)) ORDER BY [SessionName], [Username], [MeetingDate]" 
                                                        OnSelecting="dsSqlMeetings_Selecting">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="SessionName" />
                                                            <asp:Parameter Name="Username" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="borderedTable">
                                                    <b>Focus of Observation:
                                                    <br />
                                                    </b>
                                                    <asp:TextBox ID="txtObservationFocus" runat="server" Columns="110" 
                                                        CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine" 
                                                        Visible="False" ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Comments and Suggested Areas for Improvement:
                                                    <br />
                                                    <asp:TextBox ID="txtAppraisalComments" runat="server" Columns="110" 
                                                        CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine" 
                                                        Visible="False" ReadOnly="True"></asp:TextBox>
                                                    </b></td>
                                            </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="DOMAIN GROUP A:">
                                    <InsertItemTemplate>
                                        <asp:GridView ID="gvAppraisalDomains_A" runat="server" AllowSorting="True" 
                                            AutoGenerateColumns="False" CellPadding="4" CssClass="borderedTable" 
                                            DataKeyNames="DomainId" 
                                            DataSourceID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_A" 
                                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                            OnRowDataBound="gvAppraisalDomains_A_RowDataBound" Width="800px" 
                                            Visible="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S/N" SortExpression="DomainId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Domain Title" SortExpression="DomainTitle">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="2" Text='<%# Bind("DomainTitle") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DomainTitle") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 1" SortExpression="DomainResponseOption1">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption1") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 2" SortExpression="DomainResponseOption2">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption2") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 3" SortExpression="DomainResponseOption3">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption3") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption3") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 4" SortExpression="DomainResponseOption4">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption4") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption4") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rating">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="30px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                HorizontalAlign="Left" VerticalAlign="Top" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_A" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT * FROM [VW_APPRAISAL_Domains] WHERE AppraisalDepartment = @AppraisalDepartment AND GroupShortName = @GroupShortName ORDER BY AppraisalDepartment, GroupShortName">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Teaching" Name="AppraisalDepartment" />
                                                <asp:Parameter DefaultValue="A" Name="GroupShortName" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="DOMAIN GROUP B:">
                                    <InsertItemTemplate>
                                        <asp:GridView ID="gvAppraisalDomains_B" runat="server" AllowSorting="True" 
                                            AutoGenerateColumns="False" CellPadding="4" CssClass="borderedTable" 
                                            DataKeyNames="DomainId" 
                                            DataSourceID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_B" 
                                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                            OnRowDataBound="gvAppraisalDomains_B_RowDataBound" Width="800px" 
                                            Visible="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S/N" SortExpression="DomainId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Domain Title" SortExpression="DomainTitle">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="2" Text='<%# Bind("DomainTitle") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DomainTitle") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 1" SortExpression="DomainResponseOption1">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption1") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 2" SortExpression="DomainResponseOption2">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption2") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 3" SortExpression="DomainResponseOption3">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption3") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption3") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 4" SortExpression="DomainResponseOption4">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption4") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption4") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rating">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="30px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                HorizontalAlign="Left" VerticalAlign="Top" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_B" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT * FROM [VW_APPRAISAL_Domains] WHERE AppraisalDepartment = @AppraisalDepartment AND GroupShortName = @GroupShortName ORDER BY AppraisalDepartment, GroupShortName">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Teaching" Name="AppraisalDepartment" />
                                                <asp:Parameter DefaultValue="B" Name="GroupShortName" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="DOMAIN GROUP C:">
                                    <InsertItemTemplate>
                                        <asp:GridView ID="gvAppraisalDomains_C" runat="server" AllowSorting="True" 
                                            AutoGenerateColumns="False" CellPadding="4" CssClass="borderedTable" 
                                            DataKeyNames="DomainId" 
                                            DataSourceID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_C" 
                                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                            OnRowDataBound="gvAppraisalDomains_C_RowDataBound" Width="800px" 
                                            Visible="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S/N" SortExpression="DomainId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Domain Title" SortExpression="DomainTitle">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="2" Text='<%# Bind("DomainTitle") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DomainTitle") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 1" SortExpression="DomainResponseOption1">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption1") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 2" SortExpression="DomainResponseOption2">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption2") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 3" SortExpression="DomainResponseOption3">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption3") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption3") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 4" SortExpression="DomainResponseOption4">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption4") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption4") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rating">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="30px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                HorizontalAlign="Left" VerticalAlign="Top" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_C" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT * FROM [VW_APPRAISAL_Domains] WHERE AppraisalDepartment = @AppraisalDepartment AND GroupShortName = @GroupShortName ORDER BY AppraisalDepartment, GroupShortName">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Teaching" Name="AppraisalDepartment" />
                                                <asp:Parameter DefaultValue="C" Name="GroupShortName" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="DOMAIN GROUP D:">
                                    <InsertItemTemplate>
                                        <asp:GridView ID="gvAppraisalDomains_D" runat="server" AllowSorting="True" 
                                            AutoGenerateColumns="False" CellPadding="4" CssClass="borderedTable" 
                                            DataKeyNames="DomainId" 
                                            DataSourceID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_D" 
                                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                            OnRowDataBound="gvAppraisalDomains_D_RowDataBound" Width="800px" 
                                            Visible="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S/N" SortExpression="DomainId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Domain Title" SortExpression="DomainTitle">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="2" Text='<%# Bind("DomainTitle") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DomainTitle") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 1" SortExpression="DomainResponseOption1">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption1") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 2" SortExpression="DomainResponseOption2">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption2") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption2") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 3" SortExpression="DomainResponseOption3">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption3") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption3") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Option 4" SortExpression="DomainResponseOption4">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="defaultFormElementStyle" 
                                                            Rows="4" Text='<%# Bind("DomainResponseOption4") %>' TextMode="MultiLine"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" 
                                                            Text='<%# Bind("DomainResponseOption4") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rating">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="30px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                HorizontalAlign="Left" VerticalAlign="Top" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="dsSqlGetAppraisalDomainsByDepartmentAndGroup_D" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT * FROM [VW_APPRAISAL_Domains] WHERE AppraisalDepartment = @AppraisalDepartment AND GroupShortName = @GroupShortName ORDER BY AppraisalDepartment, GroupShortName">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Teaching" Name="AppraisalDepartment" />
                                                <asp:Parameter DefaultValue="D" Name="GroupShortName" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField>
                                    <InsertItemTemplate>
                                        <table width="600px" border="0" class="borderedTable">
                                          <tr valign="top">
                                            <td class="pageHeaderStyle" width="60%">
                                                <strong>My Signature:</strong></td>
                                              <td class="pageHeaderStyle">
                                                  <strong>Date:</strong></td>
                                          </tr>
                                            <tr valign="top">
                                                <td align="left" class="pageHeaderStyle" valign="middle">
                                                    <asp:Image ID="imgSignature" runat="server" BorderColor="Black" 
                                                        BorderStyle="Solid" BorderWidth="2px" Height="50px" ImageUrl="" Width="100px" />
                                                </td>
                                                <td align="left" class="pageHeaderStyle" valign="middle">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>                                   
                                        <br />
                                        <table border="0" class="borderedTable" width="600px">
                                            <tr valign="top">
                                                <td class="pageHeaderStyle" width="60%">
                                                    Head of School<strong>&#39;s Signature:</strong></td>
                                                <td class="pageHeaderStyle">
                                                    <strong>Date:</strong></td>
                                            </tr>
                                            <tr valign="top">
                                                <td align="left" class="pageHeaderStyle" valign="middle">
                                                    <%= Common.GetSchoolsHeadSignature() %>
                                                </td>
                                                <td align="left" class="pageHeaderStyle" valign="middle">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False"></asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" Visible="False">
                                    <InsertItemTemplate>
                                        <asp:Button ID="btnSave" runat="server" CausesValidation="False" 
                                            CommandName="Insert" Text="Save Appraisal" CssClass="defaultButtonStyle" 
                                            Enabled="False" />
                                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" CssClass="defaultButtonStyle" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnNew" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="New" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Fields>
                            <FieldHeaderStyle Font-Bold="True" Width="400px" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
                            <EditRowStyle Wrap="True" />
                            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
                            <FooterStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="28px" 
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True" />
                            <RowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="dsSqlTeacherPerfx" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT 1">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsSqlGetSingleStaff" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [StaffCode] AS StaffId, UPPER(Title) + ' ' + UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' (' + UPPER(b.[Remark1]) + ' Staff)' AS StaffDetails FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = b.DepartmentCode WHERE b.Remark1 = 'Teaching' ORDER BY Surname">
                        </asp:SqlDataSource>
                        <asp:ObjectDataSource ID="dsObjRatings" runat="server" 
                            SelectMethod="GetIntegerSeries" TypeName="Common">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="minimum" Type="Int32" />
                                <asp:Parameter DefaultValue="4" Name="maximum" Type="Int32" />
                                <asp:Parameter DefaultValue="1" Name="interval" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                      </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table>
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
