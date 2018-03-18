<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managesettings.aspx.vb" Inherits="modules_system_setups_metadata_managesettings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style17
        {
            height: 30px;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Edit System Settings"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td><table width="800" border="0">
                    <tr bgcolor="#CC9900">
                        <td height="30" colspan="2" class="defaultHeaderTextStyleWhite">CURRENT SESSION AND TERM</td>
                    </tr>
                    <tr>
                        <td width="60%" height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Please 
                            select the current session:</strong></td>
                        <td class="style17"><asp:DropDownList ID="ddlCurrentSession" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlSessions" DataTextField="SessionDesc" 
                                DataValueField="SessionName">
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem Selected="True">7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                            <asp:SqlDataSource ID="dsSqlSessions" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                SelectCommand="SELECT [SessionName], [SessionName] + ' Session' AS SessionDesc FROM [TEMPSession] ORDER BY [CurrentSession]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Y" Name="CurrentSession" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Please select the current 
                            term:</strong></td>
                        <td class="style17">
                            <asp:DropDownList ID="ddlCurrentTerm" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlTerms" DataTextField="TermDesc" 
                                DataValueField="TermName">
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem Selected="True">7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                            <asp:SqlDataSource ID="dsSqlTerms" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                SelectCommand="SELECT [TermName], [TermName] + ' (' + [TermAlias] + ')' AS TermDesc FROM [TEMPTerm] ORDER BY [TermName] ">
                            </asp:SqlDataSource>
                            </td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Promote All Students:</strong></td>
                        <td class="style17">
                            <asp:Button ID="btnPromoteAllStudents" runat="server" 
                                CssClass="defaultButtonStyle" Text="   Promote All Students   " 
                                onclientclick="javascript:return confirm('Are you sure you want to promote all students?\n\nThis action is irreversible.');" />
                            &nbsp;
                            <asp:HyperLink ID="hlnkSetupPromotionExclusion" runat="server" 
                                NavigateUrl="~/modules/system/setups/metadata/managepromotionexclusions.aspx">Setup Promotion Exclusion</asp:HyperLink>
                            </td>
                    </tr>
                    <tr bgcolor="#CC9900">
                        <td height="30" colspan="2" class="defaultHeaderTextStyleWhite">TIMETABLE</td>
                        </tr>
                    <tr>
                        <td width="60%" height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Number of Daily Periods:</strong></td>
                        <td class="style17">
                            <asp:DropDownList ID="ddlDailyPeriods" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True">
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem Selected="True">7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Period Number Just Before Short Break:</strong></td>
                        <td class="style17">
                            <asp:DropDownList ID="ddlShortBreakPeriod" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem Selected="True">3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Period Number Just Before Long Break:</strong></td>
                        <td>
                            <asp:DropDownList ID="ddlLongBreakPeriod" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem Selected="True">5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr bgcolor="#CC9900">
                        <td height="30" colspan="2" class="defaultHeaderTextStyleWhite">PROFILE</td>
                        </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Profile Orientation:</strong></td>
                        <td>
                            <asp:DropDownList ID="ddlProfileOrientation" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True">
                                <asp:ListItem>Vertical</asp:ListItem>
                                <asp:ListItem>Horizontal</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr bgcolor="#CC9900">
                        <td height="30" colspan="2" class="defaultHeaderTextStyleWhite">REPORTS</td>
                        </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Show Positions:</strong></td>
                        <td>
                            <asp:DropDownList ID="ddlShowPositions" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True">
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr bgcolor="#CC9900">
                        <td height="30" colspan="2" class="defaultHeaderTextStyleWhite">NOTIFICATIONS</td>
                        </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;BULK SMS - Default Sender Alias:</strong></td>
                        <td>
                            <asp:TextBox ID="txtSenderAlias" runat="server" Columns="20" 
                                CssClass="defaultFormElementStyle" MaxLength="11"></asp:TextBox>
                            <asp:Button ID="btnSaveSenderAlias" runat="server" 
                                CssClass="defaultButtonStyle" Text="Save" />
                            <asp:RequiredFieldValidator ID="vldSenderAlias" runat="server" 
                                ControlToValidate="txtSenderAlias" ErrorMessage="* Required" Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;OUTGOING E-MAILS - Default Sender E-mail Address:</strong></td>
                        <td>
                            <asp:TextBox ID="txtEmailSender" runat="server" Columns="30" 
                                CssClass="defaultFormElementStyle"></asp:TextBox>
                            <asp:Button ID="btnSaveEmailSender" runat="server" 
                                CssClass="defaultButtonStyle" Text="Save" />
                            <asp:RequiredFieldValidator ID="vldEmailSender" runat="server" 
                                ControlToValidate="txtEmailSender" ErrorMessage="* Required" 
                                Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr bgcolor="#CC9900">
                        <td height="30" colspan="2" class="defaultHeaderTextStyleWhite">PRINCIPAL OFFICERS</td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Who is the Head of the Junior School?</strong></td>
                        <td><span class="style17">
                            <asp:DropDownList ID="ddlHeadOfSchoolJunior" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlUsers" DataTextField="FullName" DataValueField="Username">
                            </asp:DropDownList>
                        </span></td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Who is the Head of the Senior School?</strong></td>
                        <td><span class="style17">
                            <asp:DropDownList ID="ddlHeadOfSchoolSenior" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlUsers" DataTextField="FullName" DataValueField="Username">
                            </asp:DropDownList>
                        </span></td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Who is the Principal / Overall Head of Schools?</strong></td>
                        <td><span class="style17">
                            <asp:DropDownList ID="ddlPrincipal" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlUsers" DataTextField="FullName" DataValueField="Username">
                            </asp:DropDownList>
                        </span></td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Who is the Director of Studies / School Administrator?</strong></td>
                        <td><span class="style17">
                            <asp:DropDownList ID="ddlDOS" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlUsers" DataTextField="FullName" 
                                DataValueField="Username">
                            </asp:DropDownList>
                        </span></td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Who is the Bursar / Financial Controller?</strong><span class="style17"><asp:SqlDataSource ID="dsSqlUsers" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                SelectCommand=" SELECT Username, FirstName + ' ' + MiddleName + ' ' + Surname as FullName FROM dbo.Core_User ">
                            </asp:SqlDataSource>
                        </span></td>
                        <td><span class="style17">
                            <asp:DropDownList ID="ddlBursar" runat="server" 
                                CssClass="defaultFormElementStyle" AutoPostBack="True" 
                                DataSourceID="dsSqlUsers" DataTextField="FullName" 
                                DataValueField="Username">
                            </asp:DropDownList>
                        </span></td>
                    </tr>
                    </table>
                    </td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
                    <hr color="black" />
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
