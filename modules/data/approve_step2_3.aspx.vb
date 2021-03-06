﻿
Partial Class modules_data_approve_step2_3
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, className As String = "", schoolId As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "2nd Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        className = Request.QueryString("a")
        schoolId = Request.Cookies("School")("SchoolId")        ' request.querystring("b")
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Select Case CType(rowView("ClassName"), String).ToUpper
                Case "PRE-NURSERY", "PLAYGROUP"
                    CType(e.Row.FindControl("hlnkPrint"), HyperLink).NavigateUrl = ""
                Case Else
                    'do nothing
            End Select
        End If
    End Sub
End Class
