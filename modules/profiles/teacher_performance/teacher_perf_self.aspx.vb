
Partial Class modules_profiles_teacher_performance_teacher_perf_self
    Inherits System.Web.UI.Page

    Public username As String

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        username = Request.QueryString("a")
    End Sub

    Public Function GetTeacherDetails() As System.Data.DataRowCollection
        Dim ret As System.Data.DataRowCollection

        Dim rows As System.Data.DataRowCollection = Common.GetTableRows(" SELECT * FROM dbo.Core_User WHERE Username = '" & username & "' ")

        ret = rows

        Return ret
    End Function
End Class
