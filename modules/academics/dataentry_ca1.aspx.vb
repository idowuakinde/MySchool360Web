
Partial Class modules_academics_dataentry_ca1
    Inherits System.Web.UI.Page

    Public serialNumber As Int32, formOrderNumber As Int32, className As String, termNumber As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        formOrderNumber = Request.QueryString("a")
        className = Request.QueryString("b")
        termNumber = Request.QueryString("c")
        Me.lblHeader.Text = "Data Entry Page (Subject by Subject) for " & className
        Me.dsoUsers.SelectCommand = "SELECT a.CustomerId, a.RefCode, right(a.CustomerCode, 5) as MatricNumber, a.CustomerName, a.BillingAddress, a.SyncStatus AS Gender FROM TEMPCustomers a ORDER BY MatricNumber "
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        'Me.DetailsView1.DataBind()
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        serialNumber += 1
    End Sub

    Protected Sub gvMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMaster.SelectedIndexChanged
        'Session("PortalNumber") = GetPortalNumber(gvMaster.SelectedValue)
        Session("PortalNumber") = gvMaster.SelectedValue
        For Each gvRow As GridViewRow In gvMaster.Rows
            gvRow.FindControl("gvDetail").Visible = False
            gvRow.FindControl("lblAddNew").Visible = False
            gvRow.FindControl("dvSubjectScore").Visible = False
        Next
        dsSqlGetDetail.SelectParameters(0).DefaultValue = gvMaster.SelectedDataKey(0).ToString
        dsSqlGetDetail.DataBind()
        gvMaster.SelectedRow.FindControl("gvDetail").Visible = True
        gvMaster.SelectedRow.FindControl("lblAddNew").Visible = True
        gvMaster.SelectedRow.FindControl("dvSubjectScore").Visible = True
    End Sub

    Private Function GetPortalNumber(ByVal formOrderHeaderId As Int32) As String
        Dim ret As String
        Dim rows As System.Data.DataRowCollection = Common.GetTableRows("SELECT PortalNumber FROM dbo.TEMPFormOrderHeader WHERE FormOrderHeaderId = " & formOrderHeaderId & "")

        ret = rows(0).Item("PortalNumber").ToString

        Return ret
    End Function

    Protected Sub DetailsViewItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)
        gvMaster.SelectedRow.FindControl("gvDetail").DataBind()
    End Sub
End Class
