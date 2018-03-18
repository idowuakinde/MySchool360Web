
Partial Class modules_profiles_teacher_performance_techer_perf_student
    Inherits System.Web.UI.Page

    Public portalNumber As String, className As String, imageUrl As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")

        imageUrl = "~/images/pp/" & portalNumber & ".jpg"
        'CType(Me.DetailsView1.FindControl("imgPhoto"), Image).ImageUrl = Common.ShowPhotograph(imageUrl, Server.MapPath(imageUrl))
    End Sub

    Public Function GetStudentDetails() As System.Data.DataRowCollection
        Dim ret As System.Data.DataRowCollection

        Dim rows As System.Data.DataRowCollection = Common.GetTableRows(" SELECT * FROM dbo.TEMPCustomers WHERE CustomerCode = '" & portalNumber & "' ")

        ret = rows

        Return ret
    End Function
End Class
