<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pq_default.aspx.vb" Inherits="modules_vle_pq_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../inc_functions_js.js"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: My Practice Questions"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3">
              <tr>
                <td>
            <table width="1000" border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td align="center" valign="middle" class="borderedTableGrey">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" 
                        CssClass="defaultFormElementStyleLargeForLoginPage" 
                        Text="Choose a subject:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="lstQuizSubject" runat="server" 
                        CssClass="defaultFormElementStyleLargeForLoginPage" 
                        DataSourceID="dsSqlStudentSubjects" DataTextField="SubjectName" 
                        DataValueField="SubjectShortName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" 
                        CssClass="defaultFormElementStyleLargeForLoginPage" 
                        Text="How many questions?"></asp:Label>
                    &nbsp;<asp:DropDownList ID="lstQuizQuantity" runat="server" 
                        CssClass="defaultFormElementStyleLargeForLoginPage">
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:HiddenField ID="hidPortalNumber" runat="server" />
                    <br />
                    <br />
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="70px" 
                        ImageUrl="~/images/arrow_start.png" ToolTip="Start!" 
                        AlternateText="Start!" />
                    <br />
                    <br />
                    </td>
    </tr>
            </table>

                  </td>
              </tr>
              <tr>
                <td>
                <asp:SqlDataSource ID="dsSqlStudentSubjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="  ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="PortalNumber" QueryStringField="a" Type="String" />
                        <asp:Parameter Name="SessionName" />
                    </SelectParameters>
                </asp:SqlDataSource>

                  </td>
              </tr>
                </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
