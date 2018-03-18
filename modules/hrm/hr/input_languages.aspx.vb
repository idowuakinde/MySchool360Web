
Partial Class modules_hr_input_languages
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        If Me.DropDownList4.SelectedValue <> "0" Then
            Me.gvUsers.Visible = True
            Me.DetailsView1.Visible = True
        Else
            Me.gvUsers.Visible = False
            Me.DetailsView1.Visible = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Me.gvUsers.DataBind()
        'Me.DetailsView1.DataBind()
    End Sub
End Class
