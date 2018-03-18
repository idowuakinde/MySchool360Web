
Partial Class modules_data_filter_comments_entry_for_classteacher
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0, username As String = ""
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public termName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Select Case Common.GetProgramme(rowView("ClassName")).ToUpper
                'Case "CRE"
                '    CType(e.Row.FindControl("hlnkSkills2"), HyperLink).Text = "&nbsp;"
                '    CType(e.Row.FindControl("hlnkSkills4"), HyperLink).Text = "&nbsp;"
                '    CType(e.Row.FindControl("hlnkSkills6"), HyperLink).Text = "&nbsp;"
                Case "CRE", "NUR"
                    CType(e.Row.FindControl("hlnkSkills2"), HyperLink).NavigateUrl = "~/modules/data/nurseryskills_step1.aspx?a=" & rowView("ClassName").ToString
                    CType(e.Row.FindControl("hlnkSkills4"), HyperLink).NavigateUrl = "~/modules/data/nurseryskills_step2.aspx?a=" & rowView("ClassName").ToString
                    CType(e.Row.FindControl("hlnkSkills6"), HyperLink).NavigateUrl = "~/modules/data/nurseryskills_step3.aspx?a=" & rowView("ClassName").ToString
                Case "PRI"
                    CType(e.Row.FindControl("HyperLink1"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_primary_CA1.aspx?a=" & username
                    CType(e.Row.FindControl("HyperLink2"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_primary_CA2.aspx?a=" & username
                    CType(e.Row.FindControl("hlnkSkills2"), HyperLink).NavigateUrl = "~/modules/data/nurseryskills_step1.aspx?a=" & rowView("ClassName").ToString
                    CType(e.Row.FindControl("hlnkSkills2"), HyperLink).Text = "Enter Behavioural Assessment"
                    CType(e.Row.FindControl("HyperLink3"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_primary_CA3.aspx?a=" & username
                    CType(e.Row.FindControl("HyperLink4"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_primary_CA4.aspx?a=" & username
                    CType(e.Row.FindControl("hlnkSkills4"), HyperLink).NavigateUrl = "~/modules/data/nurseryskills_step2.aspx?a=" & rowView("ClassName").ToString
                    CType(e.Row.FindControl("hlnkSkills4"), HyperLink).Text = "Enter Behavioural Assessment"
                    CType(e.Row.FindControl("HyperLink5"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_primary_CA5.aspx?a=" & username
                    CType(e.Row.FindControl("HyperLink6"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_primary_CA6.aspx?a=" & username
                    CType(e.Row.FindControl("hlnkSkills6"), HyperLink).NavigateUrl = "~/modules/data/nurseryskills_step3.aspx?a=" & rowView("ClassName").ToString
                    CType(e.Row.FindControl("hlnkSkills6"), HyperLink).Text = "Enter Behavioural Assessment"
                Case "SEC"
                    CType(e.Row.FindControl("HyperLink1"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_sec_CA1.aspx?a=" & username
                    CType(e.Row.FindControl("HyperLink2"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_sec_CA2.aspx?a=" & username
                    CType(e.Row.FindControl("hlnkSkills2"), HyperLink).Text = "&nbsp;"
                    CType(e.Row.FindControl("HyperLink3"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_sec_CA3.aspx?a=" & username
                    CType(e.Row.FindControl("HyperLink4"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_sec_CA4.aspx?a=" & username
                    CType(e.Row.FindControl("hlnkSkills4"), HyperLink).Text = "&nbsp;"
                    CType(e.Row.FindControl("HyperLink5"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_sec_CA5.aspx?a=" & username
                    CType(e.Row.FindControl("HyperLink6"), HyperLink).NavigateUrl = "~/modules/data/comments_classteacher_sec_CA6.aspx?a=" & username
                    CType(e.Row.FindControl("hlnkSkills6"), HyperLink).Text = "&nbsp;"
            End Select
        End If
    End Sub
End Class
