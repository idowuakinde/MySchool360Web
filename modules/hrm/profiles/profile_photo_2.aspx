<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_photo_2.aspx.vb" Inherits="modules_profiles_profile_photo_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Photographs & Signatures"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="StaffId,StaffGuid,StaffCode" DataSourceID="dsoUsers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        SelectedIndex="0" PageSize="50" 
                        
                        
                        EmptyDataText="&lt;br /&gt;&lt;br /&gt;No staff records found&lt;br /&gt;&lt;br /&gt;&amp;nbsp;" >
            <Columns>
                <asp:TemplateField HeaderText="Staff Code" SortExpression="StaffCode">
                    <EditItemTemplate>
                        <asp:Label ID="TextBox47" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                   </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label49" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="30px" 
                        ImageUrl='<%# "~\images\pp_staff\" & Databinder.Eval(Container.DataItem, "StaffCode").ToString & ".jpg" %>' 
                        Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" /><br /><asp:Label ID="Label49_2" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "Surname").ToString.ToUpper & " " & Databinder.Eval(Container.DataItem, "OtherNames").ToString.ToUpper %>'></asp:Label>
                        </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:CommandField SelectText="Show Photo &amp; Sign" ShowSelectButton="True">
                <ItemStyle Width="110px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="PHOTOGRAPH &amp; SIGNATURE">
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" valign="top" width="50%">
                                    <asp:Label ID="lblHeader" runat="server" Visible="False" Font-Bold="True" 
                                        Font-Size="Small" 
                                        Text="The current PHOTOGRAPH appears below. &lt;br /&gt;Click to upload a new PHOTOGRAPH."></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:Label ID="lblHeader2" runat="server" Font-Bold="True" Font-Size="Small" 
                                        Text="The current SIGNATURE appears below. &lt;br /&gt;Click to upload a new SIGNATURE." 
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top" width="50%">
                                    <asp:Label ID="lblStatus_Passport" runat="server" Visible="False"></asp:Label>
                                    <br />
                                    <asp:Image ID="imgPassport" runat="server" BorderWidth="3px" Height="250px" 
                                        Visible="False" Width="230px" />
                                    <br />
                                    <asp:FileUpload ID="filePassport" runat="server" Visible="False" 
                                        Width="250px" />
                                    <br />
                                    <asp:Button ID="btnPassport" runat="server" CssClass="defaultButtonStyle" 
                                        onclick="btnPassport_Click" Text="Upload &gt; " Visible="False" />
                                </td>
                                <td align="left" valign="top">
                                    <asp:Label ID="lblStatus_Signature" runat="server" Visible="False"></asp:Label>
                                    <br />
                                    <asp:Image ID="imgSignature" runat="server" BorderWidth="3px" Height="100px" 
                                        Visible="False" Width="300px" />
                                    <br />
                                    <asp:FileUpload ID="fileSignature" runat="server" Visible="False" 
                                        Width="250px" />
                                    <br />
                                    <asp:Button ID="btnSignature" runat="server" CssClass="defaultButtonStyle" 
                                        onclick="btnSignature_Click" Text=" Upload &gt; " Visible="False" />
                                </td>
                            </tr>
                        </table>
                   </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Bold="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" Font-Bold="True" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsoUsers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT [StaffId], [StaffGUID], [StaffCode], [MaritalStatus], CAST(IsNull([WeddingDate], 0) AS DATETIME) AS WeddingDate, [Gender], [DateOfBirth], [ConfirmationStatus], [RetirementStatus], [Surname], [OtherNames], [Department], b.DepartmentName AS DepartmentName, CAST(IsNull([DateOfEmployment], 0) AS DATETIME) AS DateOfEmployment, [Email], a.[DesignationId], c.DesignationName, a.[JobLevelId], d.JobLevelName, a.[LocationId], e.LocationName, [Residence], [PermanentResidence], [Telephone], a.[ReligionId], f.ReligionName, [Hometown], a.[LGAOfOriginId], g.LgaName + ' LGA (' + h.StateName + ')' AS LgaName, a.[BankId], i.BankName, [BankAccountNumber], [Visa], [EyeColour], [Height], [Weight], [TrouserLength], [ShoeSize], [BloodGroup], [Genotype], [Hobbies], a.[AreaOfInterest], [VisaType], [Coop_MonthlyDeduction], [Coop_LoanRepayment], [MaxMedical], [NextOfKinName], [NextOfKinAddress], [NextOfKinRelationship] FROM [dbo].[HR_Staff_Base] a INNER JOIN dbo.[Core_Department] b ON a.Department = b.DepartmentCode LEFT JOIN dbo.[HR_Designation] c ON a.DesignationId = c.DesignationId LEFT JOIN dbo.[HR_JobLevel] d ON a.JobLevelId = d.JobLevelId LEFT JOIN dbo.[HR_Location] e ON a.LocationId = e.LocationId LEFT JOIN dbo.[HR_Religion] f ON a.ReligionId = f.ReligionId LEFT JOIN dbo.[Core_Lga] g ON a.LgaOfOriginId = g.LgaId LEFT JOIN dbo.[Core_State] h ON g.StateId = h.StateId LEFT JOIN dbo.[HR_Bank] i ON a.BankId = i.BankId ORDER BY Surname, OtherNames">
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
