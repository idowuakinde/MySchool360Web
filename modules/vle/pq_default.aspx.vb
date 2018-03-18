
Partial Class modules_vle_pq_default
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", className As String = "", schoolColour As String = "", serial As Int32 = 0
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("b")
        schoolColour = "#" & Request.QueryString("d")

        Me.hidPortalNumber.Value = portalNumber

        Me.dsSqlStudentSubjects.SelectCommand = " SELECT DISTINCT a.[SubjectShortName], b.[SubjectName] FROM dbo.[TEMPStudentSubject] a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName WHERE ([PortalNumber] = @PortalNumber) AND SessionName = @SessionName ORDER BY [SubjectShortName] "
        Me.dsSqlStudentSubjects.SelectParameters(0).DefaultValue = portalNumber
        Me.dsSqlStudentSubjects.SelectParameters(1).DefaultValue = sessionName
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Server.Transfer("pq_test.aspx", True)
        'Response.Redirect("pq_test.aspx")
    End Sub
End Class
