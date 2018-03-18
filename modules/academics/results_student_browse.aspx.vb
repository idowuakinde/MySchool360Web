
Partial Class modules_academics_results_student_browse
    Inherits System.Web.UI.Page

    Public profileOrientation As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim rcSettings As System.Data.DataRowCollection = Common.GetSettings("Profile")
        profileOrientation = CType(rcSettings(0).Item(1), String)
    End Sub
End Class
