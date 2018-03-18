
Partial Class modules_data_nurseryskills_step2
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, className As String = "", assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "2nd Term"  ' Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        className = Request.QueryString("a")
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Select Case rowView("ClassName").ToString.ToUpper
                Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED", "PLAYGROUP"    'nursery & playgroup

                    CType(e.Row.FindControl("hlnkEnterSkillsReport"), HyperLink).NavigateUrl = "manage_student_scores_nurseryskills_CA4.aspx?a=" & rowView("PortalNumber").ToString

                Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary

                    CType(e.Row.FindControl("hlnkEnterSkillsReport"), HyperLink).NavigateUrl = "manage_student_scores_primaryskills_CA4.aspx?a=" & rowView("PortalNumber").ToString
                    CType(e.Row.FindControl("hlnkEnterSkillsReport"), HyperLink).Text = "Enter Behavioural Assessment"

            End Select
        End If
    End Sub
End Class
