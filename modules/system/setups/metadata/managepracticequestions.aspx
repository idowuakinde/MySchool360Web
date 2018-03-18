<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managepracticequestions.aspx.vb" Inherits="modules_system_setups_metadata_managepracticequestions" %>

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
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Add a New Practice Question"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="QuestionId"
                        DataSourceID="dsSqlQuestions" DefaultMode="Insert" 
                        Height="50px" Width="800px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="Id:" InsertVisible="False" 
                                SortExpression="QuestionId">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuestionId") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject &amp; Class:" 
                                SortExpression="SubjectShortName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlSubject_New" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectDescription" DataValueField="ShortName" 
                                        SelectedValue='<%# Bind("SubjectShortName") %>'>
                                    </asp:DropDownList>
                                    &nbsp;<asp:DropDownList ID="ddlClass_New" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question Text:" 
                                SortExpression="QuestionText">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("QuestionText") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="90" 
                                        CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("QuestionText") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Extra Notes:" 
                                SortExpression="QuestionExtraNotes">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("QuestionExtraNotes") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="90" 
                                        CssClass="defaultFormElementStyle" Rows="3" 
                                        Text='<%# Bind("QuestionExtraNotes") %>' TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Include a Diagram?" 
                                SortExpression="DiagramLocation">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("DiagramLocation") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:FileUpload ID="fileDiagram" runat="server" 
                                        CssClass="defaultFormElementStyle" Width="300px" />
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer Choices:">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("AnswerChoice1") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <table width="100%" border="0" cellspacing="3" cellpadding="3">
                                      <tr>
                                        <td width="50%" align="left" valign="top">A:
                                            <asp:TextBox ID="TextBox6" runat="server" Columns="40" 
                                                CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("AnswerChoice1") %>' 
                                                TextMode="MultiLine"></asp:TextBox>
                                          </td>
                                        <td align="left" valign="top">B:
                                            <asp:TextBox ID="TextBox7" runat="server" Columns="40" 
                                                CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("AnswerChoice2") %>' 
                                                TextMode="MultiLine"></asp:TextBox>
                                          </td>
                                      </tr>
                                        <tr>
                                            <td align="left" valign="top" width="50%">
                                                C:
                                                <asp:TextBox ID="TextBox8" runat="server" Columns="40" 
                                                    CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("AnswerChoice3") %>' 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td align="left" valign="top">
                                                D:
                                                <asp:TextBox ID="TextBox10" runat="server" Columns="40" 
                                                    CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("AnswerChoice4") %>' 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top" width="50%">
                                                E:
                                                <asp:TextBox ID="TextBox9" runat="server" Columns="40" 
                                                    CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("AnswerChoice5") %>' 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td align="left" valign="top">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Correct Answer Choice:" 
                                SortExpression="CorrectAnswerChoice">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" 
                                        Text='<%# Bind("CorrectAnswerChoice") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("CorrectAnswerChoice") %>'>
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                        <asp:ListItem>D</asp:ListItem>
                                        <asp:ListItem>E</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Practice Question" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Existing Practice Questions"></asp:Label></td>
            </tr>
            <tr>
                <td width="1%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="QuestionId" 
                        DataSourceID="dsSqlQuestions" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1000px" EnableModelValidation="True" 
                        EmptyDataText="Sorry. No Practice Questions to show.">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlnkDownload" runat="server" Height="16px" 
                                        ImageUrl="~/images/download2.jpg" Target="_blank">HyperLink</asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" >
                            <ItemStyle Width="80px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="QuestionId">
                                <ItemTemplate>
                                    <asp:Label ID="Label1b" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1c" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject &amp; Class" 
                                SortExpression="SubjectShortName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectDescription" DataValueField="ShortName" 
                                        SelectedValue='<%# Bind("SubjectShortName") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question" SortExpression="QuestionText">
                                <ItemTemplate>
                                    <table border="0" cellpadding="3" cellspacing="3" width="100%">
                                        <tr>
                                            <td align="left" valign="top" width="100" class="borderedTableGrey">
                                                <strong>Diagram: </strong>
                                            </td>
                                            <td align="left" valign="top" class="borderedTableGrey">
                                                <asp:Image ID="imgQuestionDiagram" runat="server" BorderColor="Black" 
                                                    BorderStyle="Solid" BorderWidth="3px" Height="100px" 
                                                    ImageUrl='<%# "~/_pq/" & CType(Common.ConvertDBNulltoNothing(Databinder.Eval(Container.DataItem, "DiagramLocation")), String) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top" class="borderedTableGrey">
                                                <strong>Problem:</strong></td>
                                            <td align="left" valign="top" class="borderedTableGrey">
                                                <asp:Label ID="Label1" runat="server" 
                                                    Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "QuestionText")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top" class="borderedTableGrey">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left" height="7px" valign="top">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="top">
                                                            <strong>Possible Choices:</strong></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" valign="top" class="borderedTableGrey">
                                                <table border="0" cellpadding="3" cellspacing="3" width="100%">
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top" width="30">
                                                            A.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:Label ID="Label8" runat="server" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice1")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            B.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:Label ID="Label5" runat="server" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice2")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            C.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:Label ID="Label6" runat="server" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice3")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            D.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:Label ID="Label7" runat="server" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice4")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            E.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:Label ID="Label7b" runat="server" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice5")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <strong>Correct Choice:</strong></td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <asp:Label ID="Label11" runat="server" Font-Bold="True" 
                                                    Text='<%# Bind("CorrectAnswerChoice") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <strong>Extra Notes:</strong></td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("QuestionExtraNotes") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <table border="0" cellpadding="3" cellspacing="3" width="100%">
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top" width="100">
                                                <strong>Diagram: </strong>
                                            </td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <asp:Image ID="imgQuestionDiagram" runat="server" BorderColor="Black" 
                                                    BorderStyle="Solid" BorderWidth="3px" Height="100px" 
                                                    ImageUrl='<%# "~/_pq/" & CType(Common.ConvertDBNulltoNothing(Databinder.Eval(Container.DataItem, "DiagramLocation")), String) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <strong>Problem:</strong></td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <asp:TextBox ID="TextBox3" runat="server" Columns="90" 
                                                    CssClass="defaultFormElementStyle" Rows="8" Text='<%# Bind("QuestionText") %>' 
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left" height="7px" valign="top">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" valign="top">
                                                            <strong>Possible Choices:</strong></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <table border="0" cellpadding="3" cellspacing="3" width="100%">
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top" width="30">
                                                            A.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:TextBox ID="TextBox4b" runat="server" Columns="80" 
                                                                CssClass="defaultFormElementStyle" Rows="2" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice1")) %>' 
                                                                TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            B.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:TextBox ID="TextBox5b" runat="server" Columns="80" 
                                                                CssClass="defaultFormElementStyle" Rows="2" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice2")) %>' 
                                                                TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            C.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:TextBox ID="TextBox6b" runat="server" Columns="80" 
                                                                CssClass="defaultFormElementStyle" Rows="2" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice3")) %>' 
                                                                TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            D.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:TextBox ID="TextBox7b" runat="server" Columns="80" 
                                                                CssClass="defaultFormElementStyle" Rows="2" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice4")) %>' 
                                                                TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            E.</td>
                                                        <td align="left" class="borderedTableGrey" valign="top">
                                                            <asp:TextBox ID="TextBox8b" runat="server" Columns="80" 
                                                                CssClass="defaultFormElementStyle" Rows="2" 
                                                                Text='<%# Common.ShowLineBreaksInTextOnWeb(Databinder.Eval(Container.DataItem, "AnswerChoice5")) %>' 
                                                                TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <strong>Correct Choice:</strong></td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <asp:DropDownList ID="DropDownList4" runat="server" 
                                                    CssClass="defaultFormElementStyle" 
                                                    SelectedValue='<%# Bind("CorrectAnswerChoice") %>'>
                                                    <asp:ListItem>A</asp:ListItem>
                                                    <asp:ListItem>B</asp:ListItem>
                                                    <asp:ListItem>C</asp:ListItem>
                                                    <asp:ListItem>D</asp:ListItem>
                                                    <asp:ListItem>E</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <strong>Extra Notes:</strong></td>
                                            <td align="left" class="borderedTableGrey" valign="top">
                                                <asp:TextBox ID="TextBox4" runat="server" Columns="90" 
                                                    CssClass="defaultFormElementStyle" Rows="5" 
                                                    Text='<%# Bind("QuestionExtraNotes") %>' TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_PQ_DELETE_PQ_Question" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_PQ_INSERT_PQ_Question" InsertCommandType="StoredProcedure"
                        SelectCommand=" SELECT DISTINCT [QuestionId], [SubjectShortName], a.[ClassName], [QuestionText], [QuestionExtraNotes], [DiagramLocation], [AnswerChoice1],  [AnswerChoice2], [AnswerChoice3], [AnswerChoice4], [AnswerChoice5], [CorrectAnswerChoice], b.SubjectName, a.[Remark1], a.[Remark2], a.[Remark3] FROM dbo.PQ_Question a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName INNER JOIN dbo.TEMPClass e ON a.ClassName = e.ClassName INNER JOIN dbo.TEMPUserSubject c ON b.SubjectId = c.SubjectId INNER JOIN dbo.TEMPUserSubject f ON c.ClassName = f.ClassName INNER JOIN dbo.Core_User d ON c.UserId = d.UserId WHERE d.Username = @Username ORDER BY b.SubjectName "
                        UpdateCommand="STP_PQ_UPDATE_PQ_Question" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="QuestionId" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="QuestionId" Type="Int32" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="QuestionText" Type="String" />
                            <asp:Parameter Name="QuestionExtraNotes" Type="String" />
                            <%--<asp:Parameter Name="DiagramLocation" Type="String" />--%>
                            <asp:Parameter Name="AnswerChoice1" Type="String" />
                            <asp:Parameter Name="AnswerChoice2" Type="String" />
                            <asp:Parameter Name="AnswerChoice3" Type="String" />
                            <asp:Parameter Name="AnswerChoice4" Type="String" />
                            <asp:Parameter Name="AnswerChoice5" Type="String" />
                            <asp:Parameter Name="CorrectAnswerChoice" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="QuestionId" 
                                Type="Int32" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="QuestionText" Type="String" />
                            <asp:Parameter Name="QuestionExtraNotes" Type="String" />
                            <asp:Parameter Name="DiagramLocation" Type="String" />
                            <asp:Parameter Name="AnswerChoice1" Type="String" />
                            <asp:Parameter Name="AnswerChoice2" Type="String" />
                            <asp:Parameter Name="AnswerChoice3" Type="String" />
                            <asp:Parameter Name="AnswerChoice4" Type="String" />
                            <asp:Parameter Name="AnswerChoice5" Type="String" />
                            <asp:Parameter Name="CorrectAnswerChoice" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT DISTINCT a.[SubjectId], ShortName + ' (' + SubjectName + ')' AS SubjectDescription, [ShortName] FROM [TEMPSubject] a INNER JOIN dbo.TEMPUserSubject b ON a.SubjectId = b.SubjectId INNER JOIN dbo.Core_User c ON b.UserId = c.UserId WHERE c.Username = @Username ORDER BY [ShortName]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlClasses" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT DISTINCT [ClassId], a.[ClassName] FROM [TEMPClass] a INNER JOIN dbo.TEMPUserSubject b ON a.ClassName = b.ClassName INNER JOIN dbo.Core_User c ON b.UserId = c.UserId WHERE c.UserName = @Username ORDER BY a.[ClassName]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
