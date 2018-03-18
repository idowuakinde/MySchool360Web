Imports System.Data
Imports Microsoft.Practices.EnterpriseLibrary.Data

Partial Class modules_system_users_default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim x As String = System.Enum.GetName(GetType(Nextzon.EnterpriseLibrary.Miscellaneous.Enumerations.MaritalStatus), 0).Replace("Status", "")
    End Sub
    Protected Sub gvUsers_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvUsers.RowEditing
        Dim objGridView As GridView = CType(sender, GridView)
        objGridView.SelectedIndex = e.NewEditIndex
        objGridView = Nothing
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound

    End Sub
End Class
