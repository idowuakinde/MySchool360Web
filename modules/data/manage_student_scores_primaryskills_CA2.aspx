<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student_scores_primaryskills_CA2.aspx.vb" Inherits="modules_data_manage_student_scores_primaryskills_CA2" %>

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
                        Text=":: BEHAVIOURAL ASSESSMENT FORM"></asp:Label></td>
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
                        <asp:RadioButtonList ID="rdo1a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1A") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Honesty">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1B") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Self Reliance">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1C") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Self Control">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1D") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Use of Initiative">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score1E") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2). SENSE OF RESPONSIBILITY &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). General Taking On of Responsibility">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2A") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). General Neatness">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2B") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Industry / Perseverance">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2C") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Attendance in Class when going to Specialist Teachers">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2D") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Attentiveness">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score2E") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3). SOCIAL DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Courtesy / Politeness">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3A") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Consideration for Others">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3B") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Sociability">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3C") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Promptness in Completing School Work">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3D") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Respect for School Property">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score3E") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4). PSYCHOMOTOR DEVELOPMENT &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Handwriting">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4a" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4A") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Verbal Communication">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4b" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4B") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Manual Skills (in Handling Tools &amp; Equipment)">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4c" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4C") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Dexterity in Handling Musical Instruments">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4d" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4D") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Dexterity in Handling Art Materials">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo4e" runat="server" RepeatDirection="Horizontal" 
                            Width="300px" SelectedValue='<%# Bind("Score4E") %>'>
                            <asp:ListItem>Excellent</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                            <asp:ListItem>Acceptable</asp:ListItem>
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Poor</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="5). CLASS TEACHER'S COMMENTS &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Class Teacher's Comments">
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
                            THE BEHAVIOURAL ASSESSMENT FORM&nbsp;</td>
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
