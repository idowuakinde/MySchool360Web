
Partial Class modules_inventory_recordinitialcount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call ChangeAssetMeasure()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Call ChangeAssetMeasure()
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Dim ret As Int32 = e.AffectedRows

        Select Case ret
            Case -1
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Green
                lblStatus.Text = "Success! Initial Inventory Count was successfully recorded."
            Case Else
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Red
                lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End Select
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        e.Values("InventoryCountTimeStamp") = Now()
    End Sub

    Public Sub ChangeAssetMeasure()
        Dim currentAssetRef As String = CType(Me.DetailsView1.FindControl("DropDownList1"), DropDownList).SelectedValue
        CType(Me.DetailsView1.FindControl("lblUnits"), Label).Text = GetUnitsOfMeasure(currentAssetRef)
    End Sub

    Public Function GetUnitsOfMeasure(ByVal assetRef As String) As String
        Dim ret As String

        'Dim units As String = Common.GetTableRows("SELECT InventoryMeasureName FROM dbo.VW_INVENTORY_AssetLog WHERE AssetRef = '" & assetRef & "'")(0).Item(0).ToString
        Dim units As String = Common.GetTableRows("SELECT InventoryMeasureName FROM dbo.VW_INVENTORY_AssetLog WHERE AssetRef = '" & assetRef & "'")(0).Item(0).ToString

        ret = units

        Return ret
    End Function
End Class
