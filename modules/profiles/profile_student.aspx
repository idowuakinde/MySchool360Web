<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_student.aspx.vb" Inherits="modules_profiles_profile_student" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    <style type="text/css">
        .style17
        {
            width: 100%;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>

<table width="100%"  border="0" id="TABLE1">
            <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="225" align="left" valign="middle"><asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text=":: My Profile"></asp:Label></td>
                            <td align="left" valign="middle"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                        </tr>
                </table></td>
            </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td>
        <table width="100%" border="0">
          <tr>
            <td width="220" valign="top"><asp:Label ID="Label12" runat="server" 
                        Font-Bold="True" Font-Size="Small" Text=":: General Information"></asp:Label>
                </td>
            <td rowspan="2" valign="top"><table class="style17">
                <tr>
                    <td align="left" valign="top" width="410"><asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                                DataSourceID="dsSqlStudentProfile" Height="50px" CssClass="borderedTableGrey" 
                                Width="400px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                EnableModelValidation="True">
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="150px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />            
                        <Fields>
                            <asp:BoundField DataField="CustomerID" HeaderText="Customer Id:" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" Visible="False" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:BoundField DataField="RefCode" HeaderText="Unique Identifier:" SortExpression="RefCode" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:BoundField DataField="MatricNumber" HeaderText="Portal Number:" ReadOnly="True" SortExpression="MatricNumber" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:BoundField DataField="FullName" HeaderText="Full Name:" SortExpression="FullName" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:BoundField DataField="Sex" HeaderText="Gender:" SortExpression="Sex" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:BoundField DataField="Class" HeaderText="Class:" SortExpression="Class" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Date of Birth (Age):" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Intelligence Quotient:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="House:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Day or Boarder?" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hobbies:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Club(s):" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Enrolment Date:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="School Branch:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Address:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Telephone:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />            
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Top" 
                BackColor="#FFFBD6" ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />            
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView></td>
                    <td align="left" valign="top"><asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                                DataSourceID="dsSqlStudentProfile" Height="50px" CssClass="borderedTableGrey" 
                                Width="400px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                EnableModelValidation="True">
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="150px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />            
                        <Fields>
                            <asp:BoundField DataField="CustomerID" HeaderText="Customer Id:" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" Visible="False" >
                                <HeaderStyle Font-Bold="True" />            
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Religion:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nationality:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State of Origin:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Language at Home:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Height:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Weight:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Body Mass Index:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Eye Colour:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Blood Group:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Genotype:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Immunization(s):" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allergy(ies):" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Other Medical Notes:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Physical Disability:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Special Needs:" SortExpression="Sex">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text=''></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />            
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Top" 
                BackColor="#FFFBD6" ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />            
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView></td>
                </tr>
            </table>
                </td>
          </tr>
          <tr>
            <td width="220" valign="top">
                <a href="#">
                    <asp:Image Imageurl='' ID="imgPhoto" 
                    runat="server" BorderStyle="Solid" BorderWidth="2px" Height="207px" 
                    Width="205px" 
                    ToolTip="Click me to upload another picture..." /></a>
                <asp:SqlDataSource ID="dsSqlStudentProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [CustomerID], [RefCode], [MatricNumber], [FullName], [Class], [Sex], [BillingAddress], [BloodGroup], [Genotype], [EyeColour] FROM [VW_StudentProfiles] WHERE ([MatricNumber] = @MatricNumber)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>                
            </td>
            </tr>
        </table>
              </td>
          </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" 
                        Font-Size="Small" Text=" :: My Family (Parents and Siblings)"></asp:Label>
                </td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvFamily" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlFamily" Width="800px" EmptyDataText="No parent or sibling records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label28" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="FamilyMemberName" HeaderText="Name" 
                            SortExpression="FamilyMemberName" >
                        <ItemStyle Width="65%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Relationship" HeaderText="Relationship"
                            SortExpression="Relationship" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlFamily" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>"                     
                    SelectCommand="SELECT OccupationFather AS FamilyMemberName, 'Father' AS Relationship FROM dbo.TEMPCustomers_Childville WHERE PortalNumber = @MatricNumber UNION ALL SELECT OccupationMother, 'Mother' FROM dbo.TEMPCustomers_Childville WHERE PortalNumber = @MatricNumber UNION ALL SELECT CustomerName + ' (Portal Number: ' + PortalNumber + ', Programme: ' + DistrictCode + ')', 'Brother' FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPCustomers_Childville b ON a.CustomerCode = b.PortalNumber WHERE (EmailFather = @EmailFather OR EmailMother = @EmailMother) AND PortalNumber <> @MatricNumber AND SyncStatus = 'M' UNION ALL SELECT CustomerName, 'Sister (Programme: ' + DistrictCode + ')' FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPCustomers_Childville b ON a.CustomerCode = b.PortalNumber WHERE (EmailFather = @EmailFather OR EmailMother = @EmailMother) AND SyncStatus = 'F' ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                        <asp:CookieParameter CookieName="" Name="EmailFather" />
                        <asp:CookieParameter CookieName="" Name="EmailMother" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label27" runat="server" Font-Bold="True" 
                        Font-Size="Small" Text=" :: My Classmates"></asp:Label>
                </td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:DataList ID="dlClassmates" runat="server" CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlClassmates" RepeatDirection="Horizontal" 
                    CellPadding="4" ForeColor="#333333" RepeatColumns="5" 
                    Width="800px">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderTemplate>
                                <asp:Label ID="Label34" runat="server" Text='<%# "CLASS: " & className & " (Not Showing " & studentName & ")" %>'></asp:Label>
                            </HeaderTemplate>
                            <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <a href="<%# "javascript:window.open('../academics/photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                                    <asp:Image ID="Image1" runat="server" Height="30px" ToolTip="Click to enlarge." 
                                    ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & ".jpg")) %>' 
                                    Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" /></a>                                 
                                 <br />
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:DataList>
                <asp:SqlDataSource ID="dsSqlClassmates" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    SelectCommand="SELECT [CustomerID], [MatricNumber], [FullName], [Class], [Sex], [BillingAddress] FROM [VW_StudentProfiles] WHERE Class = @Class AND MatricNumber <> @MatricNumber">
                    <SelectParameters>
                        <asp:Parameter Name="Class" Type="String" />
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text=":: My Wallet (Financial Records)"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvFinancial" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" DataKeyNames="EntryId" 
                    DataSourceID="dsSqlFinProfile" Width="100%" EmptyDataText="No financial records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" DataFormatString="{0:D}" />
                        <asp:BoundField DataField="EntryId" HeaderText="Entry Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="EntryId" Visible="False" />
                        <asp:BoundField DataField="NewBankName" HeaderText="Bank Name" SortExpression="NewBankName" />
                        <asp:BoundField DataField="BankCbnCode" HeaderText="Bank CBN Code" SortExpression="BankCbnCode" />
                        <asp:BoundField DataField="OldBankName" HeaderText="OldBankName" SortExpression="OldBankName"
                            Visible="False" />
                        <asp:BoundField DataField="BankBranch" HeaderText="Bank Branch" SortExpression="BankBranch" />
                        <asp:BoundField DataField="AmountPaid" DataFormatString="{0:N}" HeaderText="Amount Paid"
                            SortExpression="AmountPaid" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CollectingTeller" HeaderText="Collecting Teller" SortExpression="CollectingTeller" />
                        <asp:BoundField DataField="ReceiptNo" HeaderText="Receipt Number" SortExpression="ReceiptNo" />
                        <asp:BoundField DataField="ModeOfPayment" HeaderText="Mode Of Payment" SortExpression="ModeOfPayment" />
                        <asp:BoundField DataField="PaymentPurpose" HeaderText="Payment Purpose" SortExpression="PaymentPurpose" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="Matric Number" SortExpression="MatricNumber"
                            Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlFinProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>" SelectCommand="SELECT [EntryId], [BankCbnCode], [NewBankName], [OldBankName], [BankBranch], [CollectingTeller], [ReceiptNo], [AmountPaid], [ModeOfPayment], [PaymentPurpose], [TransactionDate], [MatricNumber] FROM [VW_StudentProfilesFin] WHERE ([MatricNumber] = @MatricNumber)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
          <tr>
            <td colspan="2"><asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" Text=":: My Exam and Test Records"></asp:Label></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0">
              <tr>
                <td width="310" valign="top">
                    <asp:GridView ID="gvExamTest1" runat="server" 
                        AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="ScoreId" DataSourceID="dsSqlAcadProfile" Width="340px" 
                        EmptyDataText="No exam or test records found for Term 1." CellPadding="4" 
                        ForeColor="#333333" GridLines="None" EnableModelValidation="True" 
                        ShowFooter="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ScoreId" Visible="False" />
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" SortExpression="MatricNumber"
                            Visible="False" />
                        <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                            SortExpression="SubjectName" FooterText="Term Average:" >
                        <FooterStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score" SortExpression="Score">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label29" runat="server" Text='<%# avgTerm1.ToString & "%" %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Score", "{0:F0}%") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="Score">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#">Details</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                  <asp:SqlDataSource ID="dsSqlAcadProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [ScoreId], [Term], [MatricNumber], [SubjectName], [Score] FROM [VW_StudentProfilesAcad] WHERE (([MatricNumber] = @MatricNumber) AND ([Term] = @Term)) ORDER BY SubjectName">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" />
                        <asp:Parameter DefaultValue="Term 1" Name="Term" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </td>
                <td width="310" valign="top">
                    <asp:GridView ID="gvExamTest2" runat="server" 
                        AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="ScoreId" DataSourceID="dsSqlAcad2" Width="340px" 
                        EmptyDataText="No exam or test records found for Term 2." CellPadding="4" 
                        ForeColor="#333333" GridLines="None" EnableModelValidation="True" 
                        ShowFooter="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ScoreId" Visible="False" />
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" SortExpression="MatricNumber"
                            Visible="False" />
                        <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                            SortExpression="SubjectName" FooterText="Term Average:" >
                        <FooterStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score" SortExpression="Score">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label30" runat="server" Text='<%# avgTerm2.ToString & "%" %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label31" runat="server" Text='<%# Bind("Score", "{0:F0}%") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="Score">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#">Details</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlAcad2" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [ScoreId], [Term], [MatricNumber], [SubjectName], [Score] FROM [VW_StudentProfilesAcad] WHERE (([MatricNumber] = @MatricNumber) AND ([Term] = @Term)) ORDER BY SubjectName">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                            <asp:Parameter DefaultValue="Term 2" Name="Term" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    <asp:GridView ID="gvExamTest3" runat="server" 
                        AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="ScoreId" DataSourceID="dsSqlAcad3" Width="340px" 
                        EmptyDataText="No exam or test records found for Term 3." CellPadding="4" 
                        ForeColor="#333333" GridLines="None" EnableModelValidation="True" 
                        ShowFooter="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ScoreId" Visible="False" />
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" SortExpression="MatricNumber"
                            Visible="False" />
                        <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                            SortExpression="SubjectName" FooterText="Term Average:" >
                        <FooterStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score" SortExpression="Score">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label32" runat="server" Text='<%# avgTerm3.ToString & "%" %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label33" runat="server" Text='<%# Bind("Score", "{0:F0}%") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="Score">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Score") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#">Details</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlAcad3" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [ScoreId], [Term], [MatricNumber], [SubjectName], [Score] FROM [VW_StudentProfilesAcad] WHERE (([MatricNumber] = @MatricNumber) AND ([Term] = @Term)) ORDER BY SubjectName">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                            <asp:Parameter DefaultValue="Term 3" Name="Term" Type="String" />
                    </SelectParameters>
                  </asp:SqlDataSource></td>
              </tr>
            </table></td>
          </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label15" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Pastoral Care Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvPastoralCare" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlPastoralCare" Width="800px" EmptyDataText="No pastoral care records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True" ShowFooter="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label28" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="PCIndex" HeaderText="Pastoral Care Index" 
                            SortExpression="PCIndex" ReadOnly="True" FooterText="Average:" >
                        <FooterStyle HorizontalAlign="Right" />
                        <ItemStyle Width="65%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score (max 5)" SortExpression="Score">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Score") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label35" runat="server" Text='<%# avgPastoralCare.ToString & " out of 5" %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Score") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkPC" runat="server" NavigateUrl="#">Details</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlPastoralCare" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Social Behaviour' AS PCIndex, 3 AS Score UNION ALL SELECT 'Motivation to Learn' AS PCIndex, 3 AS Score UNION ALL SELECT 'Extracurricular Participation' AS PCIndex, 4 AS Score UNION ALL SELECT 'Attendance and Punctuality' AS PCIndex, 5 AS Score">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label16" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Attendance Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlAttendance" Width="800px" EmptyDataText="No attendance records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True" ShowFooter="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label28" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Term" HeaderText="Term" SortExpression="Term" 
                            ReadOnly="True" FooterText="Average:" >
                        <FooterStyle HorizontalAlign="Right" />
                        <ItemStyle Width="65%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score (%)" SortExpression="Score">
                            <FooterTemplate>
                                <asp:Label ID="Label36" runat="server" Text='<%# avgAttendance.ToString & "%" %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "Score"), String) & "%" %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkAttendance" runat="server" NavigateUrl="#">Details</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlAttendance" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Term 1' AS Term, 80 AS Score UNION ALL SELECT 'Term 2' AS Term, 90 AS Score UNION ALL SELECT 'Term 3' AS Term, 95 AS Score">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label17" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Homework Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvHomework" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlHomework" Width="800px" EmptyDataText="No homework records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True" ShowFooter="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label37" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Term" HeaderText="Term" SortExpression="Term" 
                            ReadOnly="True" FooterText="Average:" >
                        <FooterStyle HorizontalAlign="Right" />
                        <ItemStyle Width="65%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score (%)" SortExpression="Score">
                            <FooterTemplate>
                                <asp:Label ID="Label38" runat="server" 
                                    Text='<%# avgHomework.ToString & "%" %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label39" runat="server" 
                                    Text='<%# CType(Databinder.Eval(Container.DataItem, "Score"), String) & "%" %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkAttendance0" runat="server" NavigateUrl="#">Details</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlHomework" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Term 1' AS Term, 100 AS Score UNION ALL SELECT 'Term 2' AS Term, 100 AS Score UNION ALL SELECT 'Term 3' AS Term, 98 AS Score">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label19" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Class Movement Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvClassMovement" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlClassMovement" Width="800px" EmptyDataText="No class movement records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label40" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" >
                        <ItemStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class">
                        <ItemStyle Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Remark" HeaderText="Remarks" 
                            SortExpression="Remark" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlClassMovement" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 2009 as [Year], 'Year 5' as Class, 'Promoted' as Remark UNION ALL SELECT 2010, 'Year 6', 'Promoted' UNION ALL SELECT 2011, 'Year 6', 'Repeated' UNION ALL SELECT 2012, 'Year 8', 'Double Promoted'">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label18" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Library Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvLibrary" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlLibrary" Width="800px" EmptyDataText="No library records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label41" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="BookTitle" HeaderText="Book Title" 
                            SortExpression="BookTitle" >
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Borrowed On" SortExpression="BorrowedDate">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# FormatDateTime(CType(Databinder.Eval(Container.DataItem, "BorrowedDate"), Date), DateFormat.LongDate) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Returned On" SortExpression="DateReturned">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# FormatDateTime(CType(Databinder.Eval(Container.DataItem, "DateReturned"), Date), DateFormat.LongDate) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlLibrary" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Alice in Wonderland' as BookTitle, '12/2/11' as BorrowedDate, '12/5/11' as DateReturned UNION ALL SELECT 'Things Fall Apart', '12/2/11', '12/6/11' UNION ALL SELECT 'A Midsummer Night''s Dream', '12/9/11', '12/12/11'">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label20" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Disciplinary Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvDisciplinary" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlDisciplinary" Width="800px" EmptyDataText="No disciplinary records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label42" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Misconduct" HeaderText="Summary of Misconduct" 
                            SortExpression="Misconduct" >
                        </asp:BoundField>
                        <asp:BoundField DataField="DisciplinaryAction" HeaderText="Disciplinary Action" 
                            SortExpression="DisciplinaryAction">
                        <ItemStyle Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ActionCompleted" 
                            HeaderText="Disc. Action Completed?" SortExpression="ActionCompleted">
                        <ItemStyle Width="20%" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlDisciplinary" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Insubordination' as Misconduct, 'Grass Cutting' as DisciplinaryAction, 'Y' as ActionCompleted UNION ALL SELECT 'Noise Making', 'Suspension', 'N'">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label21" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Leadership and Social Activity Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvLeadershipSocial" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlLeadership" Width="800px" EmptyDataText="No leadership and social activity records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label43" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="LeadershipArea" HeaderText="Leadership/Social Activity Area" 
                            SortExpression="LeadershipArea" >
                        </asp:BoundField>
                        <asp:BoundField DataField="PositionHeld" HeaderText="Position Held" 
                            SortExpression="PositionHeld">
                        <ItemStyle Width="25%" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlLeadership" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Prefect' as LeadershipArea, 'Punctuality Prefect' as PositionHeld UNION ALL SELECT 'Girl Guides Club', 'Member' UNION ALL SELECT 'Arts & Crafts Club', 'Member' UNION ALL SELECT 'Press Club', 'President'">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label23" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Sports Activities"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvSports" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlSports" Width="800px" EmptyDataText="No sports activities found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label44" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SportingActivity" HeaderText="Sporting Activity" 
                            SortExpression="SportingActivity" >
                        </asp:BoundField>
                        <asp:BoundField DataField="PositionHeld" HeaderText="Position Held" 
                            SortExpression="PositionHeld">
                        <ItemStyle Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Remark" 
                            HeaderText="Remarks" SortExpression="Remark">
                        <ItemStyle Width="25%" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlSports" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Chess' as SportingActivity, 'Player' as PositionHeld, '--' as Remark UNION ALL SELECT 'Female Basketball', 'Captain', '--' UNION ALL SELECT 'Football (Soccer)', 'Goalkeeper', '--' ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label" runat="server" Font-Bold="True" Font-Size="Small" Text=":: My Medical Incidence Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvMedical" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlMedicalProfile" Width="800px" EmptyDataText="No medical incidences found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label45" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="IncidentDate">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# FormatDateTime(CType(Databinder.Eval(Container.DataItem, "IncidentDate"), Date), DateFormat.LongDate) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="IncidentSummary" HeaderText="Incident Summary" 
                            SortExpression="IncidentSummary">
                        <ItemStyle Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AttendingDoctor" HeaderText="Doctor" 
                            SortExpression="AttendingDoctor" >
                        <ItemStyle Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DoctorsRemark" HeaderText="Doctor's Remarks" 
                            SortExpression="DoctorsRemark" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
              <asp:SqlDataSource ID="dsSqlMedicalProfile" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    SelectCommand="SELECT '12/2/11' as IncidentDate, 'Gash on knee sustained during soccer match' as IncidentSummary, 'Nurse Bridget' as AttendingDoctor, 'The wound was dressed with antiseptic and covered with gauze'  AS DoctorsRemark">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" 
                        Type="String" />
                </SelectParameters>
              </asp:SqlDataSource></td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label24" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Excursion Records"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvExcursion" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlExcursion" Width="800px" EmptyDataText="No excursion records found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label46" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="IncidentDate">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# FormatDateTime(CType(Databinder.Eval(Container.DataItem, "ExcursionDate"), Date), DateFormat.LongDate) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Destination" HeaderText="Destination" 
                            SortExpression="Destination" >
                        <ItemStyle Width="30%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "Duration"), String) & " day(s)" %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Remark" 
                            HeaderText="Remark" SortExpression="Remarks">
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlExcursion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT '12/2/11' as ExcursionDate, 'Olumo Rock, Abeokuta' as Destination, 1 as Duration, '' as Remark UNION ALL SELECT '12/9/11', 'Murtala Mohammed International Airport', 1, '' UNION ALL SELECT '12/16/11', 'Slave Castle, Accra, Ghana', 3, ''">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label25" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: My Previous Schools Attended"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvPreviousSchools" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlPreviousSchools" Width="800px" EmptyDataText="No previous schools found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label47" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SchoolName" HeaderText="School" 
                            SortExpression="SchoolName" >
                        </asp:BoundField>
