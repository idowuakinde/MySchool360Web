
Partial Class modules_profiles_profile_student_single
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", className As String = "", imageURL As String = "", studentName As String = ""
    Public serial As Int32 = 0
    Public totalTerm1 As Int32 = 0, countTerm1 As Int32 = 0, avgTerm1 As Double = 0
    Public totalTerm2 As Int32 = 0, countTerm2 As Int32 = 0, avgTerm2 As Double = 0
    Public totalTerm3 As Int32 = 0, countTerm3 As Int32 = 0, avgTerm3 As Double = 0
    Public totalPastoralCare As Int32 = 0, countPastoralCare As Int32 = 0, avgPastoralCare As Double = 0
    Public totalAttendance As Int32 = 0, countAttendance As Int32 = 0, avgAttendance As Double = 0
    Public totalHomework As Int32 = 0, countHomework As Int32 = 0, avgHomework As Double = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a").ToString
        className = Request.QueryString("b").ToString
        studentName = Common.GetTableRows("SELECT FullName FROM VW_StudentProfiles WHERE MatricNumber = " & portalNumber & " ")(0).Item(0).ToString
        imageURL = "../../images/pp/" & portalNumber & ".jpg"
        imgPhoto.ImageUrl = imageURL
        imgPhoto.Visible = True

        Me.Label13.Text = " :: " & studentName & "'s Family (Parents and Siblings)"
        Me.Label10.Text = " :: " & studentName & "'s Exam and Test Records"
        Me.Label15.Text = " :: " & studentName & "'s Pastoral Care Records"
        Me.Label16.Text = " :: " & studentName & "'s Attendance Records"
        Me.Label17.Text = " :: " & studentName & "'s Homework Records"
        Me.Label18.Text = " :: " & studentName & "'s Library Records"
        Me.Label19.Text = " :: " & studentName & "'s Class Movement Records"
        Me.Label20.Text = " :: " & studentName & "'s Disciplinary Records"
        Me.Label21.Text = " :: " & studentName & "'s Leadership and Social Activity Records"
        Me.Label23.Text = " :: " & studentName & "'s Sports Activities"
        Me.Label.Text = " :: " & studentName & "'s Medical Incident Records"
        Me.Label11.Text = " :: " & studentName & "'s Wallet (Financial Records)"
        Me.Label24.Text = " :: " & studentName & "'s Excursion Records"
        Me.Label25.Text = " :: " & studentName & "'s Previous Schools Attended"
        Me.Label27.Text = " :: " & studentName & "'s Classmates"
    End Sub

    Protected Sub GridView7_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvFamily.RowDataBound
        'serial = 0
        serial += 1
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvExamTest1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            countTerm1 += 1
            totalTerm1 += rowView("Score").ToString
            avgTerm1 = FormatNumber(totalTerm1 / countTerm1, 0)
        End If
    End Sub

    Protected Sub GridView3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvExamTest2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            countTerm2 += 1
            totalTerm2 += rowView("Score").ToString
            avgTerm2 = FormatNumber(totalTerm2 / countTerm2, 0)
        End If
    End Sub

    Protected Sub GridView4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvExamTest3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            countTerm3 += 1
            totalTerm3 += rowView("Score").ToString
            avgTerm3 = FormatNumber(totalTerm3 / countTerm3, 0)
        End If
    End Sub

    Protected Sub GridView9_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvPastoralCare.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView9_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvPastoralCare.RowDataBound
        serial += 1
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            countPastoralCare += 1
            totalPastoralCare += rowView("Score").ToString
            avgPastoralCare = FormatNumber(totalPastoralCare / countPastoralCare, 0)
        End If
    End Sub

    Protected Sub GridView10_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvAttendance.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView10_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAttendance.RowDataBound
        serial += 1
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            countAttendance += 1
            totalAttendance += rowView("Score").ToString
            avgAttendance = FormatNumber(totalAttendance / countAttendance, 0)
        End If
    End Sub

    Protected Sub GridView11_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvHomework.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView11_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvHomework.RowDataBound
        serial += 1
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            countHomework += 1
            totalHomework += rowView("Score").ToString
            avgHomework = FormatNumber(totalHomework / countHomework, 0)
        End If
    End Sub

    Protected Sub GridView13_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvClassMovement.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView13_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvClassMovement.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView12_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvLibrary.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView12_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvLibrary.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView14_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvDisciplinary.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView14_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDisciplinary.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView15_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvLeadershipSocial.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView15_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvLeadershipSocial.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView17_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSports.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView17_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSports.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView6_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMedical.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView6_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMedical.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView18_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvExcursion.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView18_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvExcursion.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView19_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvPreviousSchools.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView19_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvPreviousSchools.RowDataBound
        serial += 1
    End Sub

    Protected Sub GridView20_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvOtherInfo.DataBinding
        serial = 0
    End Sub

    Protected Sub GridView20_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvOtherInfo.RowDataBound
        serial += 1
    End Sub
End Class
