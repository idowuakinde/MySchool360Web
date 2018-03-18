<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print_student_skillsreport_nursery_CA4.aspx.vb" Inherits="modules_data_print_student_skillsreport_nursery_CA4" %>

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
                                    onclick="javascript:document.getElementById('btnPrint').style.display = 'none';GenerateDynamicPDF('print_student_skillsreport_nursery_CA4_pdf.aspx?a=<%= portalNumber %>&c=<%= sessionName %>');" /></td>
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
                <asp:TemplateField HeaderText="1). SOCIAL AND EMOTIONAL LEARNING &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Gets along with others">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1a" runat="server" Text='<%# Bind("Score1A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Very shy">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1b" runat="server" Text='<%# Bind("Score1B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Fights often">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1c" runat="server" Text='<%# Bind("Score1C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Ready to share with others">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1d" runat="server" Text='<%# Bind("Score1D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Self confident">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1e" runat="server" Text='<%# Bind("Score1E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f). Punctual">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1f" runat="server" Text='<%# Bind("Score1F") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g). Easily fatigued">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore1g" runat="server" Text='<%# Bind("Score1G") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2). LANGUAGE LEARNING &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Shows interest in books/stories">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore2a" runat="server" Text='<%# Bind("Score2A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Answers questions about stories">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore2b" runat="server" Text='<%# Bind("Score2B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Retells familiar stories">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore2c" runat="server" Text='<%# Bind("Score2C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Shows interest in writing">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore2d" runat="server" Text='<%# Bind("Score2D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Shows understanding in spoken language skills">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore2e" runat="server" Text='<%# Bind("Score2E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3). INTELLECTUAL DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Able to solve problems">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore3a" runat="server" Text='<%# Bind("Score3A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Able to see relationships between things">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore3b" runat="server" Text='<%# Bind("Score3B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Able to extend experiences into growth">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore3c" runat="server" Text='<%# Bind("Score3C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Able to gain and process information">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore3d" runat="server" Text='<%# Bind("Score3D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4). GROSS MOTOR SKILLS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Throws a ball">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore4a" runat="server" Text='<%# Bind("Score4A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Running">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore4b" runat="server" Text='<%# Bind("Score4B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Jumping">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore4c" runat="server" Text='<%# Bind("Score4C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Climbing">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore4d" runat="server" Text='<%# Bind("Score4D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="5). FINE MOTOR SKILLS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Handles small toys">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore5a" runat="server" Text='<%# Bind("Score5A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Draws">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore5b" runat="server" Text='<%# Bind("Score5B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Writes ">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore5c" runat="server" Text='<%# Bind("Score5C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Handles a crayon easily ">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore5d" runat="server" Text='<%# Bind("Score5D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="6). ATTENTION SPAN &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Short">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore6a" runat="server" Text='<%# Bind("Score6A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Long">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore6b" runat="server" Text='<%# Bind("Score6B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="7). PERSONAL HYGIENE &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Neat">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore7a" runat="server" Text='<%# Bind("Score7A") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Clean clothes">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore7b" runat="server" Text='<%# Bind("Score7B") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Shoes clean">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore7c" runat="server" Text='<%# Bind("Score7C") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Hair neat">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore7d" runat="server" Text='<%# Bind("Score7D") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Teeth and nails clean">
                    <EditItemTemplate>
                        <asp:Label ID="LabelScore7e" runat="server" Text='<%# Bind("Score7E") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="8). GENERAL COMMENTS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). General Comments">
                    <EditItemTemplate>
                        <asp:Label ID="lblComment" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
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
                            THE SKILLS ASSESSMENT REPORT&nbsp;</td>
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
