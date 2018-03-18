<%@ Page Language="VB" AutoEventWireup="false" CodeFile="input_appraisals.aspx.vb" Inherits="modules_hr_input_appraisals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
                            DataSourceID="dsSqlTeacherPerf" DefaultMode="Insert" EmptyDataText="No data." 
                            ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
                            <HeaderTemplate>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="center" rowspan="8" valign="middle" width="200">
                                            <img border="2" height="120" 
                                                src="../../../images/logos/logo.23.jpg" /></td>
                                        <td align="center" rowspan="8" valign="middle">
                                            APPRAISAL GRADE SCALE</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center" width="400">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            5</td>
                                        <td align="center">
                                            EXCELLENT</td>
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
                                        <td align="center" rowspan="8" valign="middle" width="200">
                                            <img border="2" height="120" src="../../../images/logos/logo.23.jpg" /></td>
                                        <td align="center" rowspan="8" valign="middle">
                                            APPRAISAL GRADE SCALE</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center" width="400">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            5</td>
                                        <td align="center">
                                            EXCELLENT</td>
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
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="PLEASE SELECT A STAFF TO EVALUATE:">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetSingleStaff" 
                                            DataTextField="StaffDetails" DataValueField="StaffId" 
                                            SelectedValue='<%# Bind("StaffId") %>' AutoPostBack="True" 
                                            onselectedindexchanged="DropDownList5_SelectedIndexChanged">
                                            <asp:ListItem Value="0"> Please select a staff</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:Image ID="imgPhoto" runat="server" Height="60px" 
                                            ImageUrl=''
                                            Width="60px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />                                        
                                        <asp:SqlDataSource ID="dsSqlGetSingleStaff" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT [StaffCode] AS StaffId, UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER(b.[DepartmentName]) + ' Department)' AS StaffDetails FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = b.DepartmentCode ORDER BY StaffDetails">
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="1). RESULT:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Accuracy of Reports.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Punctuality of Reports.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Effectiveness & Efficiency of Working Time.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d. Communication & Support with other Departments.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e. Sense of Responsibility for the Work.">
                                    <InsertItemTemplate>
                                        <table width="300px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>EVALUATOR 1</b></td>
                                            <td><b>EVALUATOR 2</b></td>
                                            <td><b>EVALUATOR 3 - FINAL</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo1" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo2" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo3" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo4" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo5" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" 
                                                    cellspacing="2" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" 
                                                    cellspacing="2" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="2). GROWTH AND WORKING ABILITY:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Better understanding of Job Assignment.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Improvement on job & Proposal activity for improvement.">
                                    <InsertItemTemplate>
                                        <table width="300px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>EVALUATOR 1</b></td>
                                            <td><b>EVALUATOR 2</b></td>
                                            <td><b>EVALUATOR 3 - FINAL</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo6" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo7" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList12" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList14" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="3). ATTITUDE:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Discipline and Politeness.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Motivation & Loyalty to the job.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Honesty.">
                                    <InsertItemTemplate>
                                        <table width="300px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>EVALUATOR 1</b></td>
                                            <td><b>EVALUATOR 2</b></td>
                                            <td><b>EVALUATOR 3 - FINAL</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo8" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo9" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="rdo10" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList15" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList16" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList17" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2" bgcolor="#CCCCCC">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList18" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:RadioButtonList ID="RadioButtonList20" runat="server" RepeatDirection="Horizontal" 
                                                        Width="200px" RepeatLayout="Flow" Enabled="false">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="4). OTHER FACTORS:&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Query.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Warning.&lt;br /&gt;&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Others.">
                                    <InsertItemTemplate>
                                        <table width="200px" border="0" class="borderedTable">
                                          <tr align="center" valign="top">
                                            <td><b>Frequency x {Points}</b></td>
                                          </tr>
                                          <tr align="center" valign="top">
                                            <td width="33%">
                                                <table width="100%" border="0" class="borderedTable" cellpadding="2" cellspacing="2">
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:TextBox ID="txtAppraisalQuery" runat="server" 
                                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                                    &nbsp;x
                                                    <asp:Label ID="lblAppraisalQuery" runat="server" Font-Bold="True" Text="0"></asp:Label>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td align="center" valign="middle">
                                                    <asp:TextBox ID="txtAppraisalWarning" runat="server" 
                                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                                    &nbsp;x&nbsp;<asp:Label ID="lblAppraisalWarning" runat="server" Font-Bold="True" Text="0"></asp:Label>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td  align="center" valign="middle">
                                                    <asp:TextBox ID="txtAppraisalOthers" runat="server" 
                                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                                    &nbsp;x&nbsp;<asp:Label ID="lblAppraisalOthers" runat="server" Font-Bold="True" Text="0"></asp:Label>
                                                  </td>
                                              </tr>
                                            </table>
                                            </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="5). COMMENTS:">
                                    <InsertItemTemplate>
                                        <table width="600px" border="0" class="borderedTable">
                                          <tr valign="top">
                                            <td>
                                                <asp:TextBox ID="txtComments" runat="server" Columns="115" 
                                                    CssClass="defaultFormElementStyle" Rows="7" TextMode="MultiLine"></asp:TextBox>
                                              </td>
                                          </tr>
                                        </table>                                   
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:CommandField ButtonType="Button" InsertText="Submit" 
                                    ShowInsertButton="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:CommandField>
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
                        <asp:SqlDataSource ID="dsSqlTeacherPerf" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT [StaffGUID], [StaffId], [StaffCode], UPPER([Surname]) AS Surname, UPPER([OtherNames]) AS OtherNames FROM [HR_Staff_Base] ORDER BY [Surname], [OtherNames]">
                        </asp:SqlDataSource>
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
