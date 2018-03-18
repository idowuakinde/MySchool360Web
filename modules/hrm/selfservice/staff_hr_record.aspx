<%@ Page Language="VB" AutoEventWireup="false" CodeFile="staff_hr_record.aspx.vb" Inherits="modules_selfservice_staff_hr_record" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>My Staff Record</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../../inc_functions_js.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="880" class="borderedTableGrey">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="75%">
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvUsers" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="StaffCode" DataSourceID="dsSqlGetData" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                        PageSize="1" AllowPaging="True" >
            <Columns>
                <asp:TemplateField HeaderText="MY STAFF RECORD"><ItemTemplate>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="defaultTextStyle">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="borderedTable">
          <tr>
            <td width="5%" valign="top">&nbsp;</td>
            <td width="55%" valign="top">
                <table width="100%" border="0" cellspacing="2" 
                    cellpadding="2">
              <tr>
                <td align="left" width="40%" valign="top"><b>STAFF ID:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("StaffCode") %>' 
                        Font-Bold="True"></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>SURNAME:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Surname") %>' 
                        Font-Bold="True"></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left" valign="top"><b>OTHER NAMES:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Eval("OtherNames").ToString.ToUpper %>' Font-Bold="True"></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left" valign="top"><b>SEX:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Common.GetMaleOrFemale(Eval("Gender").ToString.ToUpper) %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>DATE OF BIRTH (AGE):</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label8" runat="server" 
                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateofBirth"), datetime)) & " {" & Common.GetTimeSpanInYears(CType(Databinder.Eval(Container.DataItem, "DateofBirth"), datetime), now()) & " yrs}" %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left" valign="top"><b>TELEPHONE:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Telephone") %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>E-MAIL:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label7" runat="server" 
                        Text='<%# Eval("Email").ToString.ToLower %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>DEPARTMENT (DEPTCODE):</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label6" runat="server" 
                        
                        Text='<%# Databinder.Eval(Container.DataItem, "DepartmentName").ToString.ToUpper & " (" & Databinder.Eval(Container.DataItem, "Department").ToString & ")" %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left" valign="top"><b>DATE OF EMPLOYMENT:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label9" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateofEmployment"), datetime)) & " {" & Common.GetTimeSpanInYears(CType(Databinder.Eval(Container.DataItem, "DateOfEmployment"), datetime), now()) & " yrs}" %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>LOCATION:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label10" runat="server" 
                        Text='<%# Eval("LocationName").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>DESIGNATION:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label11" runat="server" 
                        Text='<%# Eval("DesignationName").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>CATEGORY:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label13" runat="server" 
                        Text='<%# Eval("JobLevelName").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>RELIGION:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label12" runat="server" 
                        Text='<%# Eval("ReligionName").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>BANK:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label14" runat="server" 
                        Text='<%# Eval("Bank").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>BANK ACCOUNT NUMBER:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label15" runat="server" 
                        Text='<%# Eval("BankAccountNumber").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>COUNTRY OF ORIGIN:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label16" runat="server" 
                        Text='<%# Eval("CountryName").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>LGA &amp; STATE OF ORIGIN:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label17" runat="server" 
                        Text='<%# Eval("LgaName").ToString.ToUpper & " LGA (" & Eval("StateName").ToString.ToUpper & ")" %>'></asp:Label>
                  </td>
              </tr>
                    <tr>
                        <td align="left" valign="top">
                            <b>VISA TYPE:</b></td>
                        <td align="left" valign="top">
                            <asp:Label ID="Label18" runat="server" 
                                Text='<%# Eval("VisaType").ToString.ToUpper %>'></asp:Label>
                        </td>
                    </tr>
              <tr>
                <td align="left" valign="top"><b>HOBBIES:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label19" runat="server" 
                        Text='<%# Eval("Hobbies").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td align="left" valign="top"><b>SPECIAL INTEREST(S):</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label20" runat="server" 
                        Text='<%# Eval("AreaOfInterest").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
                    <tr>
                        <td align="left" valign="top">
                            <b>RESIDENCE:</b></td>
                        <td align="left" valign="top">
                            <asp:Label ID="Label21" runat="server" 
                                Text='<%# Eval("Residence").ToString.ToUpper %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <b>NEXT OF KIN NAME:</b></td>
                        <td align="left" valign="top">
                            <asp:Label ID="Label32" runat="server" 
                                Text='<%# Eval("NextOfKinName").ToString.ToUpper %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <b>NEXT OF KIN ADDRESS:</b></td>
                        <td align="left" valign="top">
                            <asp:Label ID="Label33" runat="server" 
                                Text='<%# Eval("NextOfKinAddress").ToString.ToUpper %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <b>NEXT OF KIN RELATIONSHIP:</b></td>
                        <td align="left" valign="top">
                            <asp:Label ID="Label34" runat="server" 
                                Text='<%# Eval("NextOfKinRelationship").ToString.ToUpper %>'></asp:Label>
                        </td>
                    </tr>
              </table></td>
            <td valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td colspan="2" align="left">
                    <asp:Image ID="Image1" runat="server" BorderWidth="3px" Height="180px" 
                        Width="180px" 
                        ImageUrl='<%# "~\_uploads\photos\photo_" & Databinder.Eval(Container.DataItem, "StaffGUID").ToString & ".jpg" %>' />
                  </td>
                </tr>
              <tr>
                <td width="50%" valign="top">&nbsp;</td>
                <td align="left" valign="top">&nbsp;</td>
              </tr>
                <tr>
                    <td width="50%" valign="top">
                        <b>MARITAL STATUS:</b></td>
                    <td align="left" valign="top">
                        <asp:Label ID="Label22" runat="server" 
                            Text='<%# Eval("MaritalStatus").ToString.ToUpper %>'></asp:Label>
                    </td>
                </tr>
              <tr>
                <td valign="top"><b>WEDDING DATE:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label23" runat="server" 
                        Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem, "WeddingDate"), datetime)) %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td valign="top"><b>HOMETOWN:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label24" runat="server" 
                        Text='<%# Eval("HomeTown").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td valign="top"><b>EYE COLOUR:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label25" runat="server" 
                        Text='<%# Eval("EyeColour").ToString.ToUpper %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td valign="top"><b>HEIGHT:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label26" runat="server" 
                        Text='<%# Eval("Height").ToString.ToUpper & " m" %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td valign="top"><b>WEIGHT:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label27" runat="server" 
                        Text='<%# Eval("Weight").ToString.ToUpper & " kg" %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td valign="top"><b>SHOE SIZE:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label28" runat="server" 
                        Text='<%# Eval("Shoesize").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td valign="top"><b>BLOOD GROUP:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label29" runat="server" 
                        Text='<%# Eval("BloodGroup").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              <tr>
                <td valign="top"><b>GENOTYPE:</b></td>
                <td align="left" valign="top">
                    <asp:Label ID="Label30" runat="server" 
                        Text='<%# Eval("Genotype").ToString.ToUpper %>'></asp:Label>
                  </td>
              </tr>
              </table></td>
            <td width="5%" valign="top">&nbsp;</td>
            </tr>
          <tr>
            <td valign="top"></td>
            <td colspan="2" valign="top">
                <hr />
              </td>
            <td valign="top"></td>
          </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="SPOUSES (MAXIMUM OF 3):"></asp:Label>
                    <b></b></td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="StaffSpouseId" 
                        DataSourceID="dsSqlGetSpouses" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" 
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffSpouseId" HeaderText="Id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="StaffSpouseId" Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label55" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label50" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Spouse Name" SortExpression="SpouseName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox48" runat="server" Columns="20" 
                                        Text='<%# Bind("SpouseName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label51" runat="server" Text='<%# Bind("SpouseName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Spouse Address" SortExpression="SpouseAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox49" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("SpouseAddress") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label52" runat="server" Text='<%# Bind("SpouseAddress") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Telephone(s)" SortExpression="SpouseTelephone">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox50" runat="server" Columns="20" 
                                        Text='<%# Bind("SpouseTelephone") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label53" runat="server" Text='<%# Bind("SpouseTelephone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Gender") %>'>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label54" runat="server" 
                                        Text='<%# Common.GetMaleOrFemale(DataBinder.Eval(Container.DataItem,"Gender").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetSpouses" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [StaffSpouseId], [StaffId], [SpouseName], [SpouseAddress], [SpouseTelephone], [Gender], [Remark] FROM [dbo].[HR_Staff_Spouse] WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="CHILDREN (MAXIMUM OF 7):"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail0" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="StaffChildId" 
                        DataSourceID="dsSqlGetChildren" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffChildId" HeaderText="Id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="StaffChildId" Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label61" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label62" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Child Name" SortExpression="ChildName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox55" runat="server" Columns="20" 
                                        Text='<%# Bind("ChildName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label57" runat="server" Text='<%# Bind("ChildName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Telephone" SortExpression="Telephone">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox56" runat="server" Columns="20" 
                                        Text='<%# Bind("Telephone") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label58" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList8" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Gender") %>'>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label59" runat="server" 
                                        Text='<%# Common.GetMaleOrFemale(DataBinder.Eval(Container.DataItem,"Gender").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Birthdate" SortExpression="Birthdate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox57" runat="server" Text='<%# Bind("Birthdate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label60" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(DataBinder.Eval(Container.DataItem,"BirthDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Age">
                                <ItemTemplate>
                                    <asp:Label ID="Label63" runat="server" 
                                        Text='<%# Common.GetTimespanInYears(CType(DataBinder.Eval(Container.DataItem,"BirthDate"), Date), now.Date).ToString & " yrs" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetChildren" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffChildId], [StaffId], [ChildName], [Telephone], [Gender], [Birthdate], [Remark] FROM [dbo].[HR_Staff_Child] WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label64" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="QUALIFICATIONS:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail1" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                        DataKeyNames="StaffCertificateId" DataSourceID="dsSqlGetQuals" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffCertificateId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffCertificateId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label65" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label66" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Certificate" SortExpression="CertificateCodeId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCertificate" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetCertificates2" 
                                        DataTextField="FullName" DataValueField="CertificateCodeId" 
                                        SelectedValue='<%# Bind("CertificateCodeId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlGetCertificates2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [CertificateCodeId], [CertificateCodeName] + ' (' + [FullName] + ') ' AS FullName FROM [HR_CertificateCode] ORDER BY FullName">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label67" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Discipline" SortExpression="DisciplineId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList9" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetDisciplines" 
                                        DataTextField="DisciplineName" DataValueField="DisciplineId" 
                                        SelectedValue='<%# Bind("DisciplineId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlGetDisciplines" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [DisciplineId], [DisciplineName] FROM [HR_Discipline] ORDER BY [DisciplineName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label68" runat="server" Text='<%# Eval("DisciplineName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Awarded By" SortExpression="CertificateTypeId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlCertificateTypes2" 
                                        DataTextField="CertificateTypeName" DataValueField="CertificateTypeId" 
                                        SelectedValue='<%# Bind("CertificateTypeId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlCertificateTypes2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [InstitutionId] AS CertificateTypeId, [InstitutionName] + ' (' + [CertificateTypeName] + ') ' AS CertificateTypeName FROM [HR_Institution] a INNER JOIN [HR_CertificateType] b ON a.InstitutionTypeId = b.CertificateTypeId ORDER BY CertificateTypeName">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label69" runat="server" 
                                        Text='<%# Bind("CertificateTypeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Year" SortExpression="YearObtained">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlYearObtained_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("YearObtained") %>'>
                                        <asp:ListItem value="2011">2011</asp:ListItem>
                                        <asp:ListItem value="2010">2010</asp:ListItem>
                                        <asp:ListItem value="2009">2009</asp:ListItem>
                                        <asp:ListItem value="2008">2008</asp:ListItem>
                                        <asp:ListItem value="2007">2007</asp:ListItem>
                                        <asp:ListItem value="2006">2006</asp:ListItem>
                                        <asp:ListItem value="2005">2005</asp:ListItem>
                                        <asp:ListItem value="2004">2004</asp:ListItem>
                                        <asp:ListItem value="2003">2003</asp:ListItem>
                                        <asp:ListItem value="2002">2002</asp:ListItem>
                                        <asp:ListItem value="2001">2001</asp:ListItem>
                                        <asp:ListItem value="2000">2000</asp:ListItem>
                                        <asp:ListItem value="1999">1999</asp:ListItem>
                                        <asp:ListItem value="1998">1998</asp:ListItem>
                                        <asp:ListItem value="1997">1997</asp:ListItem>
                                        <asp:ListItem value="1996">1996</asp:ListItem>
                                        <asp:ListItem value="1995">1995</asp:ListItem>
                                        <asp:ListItem value="1994">1994</asp:ListItem>
                                        <asp:ListItem value="1993">1993</asp:ListItem>
                                        <asp:ListItem value="1992">1992</asp:ListItem>
                                        <asp:ListItem value="1991">1991</asp:ListItem>
                                        <asp:ListItem value="1990">1990</asp:ListItem>
                                        <asp:ListItem value="1989">1989</asp:ListItem>
                                        <asp:ListItem value="1988">1988</asp:ListItem>
                                        <asp:ListItem value="1987">1987</asp:ListItem>
                                        <asp:ListItem value="1986">1986</asp:ListItem>
                                        <asp:ListItem value="1985">1985</asp:ListItem>
                                        <asp:ListItem value="1984">1984</asp:ListItem>
                                        <asp:ListItem value="1983">1983</asp:ListItem>
                                        <asp:ListItem value="1982">1982</asp:ListItem>
                                        <asp:ListItem value="1981">1981</asp:ListItem>
                                        <asp:ListItem value="1980">1980</asp:ListItem>
                                        <asp:ListItem value="1979">1979</asp:ListItem>
                                        <asp:ListItem value="1978">1978</asp:ListItem>
                                        <asp:ListItem value="1977">1977</asp:ListItem>
                                        <asp:ListItem value="1976">1976</asp:ListItem>
                                        <asp:ListItem value="1975">1975</asp:ListItem>
                                        <asp:ListItem value="1974">1974</asp:ListItem>
                                        <asp:ListItem value="1973">1973</asp:ListItem>
                                        <asp:ListItem value="1972">1972</asp:ListItem>
                                        <asp:ListItem value="1971">1971</asp:ListItem>
                                        <asp:ListItem value="1970">1970</asp:ListItem>
                                        <asp:ListItem value="1969">1969</asp:ListItem>
                                        <asp:ListItem value="1968">1968</asp:ListItem>
                                        <asp:ListItem value="1967">1967</asp:ListItem>
                                        <asp:ListItem value="1966">1966</asp:ListItem>
                                        <asp:ListItem value="1965">1965</asp:ListItem>
                                        <asp:ListItem value="1964">1964</asp:ListItem>
                                        <asp:ListItem value="1963">1963</asp:ListItem>
                                        <asp:ListItem value="1962">1962</asp:ListItem>
                                        <asp:ListItem value="1961">1961</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label70" runat="server" Text='<%# Eval("YearObtained") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry?" SortExpression="IsEntryQual">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList10" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("IsEntryQual") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label71" runat="server" 
                                        Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "IsEntryQual").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetQuals" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT a.[StaffCertificateId], a.[StaffId], a.[CertificateCodeId], CertificateCodeName + ' (' + FullName + ')' AS FullName, c.InstitutionId AS CertificateTypeId, c.InstitutionName + ' (' + e.CertificateTypeName + ') ' AS CertificateTypeName, a.[DisciplineId], DisciplineName, YearObtained, IsEntryQual, a.[Remark] FROM [HR_Staff_Qualification] a INNER JOIN [HR_CertificateCode] b ON a.CertificateCodeId = b.CertificateCodeId INNER JOIN [HR_Institution] c ON a.CertificateTypeId = c.InstitutionId INNER JOIN [HR_Discipline] d ON a.DisciplineId = d.DisciplineId INNER JOIN [HR_CertificateType] e ON c.InstitutionTypeId = e.CertificateTypeId WHERE a.StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label72" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="EMPLOYMENT HISTORY:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="StaffEmploymentId" 
                        DataSourceID="dsSqlGetEmpl" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffEmploymentId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffEmploymentId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label73" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label74" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employer" SortExpression="EmployerName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="20" 
                                        Text='<%# Bind("EmployerName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label75" runat="server" Text='<%# Bind("EmployerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" SortExpression="EmployerAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Rows="3" 
                                        Text='<%# Bind("EmployerAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label76" runat="server" Text='<%# Bind("EmployerAddress") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start" SortExpression="StartDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="10" 
                                        Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label77" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(DataBinder.Eval(Container.DataItem,"StartDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End" SortExpression="EndDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="10" 
                                        Text='<%# Bind("EndDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label78" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(DataBinder.Eval(Container.DataItem, "EndDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration">
                                <ItemTemplate>
                                    <asp:Label ID="Label79" runat="server" 
                                        Text='<%# Common.GetTimespanInMonths(CType(Databinder.Eval(Container.DataItem, "StartDate"), Date), CType(Databinder.Eval(Container.DataItem, "EndDate"), Date)).ToString & " mths" %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Exit Reason" SortExpression="ExitReason">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Columns="20" 
                                        Text='<%# Bind("ExitReason") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label80" runat="server" Text='<%# Bind("ExitReason") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Pay" SortExpression="LastPay">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("LastPay") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    N
                                    <asp:Label ID="Label81" runat="server" 
                                        Text='<%# FormatNumber(Databinder.Eval(Container.DataItem,"LastPay"), 0) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact" SortExpression="Reference" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Columns="20" 
                                        Text='<%# Bind("Reference") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label82" runat="server" Text='<%# Bind("Reference") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetEmpl" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffEmploymentId], [StaffId], [EmployerName], [EmployerAddress], [StartDate], [EndDate], [ExitReason], [LastPay], [Reference], [Remark] FROM [dbo].[HR_Staff_PreviousEmployment] WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label83" runat="server" Font-Bold="True" Font-Underline="True" Text="CAREER MOVEMENT:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail3" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="StaffMovementId" 
                        DataSourceID="dsSqlGetCareer" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffMovementId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffMovementId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label84" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label85" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="MovementType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList12" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("MovementType") %>'>
                                        <asp:ListItem Value="D">Demotion</asp:ListItem>
                                        <asp:ListItem Value="P">Promotion</asp:ListItem>
                                        <asp:ListItem Value="S">Suspension</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label86" runat="server" 
                                        Text='<%# Common.GetFullCareerMovementType(Databinder.Eval(Container.DataItem, "MovementType").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From" SortExpression="FormerDesignationId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList13" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlDesignations3" 
                                        DataTextField="DesignationName" DataValueField="DesignationId" 
                                        SelectedValue='<%# Bind("FormerDesignationId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlDesignations3" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [DesignationId], [DesignationName] FROM [HR_Designation] ORDER BY [DesignationName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label87" runat="server" Text='<%# Bind("FormerDesignation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="To" SortExpression="NewDesignationId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList11" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlDesignations4" 
                                        DataTextField="DesignationName" DataValueField="DesignationId" 
                                        SelectedValue='<%# Bind("NewDesignationId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlDesignations4" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [DesignationId], [DesignationName] FROM [HR_Designation] ORDER BY [DesignationName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label88" runat="server" Text='<%# Bind("NewDesignation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Effective Date" SortExpression="EffectiveDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox23" runat="server" Columns="10" 
                                        Text='<%# Bind("EffectiveDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label89" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "EffectiveDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetCareer" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffMovementId], [StaffId], [FormerDesignationId], b.[DesignationName] AS FormerDesignation, [NewDesignationId], c.[DesignationName] AS NewDesignation, [MovementType], [EffectiveDate], a.[Remark] FROM [dbo].[HR_Staff_Movement] a INNER JOIN dbo.[HR_Designation] b ON a.FormerDesignationId = b.DesignationId INNER JOIN dbo.[HR_Designation] c ON a.NewDesignationId = c.DesignationId WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label90" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="SPOKEN LANGUAGES (MAXIMUM OF 6):"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail4" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="StaffLanguageId" 
                        DataSourceID="dsSqlGetLanguages" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffLanguageId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffLanguageId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label91" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label92" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Language" SortExpression="LanguageId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList14" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSalLanguages2" 
                                        DataTextField="LanguageName" DataValueField="LanguageId" 
                                        SelectedValue='<%# Bind("LanguageId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSalLanguages2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [LanguageId], [LanguageName] FROM [HR_Language] ORDER BY [LanguageName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label93" runat="server" Text='<%# Bind("LanguageName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Proficiency" SortExpression="Proficiency">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList8_2" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Proficiency") %>'>
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
                                    </asp:DropDownList>
                                    &nbsp;(On a scale of 1 - 10)
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label94" runat="server" Text='<%# Bind("Proficiency") %>'></asp:Label>
                                    / 10
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                            VerticalAlign="Middle" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetLanguages" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffLanguageId], [StaffId], a.[LanguageId], b.LanguageName, [Proficiency], a.[Remark] FROM [dbo].[HR_Staff_Language] a INNER JOIN dbo.[HR_Language] b ON a.LanguageId = b.LanguageId WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label95" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="PROFESSIONAL TRAININGS ATTENDED:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail5" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                        DataKeyNames="StaffTrainingId" DataSourceID="dsSqlGetTrainings" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffTrainingId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffTrainingId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label96" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label97" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Training Programme" SortExpression="TrainingId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList15" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTrainings1" 
                                        DataTextField="TrainingDesc" DataValueField="TrainingId" 
                                        SelectedValue='<%# Bind("TrainingId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlTrainings1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT a.[TrainingId], a.CourseName + ' (' + CAST(a.DurationInDays AS VARCHAR) + ' days; ' + b.ProviderName + '; ' + b.ProviderAddress + ')' AS TrainingDesc FROM [dbo].[HR_Training] a INNER JOIN dbo.[HR_TrainingProvider] b ON a.TrainingProviderId = b.TrainingProviderId">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label98" runat="server" Text='<%# Bind("TrainingDesc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetTrainings" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        DeleteCommand="STP_HR_DELETE_HR_Staff_Training" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_Staff_Training" 
                        InsertCommandType="StoredProcedure" 
                        SelectCommand="SELECT [StaffTrainingId], [StaffId], a.[TrainingId], b.CourseName + ' (' + CAST(b.DurationInDays AS VARCHAR) + ' days; ' + c.ProviderName + '; ' + c.ProviderAddress + ')' AS TrainingDesc, a.[Remark] FROM [dbo].[HR_Staff_Training] a INNER JOIN dbo.[HR_Training] b ON a.TrainingId = b.TrainingId INNER JOIN dbo.[HR_TrainingProvider] c ON b.TrainingProviderId = c.TrainingProviderId WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) " 
                        UpdateCommand="STP_HR_UPDATE_HR_Staff_Training" 
                        UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="StaffTrainingId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StaffTrainingId" Type="Int32" />
                            <asp:Parameter Name="StaffId" Type="Int32" />
                            <asp:Parameter Name="TrainingId" Type="Int32" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="StaffTrainingId" Type="Int32" />
                            <asp:Parameter Name="StaffId" Type="Int32" />
                            <asp:Parameter Name="TrainingId" Type="Int32" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label99" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="LEAVE HISTORY:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail6" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                        DataKeyNames="StaffLeaveId" DataSourceID="dsSqlGetLeave" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffLeaveId" HeaderText="Id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="StaffLeaveId" Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label100" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label101" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="LeaveTypeId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList16" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlLeaveTypes2" 
                                        DataTextField="LeaveTypeName" DataValueField="LeaveTypeId" 
                                        SelectedValue='<%# Bind("LeaveTypeId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlLeaveTypes2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [LeaveTypeId], [LeaveTypeName] FROM [HR_LeaveType] ORDER BY [LeaveTypeName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label102" runat="server" Text='<%# Bind("LeaveTypeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration" SortExpression="DurationInDays">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Columns="3" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("DurationInDays") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label103" runat="server" Text='<%# Bind("DurationInDays") %>'></asp:Label>
                                    d
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start" SortExpression="StartDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox58" runat="server" Columns="10" 
                                        Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label104" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem,"StartDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resumption" SortExpression="ResumptionDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox59" runat="server" Columns="10" 
                                        Text='<%# Bind("ResumptionDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label105" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem,"ResumptionDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact" SortExpression="ContactAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox60" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Rows="5" 
                                        Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                    <asp:TextBox ID="TextBox61" runat="server" Columns="10" 
                                        Text='<%# Bind("ContactTelephone") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label106" runat="server" Text='<%# Bind("ContactAddress") %>'></asp:Label>
                                    (<asp:Label ID="Label107" runat="server" Text='<%# Bind("ContactTelephone") %>'></asp:Label>
                                    )
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Handover" SortExpression="HandoverStaffId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4_3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetAllStaff_3" 
                                        DataTextField="StaffDetails" DataValueField="StaffId" 
                                        SelectedValue='<%# Bind("HandoverStaffId") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlGetAllStaff_3" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT 0 AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT [StaffId], UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER([DepartmentName]) + ' Department)' FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) ">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label108" runat="server" Text='<%# Bind("StaffDetails") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="1st Appr?" SortExpression="ApprovedBySuperior">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7_2" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("ApprovedBySuperior") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label109" runat="server" 
                                        Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "ApprovedBySuperior").ToString) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="2nd Appr?" SortExpression="ApprovedByHRManager">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7_3" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("ApprovedByHRManager") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label110" runat="server" 
                                        Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "ApprovedByHRManager").ToString) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark" SortExpression="Remark" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox62" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label111" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlGetLeave" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffLeaveId], a.[StaffId], a.[LeaveTypeId], b.LeaveTypeName, [DurationInDays], [StartDate], [ResumptionDate], [ContactAddress], [ContactTelephone], a.[HandoverStaffId], UPPER(c.[Surname]) + ' ' + UPPER(c.[OtherNames]) + ' | ' + UPPER(c.[StaffCode]) + ' | (' + UPPER(d.[DepartmentName]) + ' Department)' AS StaffDetails, [ApprovedBySuperior], [ApprovedByHRManager], a.[Remark] FROM [dbo].[HR_Staff_Leave] a INNER JOIN dbo.[HR_LeaveType] b ON a.LeaveTypeId = b.LeaveTypeId INNER JOIN dbo.[HR_Staff_Base] c ON a.HandoverStaffId = c.StaffId INNER JOIN dbo.[Core_Department] d ON c.Department = left(d.DepartmentName, charindex('.', d.DepartmentName) - 1) WHERE a.StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label112" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="HOSPITAL VISITS:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail7" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                        DataKeyNames="StaffMedicalId" DataSourceID="dsSqlGetHospital" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffMedicalId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffMedicalId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label113" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label114" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hospital" SortExpression="HospitalId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList17" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlHospitals2" 
                                        DataTextField="HospitalName" DataValueField="HospitalId" 
                                        SelectedValue='<%# Bind("HospitalId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlHospitals2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [HospitalId], [HospitalName] FROM [HR_Hospital] ORDER BY [HospitalName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label115" runat="server" Text='<%# Bind("HospitalName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Who?" SortExpression="WhoVisited">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7_4" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("WhoVisited") %>'>
                                        <asp:ListItem>Staff</asp:ListItem>
                                        <asp:ListItem>Dependant - Wife</asp:ListItem>
                                        <asp:ListItem>Dependant - Husband</asp:ListItem>
                                        <asp:ListItem>Dependant - Child</asp:ListItem>
                                        <asp:ListItem>Dependant - Other</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label116" runat="server" Text='<%# Bind("WhoVisited") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Summary" SortExpression="BriefSummary">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox63" runat="server" Columns="20" 
                                        Text='<%# Bind("BriefSummary") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label117" runat="server" Text='<%# Bind("BriefSummary") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Details" SortExpression="DetailedDescription" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox64" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Rows="3" 
                                        Text='<%# Bind("DetailedDescription") %>' TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label118" runat="server" 
                                        Text='<%# Bind("DetailedDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dr's Remark" SortExpression="DoctorsRemark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox65" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("DoctorsRemark") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label119" runat="server" Text='<%# Bind("DoctorsRemark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Admitted" SortExpression="DateAttended">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox66" runat="server" Columns="10" 
                                        Text='<%# Bind("DateAttended") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label120" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateAttended"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Discharged" SortExpression="DateDischarged">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox67" runat="server" Columns="10" 
                                        Text='<%# Bind("DateDischarged") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label121" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateDischarged"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cost" SortExpression="MedicalExpenses">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox68" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("MedicalExpenses") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    N<asp:Label ID="Label122" runat="server" 
                                        Text='<%# FormatNumber(Databinder.Eval(Container.DataItem, "MedicalExpenses"), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetHospital" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffMedicalId], [StaffId], a.[HospitalId], b.HospitalName, [WhoVisited], [BriefSummary], [DetailedDescription], [DoctorsRemark], [DateAttended], [DateDischarged], [MedicalExpenses], a.[Remark] FROM [dbo].[HR_Staff_Medical] a INNER JOIN dbo.[HR_Hospital] b ON a.HospitalId = b.HospitalId WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <hr />
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:Label ID="Label123" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="MISCONDUCTS:"></asp:Label>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    <asp:GridView ID="gvDetail8" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" CssClass="noBorderedMenuTable" 
                        DataKeyNames="StaffMisconductId" DataSourceID="dsSqlGetMisconduct" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        Font-Bold="False" ForeColor="#333333" GridLines="None" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="StaffMisconductId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="StaffMisconductId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label124" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label125" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Summary" SortExpression="BriefSummary">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox69" runat="server" Columns="20" 
                                        Text='<%# Bind("BriefSummary") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label126" runat="server" Text='<%# Bind("BriefSummary") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Details" SortExpression="DetailedDescription" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox70" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Rows="3" 
                                        Text='<%# Bind("DetailedDescription") %>' TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label127" runat="server" 
                                        Text='<%# Bind("DetailedDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Misconduct Date" 
                                SortExpression="DateOfMisdemeanour">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox71" runat="server" Columns="10" 
                                        Text='<%# Bind("DateOfMisdemeanour") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label128" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem,"DateOfMisdemeanour"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Punishment" 
                                SortExpression="PrescribedPunishment">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7_5" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("PrescribedPunishment") %>'>
                                        <asp:ListItem>Forced Resignation</asp:ListItem>
                                        <asp:ListItem>Leave Without Pay</asp:ListItem>
                                        <asp:ListItem>Summary Dismissal</asp:ListItem>
                                        <asp:ListItem>Suspension</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label129" runat="server" 
                                        Text='<%# Bind("PrescribedPunishment") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Punishment Start Date" 
                                SortExpression="PunishmentCommencementDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox72" runat="server" Columns="10" 
                                        Text='<%# Bind("PunishmentCommencementDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label130" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem,"PunishmentCommencementDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Punishment End Date" 
                                SortExpression="PunishmentCompletionDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox34" runat="server" Columns="10" 
                                        Text='<%# Bind("PunishmentCompletionDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label131" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem,"PunishmentCompletionDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Punishment Completed?" 
                                SortExpression="PunishmentCarriedOut">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6_2" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("PunishmentCarriedOut") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label132" runat="server" 
                                        Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "PunishmentCarriedOut").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlGetMisconduct" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [StaffMisconductId], [StaffId], [BriefSummary], [DetailedDescription], [DateOfMisdemeanour], [PrescribedPunishment], [PunishmentCommencementDate], [PunishmentCompletionDate], [PunishmentCarriedOut], [Remark] FROM [dbo].[HR_Staff_Misconduct] WHERE StaffId IN (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode) ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td colspan="2" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
            </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table>

                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                        Font-Underline="True" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT a.StaffGUID, a.StaffId, a.StaffCode, RTRIM(LTRIM(UPPER(IsNull(a.Surname,'')))) AS Surname, RTRIM(LTRIM(IsNull(a.OtherNames,''))) AS OtherNames, IsNull(Gender, '') as Gender, IsNull(Email, '') as Email, Telephone, DateOfBirth, DateofEmployment, IsNull(MaritalStatus, '') as MaritalStatus, WeddingDate, a.LocationId, LocationName, a.Department, f.DepartmentName, a.JobLevelId, JobLevelName, a.DesignationId, d.DesignationName, e.LgaName, a.LgaOfOriginId, i.StateName, j.CountryName, IsNull(BloodGroup, '') as Bloodgroup, IsNull(Genotype, '') as Genotype, IsNull(AreaOfInterest, '') as AreaOfInterest, IsNull(Hobbies, '') as Hobbies, IsNull(Visa, '') as Challenged, g.ReligionName, h.ShortName as Bank, IsNull(BankAccountNumber, '') AS BankAccountNumber, VisaType, Hobbies, AreaOfInterest, Residence, HomeTown, EyeColour, Height, Weight, Shoesize, BloodGroup, Genotype, NextOfKinName, NextOfKinAddress, NextOfKinRelationship FROM dbo.HR_Staff_Base a INNER JOIN dbo.HR_Location b ON a.LocationId = b.LocationId INNER JOIN dbo.HR_JobLevel c ON a.JobLevelId = c.JobLevelId INNER JOIN dbo.HR_Designation d ON a.DesignationId = d.DesignationId INNER JOIN dbo.Core_Lga e ON a.LgaOfOriginId = e.LgaId INNER JOIN dbo.Core_Department f ON a.Department = left(f.DepartmentName, charindex('.', f.DepartmentName) - 1) INNER JOIN dbo.HR_Religion g ON a.ReligionId = g.ReligionId INNER JOIN dbo.HR_Bank h ON a.BankId = h.BankId INNER JOIN dbo.Core_State i ON e.StateId = i.StateId INNER JOIN dbo.Core_Country j ON i.CountryId = j.CountryId WHERE a.StaffCode = @StaffCode ORDER BY Surname, OtherNames  ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlGetAllStaff" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT '0' AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT a.StaffCode as StaffId, LTRIM(UPPER(IsNull(a.Surname, '')) + ' ' + UPPER(IsNull(a.OtherNames, '')) + ' | ' + UPPER(IsNull(a.StaffCode, '')) + ' | (' + UPPER(b.DepartmentName) + ' Department)') AS StaffDetails FROM dbo.HR_Staff_Base a INNER JOIN dbo.Core_Department b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) ORDER BY StaffDetails ">
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
    
      </div>
    </form>
</body>
</html>
