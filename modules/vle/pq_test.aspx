<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pq_test.aspx.vb" Inherits="modules_vle_pq_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js_CalendarPopup_Combined.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=""></asp:Label></td>
            </tr>
            <tr>
                <td width="1%">&nbsp;
                    </td>
                <td>
				<table width="100%"  border="0" cellspacing="5">
                  <tr>
                    <td style="margin-left: 200px">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            CellPadding="4" CssClass="noBorderedMenuTable" DataKeyNames="CustomerCode" 
                            DefaultMode="Insert" EmptyDataText="No data." 
                            ForeColor="#333333" GridLines="None" Height="50px" Width="800px" 
                            EnableModelValidation="True">
                            <HeaderTemplate>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="left" rowspan="7" valign="middle" width="200">
                                            <img border="2" height="120" src="../../images/logos/logo.15.jpg" /></td>
                                        <td align="center" rowspan="7" valign="middle" width="200">
                                            &nbsp;</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="right" rowspan="6" width="200">
                                            <asp:Image ID="imgPhotoHeader" runat="server" BorderColor="Black" 
                                                BorderStyle="Solid" BorderWidth="2px" Height="120px" ImageUrl='<%# Common.ShowPhotograph("~\images\pp\" & selectedPortalNumber & ".jpg", Server.MapPath("~\images\pp\" & selectedPortalNumber & ".jpg")) %>' 
                                                Width="120px" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <FooterTemplate>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td align="left" rowspan="7" valign="middle" width="200">
                                            <img border="2" height="120" src="../../images/logos/logo.15.jpg" /></td>
                                        <td align="center" rowspan="7" valign="middle" width="200">
                                            &nbsp;</td>
                                        <td align="center" width="30">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="right" rowspan="6" width="200">
                                            <asp:Image ID="imgPhotoFooter" runat="server" BorderColor="Black" 
                                                BorderStyle="Solid" BorderWidth="2px" Height="120px" ImageUrl='<%# Common.ShowPhotograph("~\images\pp\" & selectedPortalNumber & ".jpg", Server.MapPath("~\images\pp\" & selectedPortalNumber & ".jpg")) %>' 
                                                Width="120px" />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            &nbsp;</td>
                                        <td align="center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </FooterTemplate>
                            <Fields>
                                <asp:TemplateField>
                                    <InsertItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STUDENT DETAILS:">
                                    <InsertItemTemplate>
                                        <table border="0" cellspacing="5" class="borderedTableGrey" width="100%">
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Date of Quiz: </b>
                                                    <asp:Label ID="lblQuizDate" runat="server" Font-Bold="True" 
                                                        Text="<%# Now() %>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="borderedTable">
                                                    <b>Portal Number:
                                                    <asp:Label ID="lblStudentUsername" runat="server" Font-Bold="True" 
                                                        Text="<%# selectedPortalNumber %>"></asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td class="borderedTable">
                                                    <b>Full Names:
                                                    <asp:Label ID="lblStudentName" runat="server" Font-Bold="True"></asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField HeaderText="QUESTIONS:">
                                    <InsertItemTemplate>
                                        <asp:GridView ID="gvQuizQuestions" runat="server" 
                                            AutoGenerateColumns="False" CellPadding="4" CssClass="borderedTable" 
                                            DataKeyNames="QuestionId" 
                                            DataSourceID="dsSqlGetQuestionsBySubject" 
                                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No questions to display.&lt;br /&gt;&amp;nbsp;" 
                                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                                            OnRowDataBound="gvQuizQuestions_RowDataBound" Width="600px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S/N">
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="3" cellspacing="3" width="100%">
                                                            <tr>
                                                                <td align="left" valign="top">
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" 
                                                                        Text='<%# CType((serial + 1), String) & "." %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Question">
                                                    <ItemTemplate>
                                                        <table width="100%" border="0" cellspacing="3" cellpadding="3">
                                                          <tr>
                                                            <td width="100" align="left" valign="top"><strong>Diagram: </strong></td>
                                                            <td align="left" valign="top">
                                                                <asp:Image ID="imgQuestionDiagram" runat="server" BorderColor="Black" 
                                                                    BorderStyle="Solid" BorderWidth="3px" Height="100px" 
                                                                    ImageUrl='<%# Common.ShowPracticeQuestionDiagram("~/_pq/" & CType(Common.ConvertDBNulltoNothing(Databinder.Eval(Container.DataItem, "DiagramLocation")), String), Server.MapPath("~/_pq/" & CType(Common.ConvertDBNulltoNothing(Databinder.Eval(Container.DataItem, "DiagramLocation")), String))) %>' />
                                                              </td>
                                                          </tr>
                                                            <tr>
                                                                <td align="left" valign="top">
                                                                    <strong>Problem:</strong></td>
                                                                <td align="left" valign="top">
                                                                    <asp:Label ID="Label1" runat="server" 
                                                                        Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "QuestionText")) %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" valign="top">
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="left" valign="top" height="7px"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" valign="top">
                                                                                <strong>Possible Choices:</strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="left" valign="top">
                                                                    <table border="0" cellpadding="3" cellspacing="3" width="100%">
                                                                        <tr>
                                                                            <td align="left" valign="top" width="30" class="borderedTableGrey">
                                                                                A.</td>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                <asp:Label ID="Label4" runat="server" 
                                                                                    Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice1")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                B.</td>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                <asp:Label ID="Label5" runat="server" 
                                                                                    Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice2")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                C.</td>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                <asp:Label ID="Label6" runat="server" 
                                                                                    Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice3")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                D.</td>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                <asp:Label ID="Label7" runat="server" 
                                                                                    Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice4")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                E.</td>
                                                                            <td align="left" valign="top" class="borderedTableGrey">
                                                                                <asp:Label ID="Label7b" runat="server" 
                                                                                    Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice5")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="borderedTableGrey" colspan="2" valign="top">
                                                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                                                    RepeatDirection="Horizontal" Width="75%">
                                                                                    <asp:ListItem>A</asp:ListItem>
                                                                                    <asp:ListItem>B</asp:ListItem>
                                                                                    <asp:ListItem>C</asp:ListItem>
                                                                                    <asp:ListItem>D</asp:ListItem>
                                                                                    <asp:ListItem>E</asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                                VerticalAlign="Top" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                                HorizontalAlign="Left" VerticalAlign="Top" />
                                            <EditRowStyle CssClass="defaultFormElementStyle" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                    </InsertItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:Button ID="btnSave" runat="server" CausesValidation="False" 
                                            CommandName="Insert" Text="   Submit Answers &gt;   " CssClass="defaultButtonStyle" 
                                            Enabled="False" />
                                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" CssClass="defaultButtonStyle" />
                                    </InsertItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Fields>
                            <FieldHeaderStyle Font-Bold="True" Width="200px" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
                            <EditRowStyle Wrap="True" />
                            <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
                            <FooterStyle BackColor="tan" Font-Bold="True" ForeColor="Black" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="28px" 
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True" />
                            <RowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="dsSqlGetQuestionsBySubject" 
                            runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                            SelectCommand="SELECT * FROM dbo.[VW_PQ_Questions] WHERE SubjectShortName = @SubjectShortName AND ClassName = @ClassName ORDER BY SubjectShortName">
                            <SelectParameters>
                                <asp:FormParameter FormField="lstQuizSubject" Name="SubjectShortName" />
                                <asp:QueryStringParameter Name="ClassName" QueryStringField="c" />
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
