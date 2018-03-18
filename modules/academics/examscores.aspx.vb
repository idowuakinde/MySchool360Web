
Partial Class modules_academics_examscores
    Inherits System.Web.UI.Page

    Public serial1 As Int32, totalScore1 As Int32, averageScore1 As Int32
    Public serial2 As Int32, totalScore2 As Int32, averageScore2 As Int32
    Public serial3 As Int32, totalScore3 As Int32, averageScore3 As Int32
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial1 += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            totalScore1 += rowView("Score").ToString
            averageScore1 = totalScore1 / serial1
            rowView = Nothing
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'Me.Label4.Text = "TOTAL REVENUE COLLECTED (ACROSS " & serialNumber & " BANKS) BETWEEN " & MonthName(filterDate_Start.Month, True) & " " & filterDate_Start.Day & ", " & filterDate_Start.Year & " AND " & MonthName(filterDate_End.Month, True) & " " & filterDate_End.Day & ", " & filterDate_End.Year & ": N " & FormatNumber(total, 2)
            CType(sender, System.Web.UI.WebControls.GridView).Columns(4).FooterText = averageScore1 & "%"
        End If
    End Sub

    Protected Sub GridView3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial2 += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            totalScore2 += rowView("Score").ToString
            averageScore2 = totalScore2 / serial2
            rowView = Nothing
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'Me.Label4.Text = "TOTAL REVENUE COLLECTED (ACROSS " & serialNumber & " BANKS) BETWEEN " & MonthName(filterDate_Start.Month, True) & " " & filterDate_Start.Day & ", " & filterDate_Start.Year & " AND " & MonthName(filterDate_End.Month, True) & " " & filterDate_End.Day & ", " & filterDate_End.Year & ": N " & FormatNumber(total, 2)
            CType(sender, System.Web.UI.WebControls.GridView).Columns(4).FooterText = averageScore2 & "%"
        End If
    End Sub

    Protected Sub GridView4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView4.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial3 += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            totalScore3 += rowView("Score").ToString
            averageScore3 = totalScore3 / serial3
            rowView = Nothing
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'Me.Label4.Text = "TOTAL REVENUE COLLECTED (ACROSS " & serialNumber & " BANKS) BETWEEN " & MonthName(filterDate_Start.Month, True) & " " & filterDate_Start.Day & ", " & filterDate_Start.Year & " AND " & MonthName(filterDate_End.Month, True) & " " & filterDate_End.Day & ", " & filterDate_End.Year & ": N " & FormatNumber(total, 2)
            CType(sender, System.Web.UI.WebControls.GridView).Columns(4).FooterText = averageScore3 & "%"
        End If
    End Sub
End Class
