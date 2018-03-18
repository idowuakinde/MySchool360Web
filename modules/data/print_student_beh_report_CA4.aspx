<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print_student_beh_report_CA4.aspx.vb" Inherits="modules_data_print_student_beh_report_CA4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    // <!CDATA[

    function TABLE1_onclick() {

    }

    // ]]>
</script>
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    <style type="text/css">

        .style17
        {
            width: 100%;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="800"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
                    <table align="center" class="style17">
                        <tr>
                            <td align="left" valign="top" width="80%">
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: BEHAVIOURAL ASSESSMENT REPORT"></asp:Label>
                            </td>
                            <td align="right" valign="top">
                                <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" 
                                    value="   Print This Page   " 
                                    onclick="javascript:document.getElementById('btnPrint').style.display = 'none';GenerateDynamicPDF('print_student_beh_report_CA4_pdf.aspx?a=<%= portalNumber %>&c=<%= sessionName %>');" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" valign="top">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Edit" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="800px" 
                    DataSourceID="dsSqlSkillsReport" DataKeyNames="CustomerCode" 
                    EnableModelValidation="True">
            <Fields>
                <asp:TemplateField HeaderText="NAME OF STUDENT:">
                    <EditItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("CustomerName") %>' 
                            Font-Bold="True"></asp:Label>
                        &nbsp;(<asp:Label ID="Label12" runat="server" Font-Bold="True" 
                            Text='<%# Eval("CustomerCode") %>'></asp:Label>)
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CLASS:">
                    <EditItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("DistrictCode") %>' 
                            Font-Bold="True"></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TERM:">
                    <EditItemTemplate>
                        <asp:Label ID="Label11b" runat="server" Text='<%# termName & ", " & sessionName & " Session" %>' 
                            Font-Bold="True"></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="STUDENT'S PHOTOGRAPH (CLICK TO ZOOM):">
                    <EditItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "CustomerCode").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Image ID="Image1" runat="server" Height="30px" ToolTip="Click to enlarge." 
                            ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "CustomerCode").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "CustomerCode").ToString & ".jpg")) %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                        </a>
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="1). PERSONAL DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Obedience">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore1A" runat="server" Text='<%# Bind("Score1A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Honesty">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore1B" runat="server" Text='<%# Bind("Score1B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Self Reliance">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore1C" runat="server" Text='<%# Bind("Score1C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Self Control">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore1D" runat="server" Text='<%# Bind("Score1D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Use of Initiative">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore1E" runat="server" Text='<%# Bind("Score1E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2). SENSE OF RESPONSIBILITY &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). General Taking On of Responsibility">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore2A" runat="server" Text='<%# Bind("Score2A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). General Neatness">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore2B" runat="server" Text='<%# Bind("Score2B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Industry / Perseverance">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore2C" runat="server" Text='<%# Bind("Score2C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Attendance in Class when going to Specialist Teachers">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore2d" runat="server" Text='<%# Bind("Score2D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Attentiveness">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore2e" runat="server" Text='<%# Bind("Score2E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3). SOCIAL DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Courtesy / Politeness">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore3A" runat="server" Text='<%# Bind("Score3A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Consideration for Others">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore3b" runat="server" Text='<%# Bind("Score3B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Sociability">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore3c" runat="server" Text='<%# Bind("Score3C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Promptness in Completing School Work">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore3d" runat="server" Text='<%# Bind("Score3D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Respect for School Property">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore3e" runat="server" Text='<%# Bind("Score3E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4). PSYCHOMOTOR DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Handwriting">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore4a" runat="server" Text='<%# Bind("Score4A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Verbal Communication">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore4b" runat="server" Text='<%# Bind("Score4B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Manual Skills (in Handling Tools &amp; Equipment)">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore4c" runat="server" Text='<%# Bind("Score4C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Dexterity in Handling Musical Instruments">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore4d" runat="server" Text='<%# Bind("Score4D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Dexterity in Handling Art Materials">
                    <EditItemTemplate>
                        <asp:Label ID="lblScore4e" runat="server" Text='<%# Bind("Score4E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="5). CLASS TEACHER'S COMMENTS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Class Teacher's Comments">
                    <EditItemTemplate>
                        <asp:Label ID="lblComments" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="400px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <EditRowStyle Wrap="True" />
            <HeaderTemplate>
                <table border="0" cellpadding="0" cellpadding="2" cellspacing="0" 
                    cellspacing="2" width="100%">
                    <tr bgcolor="#640000">
                        <td align="center">
                            THE BEHAVIOURAL ASSESSMENT REPORT&nbsp;</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Middle" 
                BackColor="#FFFBD6" ForeColor="#333333" Height="28px" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="dsSqlSkillsReport" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    
                    SelectCommand="  ">
                    <SelectParameters>
                        <asp:Parameter Name="SessionName" />
                        <asp:Parameter Name="TermName" />
                        <asp:Parameter Name="AssessmentType" />
                        <asp:QueryStringParameter Name="CustomerCode" QueryStringField="a" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
