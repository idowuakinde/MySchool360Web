
Partial Class modules_profiles_manage_student
    Inherits System.Web.UI.Page

    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.HyperLink1.NavigateUrl &= "?a=" & sessionName & "&b=&c=%"
        Me.hlnkStudentSubjects.NavigateUrl &= "?a=" & sessionName & "&b=&c=%"
        Me.HyperLink3.NavigateUrl &= "?a=" & sessionName & "&b=&c=%"
    End Sub
End Class
