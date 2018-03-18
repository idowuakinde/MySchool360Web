
Partial Class modules_system_setups_metadata_manageclasssubjects
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub dsSqlClassSubjects_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlClassSubjects.Inserting
        Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        For Each p As System.Data.Common.DbParameter In cmdParams
            Trace.Warn(p.ParameterName, p.Value)
        Next

        'e.Cancel = True
    End Sub
End Class
