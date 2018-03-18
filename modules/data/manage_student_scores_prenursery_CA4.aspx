<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student_scores_prenursery_CA4.aspx.vb" Inherits="modules_data_manage_student_scores_prenursery_CA4" %>

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
        <table border="0" width="1000">
            <tr>
                <td>
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: View/Edit Students' Scores AFTER the Mid-Term Break"></asp:Label></td>
            </tr>
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="CustomerId" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." 
                        AllowPaging="True" PageSize="1" >
            <Columns>
                <asp:TemplateField HeaderText="Please enter the scores for the current student using the boxes provided below. &lt;br /&gt;Remember to click 'Save' before clicking 'Next'!">
                    <ItemTemplate>

						<table width="100%" border="0">
                            <tr>
                                <td height="50"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr class="pageHeaderStyle">
                                        <td height="40" align="center" colspan="4">
                                            <asp:Label ID="lblPagePosition" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="pageHeaderStyle">
                                        <td align="right" height="40" width="150">
                                            PUPIL&#39;S NAME:&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblStudentName" runat="server" 
                                                Text='<%# "<b>" & Databinder.Eval(Container.DataItem, "LastName").ToString.ToUpper & "</b> " & Databinder.Eval(Container.DataItem, "FirstName").ToString %>'></asp:Label>
                                        </td>
                                        <td align="right" width="50">
                                            CLASS:&nbsp;&nbsp;</td>
                                        <td width="200">
                                            <asp:Label ID="lblStudentClass" runat="server" 
                                                
                                                Text='<%# CType(Databinder.Eval(Container.DataItem, "ClassName"), String).ToUpper %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="pageHeaderStyle">
                                        <td align="right" height="40" width="150">
                                            PORTAL NUMBER:&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:Label ID="lblPortalNumber" runat="server" 
                                                
                                                Text='<%# CType(Databinder.Eval(Container.DataItem, "PortalNumber"), String) %>'></asp:Label>
                                        </td>
                                        <td align="right" width="50">
                                            GENDER:&nbsp;&nbsp;</td>
                                        <td width="200">
                                            <asp:Label ID="lblStudentGender" runat="server" 
                                                
                                                Text='<%# CType(Databinder.Eval(Container.DataItem, "Gender"), String).ToUpper %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table></td>
                                <td width="120" valign="top">
                                    <asp:Image ID="Image1" runat="server" BorderWidth="2px" 
                                        ImageUrl="~/images/logos/logo.15.jpg" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" valign="top"><strong>SUBJECT:
                                    <asp:Label ID="lblSubject" runat="server" Text="<%# subjectShortName.ToUpper %>"></asp:Label>
                                    </strong></td>
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
                                                    <asp:DropDownList ID="ddlA1" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreA1"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Participates in group activities</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlA2" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreA2"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Keeps hands to self</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlA3" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreA3"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Respects the rules of the school</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlA4" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreA4"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">5.</td>
                                                <td class="borderedTable">Shows self confidence</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlA5" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreA5"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">6.</td>
                                                <td class="borderedTable">Takes care of own needs</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlA6" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreA6"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                    <asp:DropDownList ID="ddlB1" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreB1"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Follows simple directions</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlB2" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreB2"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Handles materials carefully</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlB3" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreB3"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Has good clean-up habits</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlB4" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreB4"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                    <asp:DropDownList ID="ddlC1" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreC1"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Holds pencil correctly</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlC2" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreC2"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Uses scissors effectively</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlC3" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreC3"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                        <asp:DropDownList ID="ddlD1" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD1"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">2.</td>
                                                    <td class="borderedTable">Answers questions about stories</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD2" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD2"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">3.</td>
                                                    <td class="borderedTable">Retells familiar stories</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD3" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD3"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">4.</td>
                                                    <td class="borderedTable">Shows interest in writing</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD4" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD4"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">5.</td>
                                                    <td class="borderedTable">Writes using pictures / symbols / sounds</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD5" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD5"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">6.</td>
                                                    <td class="borderedTable">Identifies same and different</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD6" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD6"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">7.</td>
                                                    <td class="borderedTable">Identifies alphabet sounds</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD7" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD7"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">8.</td>
                                                    <td class="borderedTable">Performance in oral question(s)</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD8" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD8"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">9.</td>
                                                    <td class="borderedTable">Performance in general knowledge</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD9" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD9"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="center" class="borderedTable">10.</td>
                                                    <td class="borderedTable">Interest in rhymes</td>
                                                    <td align="center" class="borderedTable">
                                                        <asp:DropDownList ID="ddlD10" runat="server" AppendDataBoundItems="True" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                            SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreD10"), Int32) %>'>
                                                            <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                        </asp:DropDownList>
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
                                                    <asp:DropDownList ID="ddlE1" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE1"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Compares quantities of sets</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE2" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE2"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Sorts objects by colour</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE3" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE3"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Sorts objects by shape</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE4" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE4"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">5.</td>
                                                <td class="borderedTable">Sorts objects by size</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE5" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE5"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">6.</td>
                                                <td class="borderedTable">Verbally counts forward to 20</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE6" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE6"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">7.</td>
                                                <td class="borderedTable">Counts 1 - 20 objects</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE7" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE7"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">8.</td>
                                                <td class="borderedTable">Identifies numerals 1 - 20</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE8" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE8"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">9.</td>
                                                <td class="borderedTable">Arranges sizes in order</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE9" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE9"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">10.</td>
                                                <td class="borderedTable">Makes simple patterns</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlE10" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreE10"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                    <asp:DropDownList ID="ddlF1" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreF1"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Sounds</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlF2" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreF2"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">3.</td>
                                                <td class="borderedTable">Shapes</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlF3" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreF3"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">4.</td>
                                                <td class="borderedTable">Colours</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlF4" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreF4"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                    <asp:DropDownList ID="ddlG1" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreG1"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" align="center" class="borderedTable">2.</td>
                                                <td class="borderedTable">Days Late</td>
                                                <td align="center" class="borderedTable">
                                                    <asp:DropDownList ID="ddlG2" runat="server" AppendDataBoundItems="True" 
                                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjScores" 
                                                        SelectedValue='<%# CType(Databinder.Eval(Container.DataItem, "ScoreG2"), Int32) %>'>
                                                        <asp:ListItem Value="0">Not assessed</asp:ListItem>
                                                    </asp:DropDownList>
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
                                                    <td width="125" height="25" align="left" class="borderedTable"><strong>General Comments:</strong><strong></strong></td>
                                                </tr>
                                                <tr>
                                                    <td height="25" align="left" class="borderedTable">
                                                        <asp:TextBox ID="txtAddSubjectComment" runat="server" Columns="80" 
                                                            CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Comment") %>' 
                                                            TextMode="MultiLine"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                        <asp:ListBox ID="lstCommentSelector" runat="server" 
                                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddCommentSelector" 
                                                            DataTextField="CommentText" DataValueField="CommentText" 
                                                            onchange="javascript:CopyStandardComment(this, &quot;&quot;);" Rows="7" 
                                                            Width="420px"></asp:ListBox>
                                                    </td>
                                                </tr>
                                        </table></td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top">&nbsp;</td>
                                        <td align="left" valign="top">&nbsp;</td>
                                        <td align="left" valign="top">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center" valign="top">

                                                <strong>IMPORTANT NOTICE</strong>: You must click the &quot;Save Scores&quot; button below 
                                                to save your changes before moving to the next student in this class.</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" valign="top">
                                            <asp:Button ID="btnSaveScores" runat="server" CssClass="defaultButtonStyle" 
                                                Text="      Save Scores &gt;      " CommandName="Select" 
                                                CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>' />
                                            &nbsp;<input id="Reset1" class="defaultButtonStyle" type="reset" 
                                            value="   Clear   " /> &nbsp;</td>
                                    </tr>
                                </table></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
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
                            &nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="">
            <SelectParameters>
                <asp:Parameter Name="SessionName" />
                <asp:Parameter Name="TermName" />
                <asp:Parameter Name="AssessmentType" />
                <asp:QueryStringParameter Name="ClassName" QueryStringField="c" />
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
