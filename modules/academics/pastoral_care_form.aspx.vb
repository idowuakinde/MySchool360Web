
Partial Class modules_academics_pastoral_care_form
    Inherits System.Web.UI.Page

    Public className As String

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        className = Request.QueryString("a")
        Me.Label9.Text = ":: PASTORAL CARE FORM FOR " & className.ToUpper
    End Sub
End Class
