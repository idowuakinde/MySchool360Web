<%@ Page Language="VB" AutoEventWireup="false" CodeFile="changepassword_students.aspx.vb" Inherits="modules_system_setups_users_changepassword_students" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Change Password"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td><table width="800" border="0">
                    <tr>
                        <td height="30" align="center" colspan="2">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6" width="300"><strong>&nbsp;&nbsp;Old Password:</strong></td>
                        <td>
                            <asp:TextBox ID="txtOldPassword" runat="server" Columns="30" 
                                CssClass="defaultFormElementStyle" MaxLength="11" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldOldPassword" runat="server" 
                                ControlToValidate="txtOldPassword" ErrorMessage="* Required" 
                                Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;New Password:</strong></td>
                        <td>
                            <asp:TextBox ID="txtNewPassword" runat="server" Columns="30" 
                                CssClass="defaultFormElementStyle" MaxLength="11" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldNewPassword" runat="server" 
                                ControlToValidate="txtNewPassword" ErrorMessage="* Required" 
                                Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6"><strong>&nbsp;&nbsp;Re-type New Password:</strong></td>
                        <td>
                            <asp:TextBox ID="txtNewPassword2" runat="server" Columns="30" 
                                CssClass="defaultFormElementStyle" MaxLength="11" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldNewPassword2" runat="server" 
                                ControlToValidate="txtNewPassword2" ErrorMessage="* Required" 
                                Font-Bold="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" bgcolor="#FFFBD6">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" 
                                CssClass="defaultButtonStyle" Text="Change Password" />
                            &nbsp;<input id="btnReset" class="defaultButtonStyle" type="reset" 
                                value="Clear" /></td>
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
