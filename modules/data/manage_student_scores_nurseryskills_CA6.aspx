<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student_scores_nurseryskills_CA6.aspx.vb" Inherits="modules_data_manage_student_scores_nurseryskills_CA6" %>

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
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: SKILLS ASSESSMENT FORM"></asp:Label></td>
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
                        <asp:RadioButtonList ID="rdo1a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Very shy">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Fights often">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1C") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Ready to share with others">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1D") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Self confident">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1E") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f). Punctual">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1f" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1F") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g). Easily fatigued">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1g" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1G") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2). LANGUAGE LEARNING &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Shows interest in books/stories">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Answers questions about stories">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Retells familiar stories">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2C") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Shows interest in writing">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2D") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Shows understanding in spoken language skills">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2E") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3). INTELLECTUAL DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Able to solve problems">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Able to see relationships between things">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Able to extend experiences into growth">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3C") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Able to gain and process information">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3D") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4). GROSS MOTOR SKILLS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Throws a ball">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Running">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Jumping">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4C") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Climbing">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4D") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="5). FINE MOTOR SKILLS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Handles small toys">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo5a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score5A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Draws">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo5b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score5B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Writes ">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo5c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score5C") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Handles a crayon easily ">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo5d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score5D") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="6). ATTENTION SPAN &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Short">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo6a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score6A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Long">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo6b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score6B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="7). PERSONAL HYGIENE &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Neat">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo7a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score7A") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Clean clothes">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo7b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score7B") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Shoes clean">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo7c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score7C") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Hair neat">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo7d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score7D") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Teeth and nails clean">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo7e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score7E") %>'>
                            <asp:ListItem>Always</asp:ListItem>
                            <asp:ListItem>Sometimes</asp:ListItem>
                            <asp:ListItem>Never</asp:ListItem>
                            <asp:ListItem>Not Observed</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="8). GENERAL COMMENTS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). General Comments">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtComments" runat="server" Columns="60" 
                            CssClass="defaultFormElementStyle" Rows="10" TextMode="MultiLine" 
                            Text='<%# Bind("Comment") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" InsertText="Submit" ShowEditButton="True" 
                    UpdateText="   Save &gt;   ">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
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
                            THE SKILLS ASSESSMENT FORM&nbsp;</td>
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
                    <asp:HiddenField ID="hidCallbackURL" runat="server" />
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
