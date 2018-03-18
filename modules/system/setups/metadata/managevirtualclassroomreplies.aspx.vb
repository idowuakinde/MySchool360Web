
Partial Class modules_system_setups_metadata_managevirtualclassroomreplies
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0, resourceId As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        resourceId = Request.QueryString("a")
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            Dim downloadLocation As String = Common.ConvertDBNulltoNothing(rowView("Remark1"))
            If downloadLocation = "" Then
                CType(e.Row.FindControl("hlnkDownload"), HyperLink).Visible = False
            Else
                CType(e.Row.FindControl("hlnkDownload"), HyperLink).NavigateUrl = "~/_virtualclass/replies/" & downloadLocation
            End If
        End If
    End Sub
End Class
