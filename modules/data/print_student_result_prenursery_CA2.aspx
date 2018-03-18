<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print_student_result_prenursery_CA2.aspx.vb" Inherits="modules_data_print_student_result_prenursery_CA2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="880">
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="borderedTable" AutoGenerateColumns="False" 
                    DataKeyNames="PortalNumber" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="880px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." 
                        AllowPaging="True" PageSize="1" SelectedIndex="0" ShowHeader="False" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>

						<table width="100%" border="0">
                            <tr>
                                <td valign="top" align="right">
                                                &nbsp;</td>
                                <td align="left" valign="top">
                                    <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:document.getElementById('btnPrint').style.display = 'none';GenerateDynamicPDF('print_student_result_prenursery_CA4_pdf.aspx?a=<%= portalNumber %>&c=<%= sessionName %>');" />
                                </td>
                            </tr>
                            <tr>
                                <td height="50"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr class="pageHeaderStyle">
                                        <td height="40" align="center" colspan="4">
                                            <asp:Label ID="lblHeader" runat="server" 
                                                Text='<%# "TERM-END REPORT FOR " & className.ToUpper & ", " %>'></asp:Label>
                                            &nbsp;<asp:Label ID="lblTermName" runat="server" 
                                                Text='<%# termName & " " & sessionName & " Session" %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="pageHeaderStyle">
                                        <td align="left" height="40" width="150">
                                            PUPIL&#39;S NAME:&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblStudentName" runat="server" 
                                                Text='<%# "<b>" & Databinder.Eval(Container.DataItem, "LastName").ToString.ToUpper & "</b> " & Databinder.Eval(Container.DataItem, "FirstName").ToString %>'></asp:Label>
                                        </td>
                                        <td align="left" width="50">
                                            CLASS:&nbsp;&nbsp;</td>
                                        <td width="200">
                                                <asp:Label ID="lblStudentClass" runat="server" 
                                                    Text='<%# className.ToUpper %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="pageHeaderStyle">
                                        <td align="left" height="40" width="150">
                                            PORTAL NUMBER:&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblPortalNumber" runat="server" 
                                                
                                                Text='<%# CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String) %>'></asp:Label>
                                        </td>
                                        <td align="left" width="50">
                                            GENDER:&nbsp;&nbsp;</td>
                                        <td width="200">
                                            <asp:Label ID="lblStudentGender" runat="server" 
                                                
                                                Text='<%# Common.GetMaleOrFemale(CType(Databinder.Eval(Container.DataItem, "Gender"), String)).ToUpper %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table></td>
                                <td width="120" valign="top">
                                    <asp:Image ID="Image1" runat="server" BorderWidth="2px" 
                                        ImageUrl="~/images/logos/logo.15.jpg" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="47%" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="25" colspan="2" align="left" class="borderedTable"><strong>Social and Emotional Development</strong></td>
                                                <td width="100" align="center" class="borderedTable"><strong>Score</strong></td>
                                            </tr>
                                            <tr>
                                                <td width="25" height="25" align="center" class="borderedTable">1.</td>
                                                <td class="borderedTable">Interacts well with others</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label1" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreA1"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Participates in group activities</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label2" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreA2"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Keeps hands to self</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label3" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreA3"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Respects the rules of the school</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label4" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreA4"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">5.</td>
                                                <td class="borderedTable">Shows self confidence</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label5" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreA5"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">6.</td>
                                                <td class="borderedTable">Takes care of own needs</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label6" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreA6"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td align="center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="25" colspan="2" align="left" class="borderedTable"><strong>Work Habits</strong></td>
                                                <td align="center" class="borderedTable"><strong>Score</strong></td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">1.</td>
                                                <td class="borderedTable">Listens attentively</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label7" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreB1"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Follows simple directions</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label8" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreB2"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Handles materials carefully</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label9" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreB3"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Has good clean-up habits</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label10" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreB4"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td align="center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="25" colspan="2" align="left" class="borderedTable"><strong>Motor Skills</strong></td>
                                                <td align="center" class="borderedTable"><strong>Score</strong></td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">1.</td>
                                                <td class="borderedTable">Fits small items together</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label11" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreC1"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Holds pencil correctly</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label12" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreC2"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Uses scissors effectively</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label13" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreC3"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                            <br />
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="25" colspan="2" align="left" class="borderedTable"><strong>Language Arts / Reading Readiness</strong></td>
                                                    <td width="100" align="center" class="borderedTable"><strong>Score</strong></td>
                                                </tr>
                                                <tr>
                                                    <td width="25" height="25" align="center" class="borderedTable">1.</td>
                                                    <td class="borderedTable">Shows interest in books / stories</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label14" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD1"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">2.</td>
                                                    <td class="borderedTable">Answers questions about stories</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label15" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD2"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">3.</td>
                                                    <td class="borderedTable">Retells familiar stories</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label16" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD3"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">4.</td>
                                                    <td class="borderedTable">Shows interest in writing</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label17" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD4"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">5.</td>
                                                    <td class="borderedTable">Writes using pictures / symbols / sounds</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label18" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD5"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">6.</td>
                                                    <td class="borderedTable">Identifies same and different</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label19" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD6"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">7.</td>
                                                    <td class="borderedTable">Identifies alphabet sounds</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label20" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD7"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">8.</td>
                                                    <td class="borderedTable">Performance in oral question(s)</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label21" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD8"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">9.</td>
                                                    <td class="borderedTable">Performance in general knowledge</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label22" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD9"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">10.</td>
                                                    <td class="borderedTable">Interest in rhymes</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:Label ID="Label23" runat="server" 
                                                            Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreD10"), Int32), className) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table></td>
                                        <td align="left" valign="top">&nbsp;</td>
                                      <td width="47%" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="25" colspan="2" align="left" class="borderedTable"><strong>Maths / Science Readiness</strong></td>
                                                <td width="100" align="center" class="borderedTable"><strong>Score</strong></td>
                                            </tr>
                                            <tr>
                                                <td width="25" height="25" align="center" class="borderedTable">1.</td>
                                                <td class="borderedTable">One-to-one correspondence</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label24" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE1"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Compares quantities of sets</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label25" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE2"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Sorts objects by colour</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label26" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE3"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Sorts objects by shape</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label27" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE4"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">5.</td>
                                                <td class="borderedTable">Sorts objects by size</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label28" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE5"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">6.</td>
                                                <td class="borderedTable">Verbally counts forward to 20</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label29" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE6"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">7.</td>
                                                <td class="borderedTable">Counts 1 - 20 objects</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label30" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE7"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">8.</td>
                                                <td class="borderedTable">Identifies numerals 1 - 20</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label31" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE8"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">9.</td>
                                                <td class="borderedTable">Arranges sizes in order</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label32" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE9"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">10.</td>
                                                <td class="borderedTable">Makes simple patterns</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label33" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreE10"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td align="center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="25" colspan="2" align="left" class="borderedTable"><strong>Basic Recognition</strong></td>
                                                <td align="center" class="borderedTable"><strong>Score</strong></td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">1.</td>
                                                <td class="borderedTable">Numbers</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label34" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreF1"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Sounds</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label35" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreF2"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Shapes</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label36" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreF3"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Colours</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label37" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreF4"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td align="center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="25" colspan="2" align="left" class="borderedTable"><strong>Attendance</strong></td>
                                                <td align="center" class="borderedTable"><strong>Score</strong></td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">1.</td>
                                                <td class="borderedTable">Days Absent</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label38" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreG1"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Days Late</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:Label ID="Label39" runat="server" 
                                                        Text='<%# Common.FormatScore(CType(Databinder.Eval(Container.DataItem, "ScoreG2"), Int32), className) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td align="center">&nbsp;</td>
                                            </tr>
                                        </table>
                                            <br />
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="25" align="left" class="borderedTable"><strong>General Comments:</strong><strong></strong></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" class="borderedTable pageHeaderStyle">
                                                        <asp:Label ID="Label40" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                        </table>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td colspan="2" align="left" class="borderedTable">&nbsp;</td>
                                              </tr>
                                              <tr>
                                                <td width="50%" align="left" valign="top" class="borderedTable pageHeaderStyle">
                                                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr class="borderedTable">
                                                      <td><strong>Grading Scale:</strong></td>
                                                    </tr>
                                                    <tr class="borderedTable">
                                                      <td><em><strong>1 - Beginning</strong></em></td>
                                                    </tr>
                                                    <tr class="borderedTable">
                                                      <td><em><strong>2 - Developing</strong></em></td>
                                                    </tr>
                                                    <tr class="borderedTable">
                                                      <td><em><strong>3 - Proficient</strong></em></td>
                                                    </tr>
                                                    <tr class="borderedTable">
                                                      <td><em><strong>NA - Not assessed at this time</strong></em></td>
                                                    </tr>
                                                  </table>
                                                  </td>
                                                <td align="left" valign="top" class="borderedTable pageHeaderStyle">
                                                Teacher&#39;s Signature:
                                                <br />
                                                <br />
                                                <%= Common.GetReportCardSignature(className) %>
                                                </td>
                                              </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                            </tr>
                        </table>
						

                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="First" LastPageText="Last" 
                Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="100" 
                Position="TopAndBottom" PreviousPageText="Previous" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFFBD6" Font-Bold="True" ForeColor="#333333" 
                HorizontalAlign="Left" VerticalAlign="Top" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="">
            <SelectParameters>
                <asp:Parameter Name="SessionName" />
                <asp:Parameter Name="TermName" />
                <asp:Parameter Name="AssessmentType" />
                <asp:QueryStringParameter Name="ClassName" QueryStringField="a" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:ObjectDataSource ID="dsObjScores" runat="server" 
                            SelectMethod="GetDoubleSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="minimum" Type="Double" />
                            <asp:Parameter DefaultValue="3" Name="maximum" Type="Double" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Double" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                <asp:SqlDataSource ID="dsSqlAddCommentSelector" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT 0 AS [CommentId], 'Sorry. Generic comments no longer supported. Please contact an Administrator or your Head of School...' AS [CommentText]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="Activated" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
