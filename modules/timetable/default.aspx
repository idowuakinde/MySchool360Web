<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="modules_timetable_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">

<table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td colspan="2">
                <span class="pageHeaderStyleAMMA">
                <br />
                &nbsp;&nbsp;
                :: Timetables</span></td>
          </tr>
          <tr>
            <td colspan="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;SIMPLE VIEWS</b></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td><table width="1000"  border="0" cellpadding="2" cellspacing="2" 
                    class="borderedTable">
              <tr>
                <td><strong>CLASS TIMETABLES: Please choose a class: 
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClass" 
                        DataTextField="ClassName" DataValueField="ClassId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_class_all_v2.aspx">ALL CLASS TIMETABLES</a>.
                    <asp:SqlDataSource ID="dsSqlClass" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                        SelectCommand="SELECT [ClassId], [ClassName] FROM [TEMPClass] ORDER BY [ClassName]">
                    </asp:SqlDataSource></strong>
                  </td>
              </tr>
                <tr>
                <td><strong>TEACHER TIMETABLES: Please choose a teacher: 
                    <asp:DropDownList ID="ddlTeacher" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTeacher" 
                        DataTextField="Username" DataValueField="UserId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_teacher_all.aspx">ALL TEACHER TIMETABLES</a>.<asp:SqlDataSource ID="dsSqlTeacher" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                        SelectCommand="SELECT [UserId], [Username] FROM [Core_User] ORDER BY [Username]">
                    </asp:SqlDataSource></strong>
                  </td>
                </tr>
                <tr>
                <td><strong>VENUE TIMETABLES: Please choose a venue: 
                    <asp:DropDownList ID="ddlVenue" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocation" 
                        DataTextField="VenueName" DataValueField="VenueId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_venue_all.aspx">ALL VENUE TIMETABLES</a>.<asp:SqlDataSource ID="dsSqlLocation" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon_School %>" 
                        SelectCommand="SELECT [VenueId], [VenueName] FROM [Core_TuitionVenue] ORDER BY [VenueName]">
                    </asp:SqlDataSource></strong>
                  </td>
                </tr>
                </table></td>
          </tr>
          <tr>
            <td colspan="2" height="5"></td>
          </tr>
          <tr>
            <td colspan="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;TIMETABLE FREE SLOTS</b></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td><table width="1000"  border="0" cellpadding="2" cellspacing="2" 
                    class="borderedTable">
              <tr>
                <td><strong>CLASS FREE SLOTS: Please choose a class: 
                    <asp:DropDownList ID="ddlClassFree" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClass" 
                        DataTextField="ClassName" DataValueField="ClassId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_class_free_all.aspx">ALL CLASS FREE SLOTS</a>.
                    </strong>
                  </td>
              </tr>
                <tr>
                <td><strong>TEACHER FREE SLOTS: Please choose a teacher: 
                    <asp:DropDownList ID="ddlTeacherFree" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTeacher" 
                        DataTextField="Username" DataValueField="UserId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_teacher_free_all.aspx">ALL TEACHER FREE SLOTS</a>.</strong></td>
                </tr>
                <tr>
                <td><strong>VENUE FREE SLOTS: Please choose a venue: 
                    <asp:DropDownList ID="ddlVenueFree" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocation" 
                        DataTextField="VenueName" DataValueField="VenueId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_venue_free_all.aspx">ALL VENUE FREE SLOTS</a>.</strong></td>
                </tr>
                </table></td>
          </tr>
          <tr>
            <td colspan="2" height="5"></td>
          </tr>
          <tr>
            <td colspan="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;TIMETABLE LOAD</b></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td><table width="1000"  border="0" cellpadding="2" cellspacing="2" 
                    class="borderedTable">
              <tr>
                <td><strong>CLASS LOAD: Please choose a class: 
                    <asp:DropDownList ID="ddlClassLoad" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClass" 
                        DataTextField="ClassName" DataValueField="ClassId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_class_load_all.aspx">ALL CLASS LOADS</a>.
                    </strong>
                  </td>
              </tr>
                <tr>
                <td><strong>TEACHING LOAD: Please choose a teacher: 
                    <asp:DropDownList ID="ddlTeacherLoad" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTeacher" 
                        DataTextField="Username" DataValueField="UserId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_teacher_load_all.aspx">ALL TEACHING LOADS</a>.</strong></td>
                </tr>
                <tr>
                <td><strong>VENUE LOAD: Please choose a venue: 
                    <asp:DropDownList ID="ddlVenueLoad" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocation" 
                        DataTextField="VenueName" DataValueField="VenueId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_venue_load_all.aspx">ALL VENUE LOADS</a>.</strong></td>
                </tr>
                </table></td>
          </tr>
          <tr>
            <td colspan="2" height="5"></td>
          </tr>
          <tr>
            <td colspan="2"><b>&nbsp;&nbsp;&nbsp;&nbsp;TIMETABLE CLASHES</b></td>
          </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td><table width="1000"  border="0" cellpadding="2" cellspacing="2" 
                    class="borderedTable">
                <tr>
                <td><strong>CLASS CLASHES: Please choose a class: 
                    <asp:DropDownList ID="ddlClassClash" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClass" 
                        DataTextField="ClassName" DataValueField="ClassId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_class_clash_all.aspx">ALL CLASS CLASHES</a>.</strong></td>
                </tr>
                <tr>
                <td><strong>TEACHER CLASHES: Please choose a teacher: 
                    <asp:DropDownList ID="ddlTeacherClash" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlTeacher" 
                        DataTextField="Username" DataValueField="UserId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_teacher_clash_all.aspx">ALL TEACHER CLASHES</a>.</strong></td>
                </tr>
                <tr>
                <td><strong>VENUE CLASHES: Please choose a venue: 
                    <asp:DropDownList ID="ddlVenueClash" runat="server" AutoPostBack="True" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocation" 
                        DataTextField="VenueName" DataValueField="VenueId" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;or click here for <a href="timetable_venue_clash_all.aspx">ALL VENUE CLASHES</a>.</strong></td>
                </tr>
                </table></td>
          </tr>
          </table>

    </form>
</body>
</html>
