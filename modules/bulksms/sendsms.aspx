<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sendsms.aspx.vb" Inherits="modules_bulksms_sendsms" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" media="screen, print" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    </head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="880"  border="0" id="TABLE1">
            <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="225" align="left" valign="middle"><asp:Label ID="Label3" runat="server" 
                                    Font-Bold="True" Font-Size="Small" Text=":: Send Bulk SMS"></asp:Label></td>
                            <td align="left" valign="middle">&nbsp;</td>
                        </tr>
                </table></td>
            </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td align="left">
                <asp:Label ID="lblBalance" runat="server" 
                                    Font-Bold="True" EnableViewState="False"></asp:Label>
              </td>
          </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td align="left">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
              </td>
          </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td>
        <asp:DetailsView ID="dvNewStudent" runat="server" AutoGenerateRows="False"
            DataKeyNames="MessageId" DataSourceID="dsSqlSendSMS" Height="50px" 
                    CssClass="noBorderedMenuTable" DefaultMode="Insert" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="850px" 
                    EnableModelValidation="True">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <EditRowStyle Wrap="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="150px" 
                VerticalAlign="Top" />
            <Fields>
                <asp:BoundField DataField="MessageId" HeaderText="MessageId" 
                    InsertVisible="False" ReadOnly="True" SortExpression="MessageId" />
                <asp:TemplateField HeaderText="Gateway:">
                    <ItemTemplate>
                        &nbsp;Gateway #2
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sender Alias:" SortExpression="SenderAlias">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SenderAlias") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAlias" runat="server" Columns="30" 
                            CssClass="defaultFormElementStyle" MaxLength="11"></asp:TextBox>
                        &nbsp;(Max. 11 characters, e.g. CHILDVILLE)
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtAlias" ErrorMessage="* Required" Font-Bold="True"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SenderAlias") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Recipient(s):" SortExpression="Recipients">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Recipients") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="70%" valign="top">
                                    Please provide recipient(s) in International format, e.g. 
                                    <b>2348031234567, 2348051234567.</b><br />
                                    <b>Hint:</b> You can use the &quot;Auto-Correct&quot; 
                                    button to automatically convert local numbers to the International format.<br />
                                    <asp:TextBox ID="txtRecipients" runat="server" Columns="70" 
                                        CssClass="defaultFormElementStyle" Rows="7" Text='<%# Bind("Recipients") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtRecipients" ErrorMessage="* Required" 
                                        Font-Bold="True"></asp:RequiredFieldValidator>
                                    <br />
                                    <input id="btnAutoCorrect" type="button" value="      Auto-Correct Recipient(s)      " onclick="javascript:document.getElementById('dvNewStudent_txtRecipients').value=CorrectBulkSMSNumbers(dvNewStudent_txtRecipients.value, '1');document.getElementById('dvNewStudent_txtRecipients').value=CorrectBulkSMSNumbers(dvNewStudent_txtRecipients.value, '2');" class="defaultButtonStyle" />
                                    &nbsp;</td>
                                <td bgcolor="#FFFFCC" valign="top">
                                    Recipient Groups:<br />&nbsp;<br />
                                    <asp:DropDownList ID="ddlRecipientGroups" runat="server" 
                                        AppendDataBoundItems="True" AutoPostBack="True" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlRecipientGroups" 
                                        DataTextField="ClassName" DataValueField="ClassAlias" 
                                        onselectedindexchanged="ddlRecipientGroups_SelectedIndexChanged">
                                        <asp:ListItem Value="--">Please select a recipient group:</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Recipients") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message Type:" SortExpression="MessageType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MessageType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlMessageType" runat="server" 
                            CssClass="defaultFormElementStyle" 
                            SelectedValue='<%# Bind("MessageType") %>'>
                            <asp:ListItem Value="0">Text</asp:ListItem>
                            <asp:ListItem Value="1" Enabled="False">Flash</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("MessageType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message Text:" SortExpression="MessageText">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MessageText") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <b>&nbsp;<span id="char_count">0 characters (0 SMS Units)</span></b><br />
                        <asp:TextBox ID="txtMessageText" runat="server" Columns="70" 
                            CssClass="defaultFormElementStyle" Rows="10" Text='<%# Bind("MessageText") %>' 
                            TextMode="MultiLine" onFocus="javascript:CalculateSMSUnits('dvNewStudent_txtMessageText','char_count');" onKeyDown="javascript:CalculateSMSUnits('dvNewStudent_txtMessageText','char_count');" onKeyUp="javascript:CalculateSMSUnits('dvNewStudent_txtMessageText','char_count');"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtMessageText" ErrorMessage="* Required" 
                            Font-Bold="True"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MessageText") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Remark1" HeaderText="Remark1:" 
                    SortExpression="Remark1" Visible="False" />
                <asp:BoundField DataField="Remark2" HeaderText="Remark2:" 
                    SortExpression="Remark2" Visible="False" />
                <asp:BoundField DataField="Remark3" HeaderText="Remark3:" 
                    SortExpression="Remark3" Visible="False" />
                <asp:CommandField ButtonType="Button" InsertText="Send Message" 
                    ShowInsertButton="True" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="btnSendMessage" runat="server" onclick="btnSendMessage_Click" 
                            onclientclick="javascript:document.getElementById('btnAutoCorrect').click();var answer = window.confirm(dvNewStudent_txtRecipients.value.split(',').length + ' recipient(s) were auto-corrected.\n\nClick Ok to continue or Cancel to abort.');return answer;" 
                            Text="      Send SMS      " />
                        <input id="btnReset" type="reset" value="Clear All" />
                    </InsertItemTemplate>
                    <ItemStyle BackColor="#FFFF99" />
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                Font-Size="Medium" Height="35px" HorizontalAlign="Center" 
                VerticalAlign="Middle" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle Wrap="True" HorizontalAlign="Left" VerticalAlign="Top" 
                BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsSqlSendSMS" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="STP_BULKSMS_SELECTALL_BulkSMS_Message" 
                    SelectCommandType="StoredProcedure" 
                    InsertCommand="STP_BULKSMS_INSERT_BulkSMS_Message" 
                    InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Direction="InputOutput" Name="MessageId" Type="Int32" />
                <asp:Parameter Name="SenderAlias" Type="String" />
                <asp:Parameter Name="Recipients" Type="String" />
                <asp:Parameter Name="MessageType" Type="String" />
                <asp:Parameter Name="MessageText" Type="String" />
                <asp:Parameter Name="Remark1" Type="String" />
                <asp:Parameter Name="Remark2" Type="String" />
                <asp:Parameter Name="Remark3" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlRecipientGroups" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>"                     
                    SelectCommand="SELECT -10 AS ListingOrder, '--------------------' AS ClassName, '--------------------' AS ClassAlias UNION ALL SELECT -9, 'Parents: Creche', 'CRE' UNION ALL SELECT -8, 'Parents: Nursery', 'NUR' UNION ALL SELECT -7, 'Parents: Primary', 'PRI' UNION ALL SELECT -6, 'Parents: Secondary', 'SEC' UNION ALL SELECT -5, '--------------------', '--------------------' UNION ALL SELECT -4, 'Parents: Junior School', 'Junior' UNION ALL SELECT -3, 'Parents: Senior School', 'Senior' UNION ALL SELECT -2, '--------------------', '--------------------' UNION ALL SELECT -1, 'All Parents', 'Parents' UNION ALL SELECT 0, '--------------------', '--------------------' UNION ALL SELECT 1, 'Staff: Teaching', 'Teaching' UNION ALL SELECT 2, 'Staff: Administrative', 'Admin' UNION ALL SELECT 3, 'Staff: Maintenance', 'Maintenance' UNION ALL SELECT 4, '--------------------', '--------------------' UNION ALL SELECT 5, 'All Staff', 'Staff' UNION ALL SELECT 6, '--------------------', '--------------------' UNION ALL SELECT 7, 'All Parents and Staff', 'All' UNION ALL SELECT 8, '--------------------', '--------------------' UNION ALL SELECT ListingOrder, 'Parents: ' + [ClassName], [ClassAlias] FROM [TEMPClass] ORDER BY ListingOrder">
                </asp:SqlDataSource>
              </td>
          </tr>
            <tr>
                <td colspan="2">&nbsp;
                    </td>
            </tr>
            </table>
      </div>
    </form>
</body>
</html>
