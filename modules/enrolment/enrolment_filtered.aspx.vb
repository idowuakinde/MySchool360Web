
Partial Class modules_enrolment_enrolment_filtered
    Inherits System.Web.UI.Page

    Public pageSize As Int32, pageIndex As Int32, serialNumber As Int32
    Public sessionName As String, reportFilter As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sessionName = Request.QueryString("a")
        reportFilter = Request.QueryString("b")
        If Not IsPostBack Then  'first-time load
            Me.Label7.Text = "Now Showing " & reportFilter.ToUpper & " Applications. "
        End If
    End Sub

    Protected Sub GridView5_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView5.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            serialNumber += 1
        End If
    End Sub

    Protected Sub dsSqlStudentProfile_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlStudentProfile.Updating
        e.Command.Parameters("@CustomerCode").Value = e.Command.Parameters("@MatricNumber").Value
        e.Command.Parameters("@ActiveInactive").Value = e.Command.Parameters("@ApplicationStatus").Value
        e.Command.Parameters.RemoveAt("@ApplicationStatus")
        e.Command.Parameters.RemoveAt("@EmailAddress")
        e.Command.Parameters.RemoveAt("@ParentEmail")
        e.Command.Parameters.RemoveAt("@Boarder")
        e.Command.Parameters.RemoveAt("@MatricNumber")
        e.Command.Parameters.RemoveAt("@PhoneNumber")
        e.Command.Parameters.RemoveAt("@Extension")
        e.Command.Parameters.RemoveAt("@StateName")

        Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        For Each p As System.Data.Common.DbParameter In cmdParams
            Trace.Warn(p.ParameterName, p.Value)
        Next

        'e.Cancel = True
    End Sub
End Class
