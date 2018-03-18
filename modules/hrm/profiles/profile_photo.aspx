<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_photo.aspx.vb" Inherits="modules_profiles_profile_photo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblChooser" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Please select a Staff"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetAllStaff" 
                        DataTextField="StaffDetails" DataValueField="StaffId" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsSqlGetAllStaff" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT '0' AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT [StaffGUID], UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER([DepartmentName]) + ' Department)' FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = b.DepartmentId ">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
              <td></td>
              <td><hr color="black" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="50%" align="left" valign="top"><br />
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        
                          
                          Text=":: The current PASSPORT PHOTOGRAPH is shown below. &lt;br /&gt;    You can also upload a new PASSPORT PHOTOGRAPH."></asp:Label></td>
                  <td align="left" valign="top"><br />
                    <asp:Label ID="lblHeader2" runat="server" Font-Bold="True" Font-Size="Small" 
                        
                          
                          Text=":: The current SIGNATURE is shown below. &lt;br /&gt;    You can also upload a new SIGNATURE."></asp:Label></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50%" align="left" valign="top">
                            <asp:Label ID="lblStatus_Passport" runat="server"></asp:Label>
                            <br />
                            <asp:Image ID="imgPassport" runat="server" BorderWidth="3px" Height="250px" 
                        Visible="False" Width="230px" />                        
                          <br />
                        <asp:FileUpload ID="filePassport" runat="server" Visible="False" 
                        Width="500px" />
                            <br />
                            <asp:Button ID="btnPassport" runat="server" CssClass="defaultButtonStyle" 
                                Text="Upload &gt; " Visible="False" />
                          </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblStatus_Signature" runat="server"></asp:Label>
                            <br />
                            <asp:Image ID="imgSignature" runat="server" Height="100px" 
                        Visible="False" Width="300px" BorderWidth="3px" />                        
                            <br />
                        <asp:FileUpload ID="fileSignature" runat="server" Visible="False" 
                        Width="500px" />
                            <br />
                            <asp:Button ID="btnSignature" runat="server" CssClass="defaultButtonStyle" 
                                Text=" Upload &gt; " Visible="False" />
                          </td>
                      </tr>
                    </table></td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <hr color="black" />
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