<asp:BoundField DataField="FromMonth" HeaderText="From" SortExpression="FromMonth">
                        <ItemStyle Width="12%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ToMonth" HeaderText="To" SortExpression="ToMonth">
                        <ItemStyle Width="12%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# CType(Databinder.Eval(Container.DataItem, "Duration"), String) & " months" %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Remark" 
                            HeaderText="Remarks" SortExpression="Remark">
                        <ItemStyle Width="20%" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlPreviousSchools" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Chrisland School, Opebi, Lagos' as SchoolName, 'May 2009' as FromMonth, 'February 2010' as ToMonth, 10 as Duration, '' as Remark UNION ALL SELECT 'Greensprings School, Gbagada, Lagos', 'February 2010', 'January 2011', 12, ''">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td colspan="2"><asp:Label ID="Label26" runat="server" Font-Bold="True" 
                    Font-Size="Small" Text=":: Other Notable Information"></asp:Label></td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="gvOtherInfo" runat="server" AutoGenerateColumns="False" 
                    CssClass="borderedTableGrey" 
                    DataSourceID="dsSqlNotableInfo" Width="800px" EmptyDataText="No other miscellaneous information found." 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label48" runat="server" Text="<%# serial %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Summary" HeaderText="Summary" 
                            SortExpression="Summary" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Remark" HeaderText="Remarks" 
                            SortExpression="Remark">
                        <ItemStyle Width="25%" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlNotableInfo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                    
                    SelectCommand="SELECT 'Other Miscellaneous Info...' as Summary, '--' as Remark">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
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
