<%@ Page Language="VB" AutoEventWireup="false" CodeFile="virtualclass_resources.aspx.vb" Inherits="modules_virtualClass_virtualclass_resources" %>

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
                    Text=":: My Virtual Classroom"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr>
                <td>
                    Please choose a subject:
                    <asp:DropDownList ID="ddlSubjects" runat="server" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudentSubjects" 
                        DataTextField="SubjectName" DataValueField="SubjectShortName" 
                        AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Value="0">Please choose a subject:</asp:ListItem>
                    </asp:DropDownList>
                  </td>
              </tr>
              <tr>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ResourceId" 
                        DataSourceID="dsSqlResources" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1100px" EnableModelValidation="True" 
                        EmptyDataText="Sorry. No resources were found for the selected subject. &lt;br /&gt;&amp;nbsp;&lt;br /&gt;Choose another subject from the list above.">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlnkDownload" runat="server" Height="16px" 
                                        ImageUrl="~/images/download2.jpg" Target="_blank">HyperLink</asp:HyperLink>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:HyperLink ID="hlnkReply" runat="server" NavigateUrl='<%# "~/modules/virtualClass/virtualclass_resources_reply.aspx?a=" & portalNumber & "&b=" & CType(Databinder.Eval(Container.DataItem, "ResourceId"), String) %>'>Reply</asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="20px" HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN" InsertVisible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </ItemTemplate>
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
                                    <asp:DropDownList ID="ddlSubjects_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectDescription" DataValueField="ShortName" 
                                        SelectedValue='<%# Bind("SubjectShortName") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:DropDownList ID="ddlClassName_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="ResourceTypeName">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ResourceTypeName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlResourceType" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlResourceTypes" 
                                        DataTextField="ResourceTypeName" DataValueField="ResourceTypeId" 
                                        SelectedValue='<%# Bind("ResourceTypeId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Topic Area" SortExpression="TopicArea">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("TopicArea") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Columns="30" 
                                        Text='<%# Bind("TopicArea") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title &amp; Location" 
                                SortExpression="ResourceTitle">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ResourceTitle") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ResourceLocation") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    Title:
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="30" 
                                        Text='<%# Bind("ResourceTitle") %>'></asp:TextBox>
                                    <br />
                                    <br />
                                    Location:
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="30" 
                                        Text='<%# Bind("ResourceLocation") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("Notes") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="200px" />
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
                    <asp:SqlDataSource ID="dsSqlResources" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="  ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ClassName" QueryStringField="c" />
                            <asp:ControlParameter ControlID="ddlSubjects" Name="SubjectShortName" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlStudentSubjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="  ">
                    <SelectParameters>
                        <asp:Parameter Name="PortalNumber" />
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
