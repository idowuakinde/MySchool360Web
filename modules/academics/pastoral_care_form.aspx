<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pastoral_care_form.aspx.vb" Inherits="modules_academics_pastoral_care_form" %>

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
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td colspan="2">
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: PASTORAL CARE FORM"></asp:Label></td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Edit" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="800px" 
                    DataSourceID="dsSqlPastoralCare" DataKeyNames="CustomerCode" 
                    EnableModelValidation="True">
            <HeaderTemplate>
                    <table cellpadding="2" cellspacing="2" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr bgcolor="#640000">
                        <td align="center" colspan="4">GUIDE TO FILLING THE PASTORAL CARE FORM&nbsp;</td>
                      </tr>
                      <tr>
                        <td rowspan="6" align="center" valign="middle">PASTORAL CARE SCALE</td>
                        <td align="center">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="center"><strong><u>LEVELS</u></strong></td>
                      </tr>
                      <tr>
                        <td align="center">5</td>
                        <td align="center">EXCELLENT</td>
                        <td align="center">ONLY STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">4</td>
                        <td align="center">VERY GOOD</td>
                        <td align="center">MAJOR STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">3</td>
                        <td align="center">GOOD</td>
                        <td align="center">STRENGTHS OUTWEIGH WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">2</td>
                        <td align="center">FAIR</td>
                        <td align="center">SOME IMPORTANT WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">1</td>
                        <td align="center">WEAK</td>
                        <td align="center">MAJOR WEAKNESSES</td>
                      </tr>
                    </table>
            </HeaderTemplate>
            <FooterTemplate>
                    <table cellpadding="2" cellspacing="2" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr bgcolor="#640000">
                        <td align="center" colspan="4">GUIDE TO FILLING THE PASTORAL CARE FORM&nbsp;</td>
                      </tr>
                      <tr>
                        <td rowspan="6" align="center" valign="middle">PASTORAL CARE SCALE</td>
                        <td align="center">&nbsp;</td>
                        <td align="center">&nbsp;</td>
                        <td align="center"><strong><u>LEVELS</u></strong></td>
                      </tr>
                      <tr>
                        <td align="center">5</td>
                        <td align="center">EXCELLENT</td>
                        <td align="center">ONLY STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">4</td>
                        <td align="center">VERY GOOD</td>
                        <td align="center">MAJOR STRENGTHS</td>
                      </tr>
                      <tr>
                        <td align="center">3</td>
                        <td align="center">GOOD</td>
                        <td align="center">STRENGTHS OUTWEIGH WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">2</td>
                        <td align="center">FAIR</td>
                        <td align="center">SOME IMPORTANT WEAKNESSES</td>
                      </tr>
                      <tr>
                        <td align="center">1</td>
                        <td align="center">WEAK</td>
                        <td align="center">MAJOR WEAKNESSES</td>
                      </tr>
                    </table>
            </FooterTemplate>
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
                <asp:TemplateField HeaderText="1). SOCIAL BEHAVIOUR &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Pupil Interaction with Peers / Teachers / Visitors">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1a" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Courtesy/Respect and Tolerance of Others">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1b" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Ability to Work Collaboratively / Trustworthiness">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1c" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). General Standard of Behaviour in the School">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1d" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Respect for School Property">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo1e" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2). MOTIVATION AND PERSONAL COMMITMENT TO LEARNING &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Development of Personal Responsibility for Learning">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2a" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Pupil's Willingness to apply him/herself to task at hand">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2b" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Response of Pupil to Challenging Tasks">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2c" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d). Capacity of Pupil to Persevere and Complete Tasks When Difficulty Arises">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2d" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e). Desire of Pupil to Improve his/her Work / Pride in Finished Product">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2e" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f). Readiness to Ask and Answer Questions / Join in Discussions">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2f" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g). Concentration in Listening to the Teacher">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo2g" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3). PUPIL CONTRIBUTION TO THE LIFE OF THE SCHOOL &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Pupil Participation in Co-Curricular Activities">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3a" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b). Involvement of Pupil in Other Social / Cultural Activities">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3b" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c). Sense of Intitiative and Willingness to Take Responsibility">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rdo3c" runat="server" RepeatDirection="Horizontal" 
                            Width="250px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4). ATTENDANCE AND PUNCTUALITY &gt;">
                    <HeaderStyle BackColor="#FF9900" />
                    <ItemStyle BackColor="#FF9900" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a). Level of Attendance Recorded">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Columns="10" 
                            CssClass="defaultFormElementStyle"></asp:TextBox>%
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" InsertText="Submit" 
                    ShowInsertButton="True">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
            </Fields>
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="500px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <EditRowStyle Wrap="True" />
            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Middle" 
                BackColor="#FFFBD6" ForeColor="#333333" Height="28px" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
                <asp:SqlDataSource ID="dsSqlPastoralCare" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT UPPER(DistrictCode) AS DistrictCode, [CustomerCode], UPPER(CustomerName) AS CustomerName FROM [TEMPcustomers] WHERE ([DistrictCode] = @DistrictCode) ORDER BY [CustomerName]">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="DistrictCode" QueryStringField="a" 
                            Type="String" />
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
