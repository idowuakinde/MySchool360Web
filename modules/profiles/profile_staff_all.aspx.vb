
Partial Class modules_profiles_profile_staff_all
    Inherits System.Web.UI.Page

    Public alternateRowColour As System.Drawing.Color, serialNumber As Int32, serialSubjects As Int32, serialAwards As Int32
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'alternateRowColour = Drawing.ColorTranslator.FromHtml("#" & Request.QueryString("b").ToString)
        'GridView1.HeaderRow.BackColor = alternateRowColour
        'GridView3.HeaderRow.BackColor = alternateRowColour
        'GridView4.HeaderRow.BackColor = alternateRowColour
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
        End If
    End Sub

    Protected Sub GridView3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialSubjects += 1
        End If
    End Sub

    Protected Sub GridView4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView4.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialAwards += 1
        End If
    End Sub
End Class
