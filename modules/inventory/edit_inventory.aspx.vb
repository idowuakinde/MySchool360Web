
Partial Class modules_inventory_edit_inventory
    Inherits System.Web.UI.Page

    Public serial As Int32, totalInventoryQuantity As Double, totalInventoryValue As Double

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            serial += 1
            totalInventoryQuantity += CType(rowView("NewQuantity"), Double)
            totalInventoryValue += CType(rowView("NewQuantity"), Double) * CType(rowView("ValuePerUnit"), Double)
        Else
            'do nothing
        End If
    End Sub

    Protected Sub btnInventoryIncrease_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'save this Increase operation in the InventoryTransaction table
        Dim currentRow As GridViewRow = CType(sender, Button).Parent.Parent
        Dim assetRef As String = CType(currentRow.FindControl("hidAssetRef"), HiddenField).Value
        Dim quantity As String = CType(currentRow.FindControl("hidQty"), HiddenField).Value
        Dim newQuantity As String = quantity + CType(CType(currentRow.FindControl("ddlInventoryIncrease"), DropDownList).SelectedValue, Double)
        Dim username As String = Common.DecodeHTML(Request.Cookies("User")("Username")).Replace("'", "''") '& "|" & Request.ServerVariables("REMOTE_ADDR").Replace("'", "''") & "|" & Request.ServerVariables("USER_AGENT").Replace("'", "''")
        Dim newLocation As String = "NULL"
        Dim notes As String = CType(currentRow.FindControl("txtInventoryIncrease"), TextBox).Text.Replace("'", "''")

        Dim sqlInsert As String = " INSERT INTO dbo.INVENTORY_InventoryTransaction(InventoryTransactionType, InventoryTransactionRef, InventoryTransactionTimeStamp, AssetRef, Quantity, Username, Remarks, Remark2, Remark3) "
        sqlInsert &= " VALUES ('INCREASE','" & Guid.NewGuid.ToString.ToUpper & "','" & Now.ToString & "','" & assetRef & "'," & quantity & ",'" & username & "','" & newQuantity & "'," & newLocation & ",'" & notes & "') "
        Call Common.InsertTableRow(sqlInsert)

        'save a copy as well in the global "ActivityLog" table
        Dim userFullName As String = Common.DecodeHTML(Request.Cookies("User")("FirstName")).Replace("'", "''") & " " & Common.DecodeHTML(Request.Cookies("User")("MiddleName")).Replace("'", "''") & " " & Common.DecodeHTML(Request.Cookies("User")("Surname")).Replace("'", "''")
        Dim applicationName As String = (System.Configuration.ConfigurationManager.AppSettings("Application_Title").ToString & "|" & System.Configuration.ConfigurationManager.AppSettings("Current_SChool").ToString).Replace("'", "''")
        Dim moduleName As String = "Assets and Inventory".Replace("'", "''")
        Dim subModuleName As String = "Edit Inventory".Replace("'", "''")
        Dim logSummary As String = ("Inventory was INCREASED from '" & quantity & "' to '" & newQuantity & "'.").Replace("'", "''")
        Dim assetCode As String = CType(currentRow.FindControl("hidAssetCode"), HiddenField).Value.Replace("'", "''")
        Dim logDetail As String = ("[ACTOR-VERB-OBJECT]|" & userFullName & " increased Inventory Quantity (" & assetCode & ") from '" & quantity & "' to '" & newQuantity & "'.").Replace("'", "''")
        Dim interfaceType As String = "DESKTOP WEB".Replace("'", "''")

        Dim sqlSaveLog As String = " INSERT INTO dbo.ACTIVITY_ActivityLog(Username, UserFullName, ApplicationName, ModuleName, SubModuleName, LogSummary, LogDetail, InterfaceType) "
        sqlSaveLog &= " VALUES ('" & username & "','" & userFullName & "','" & applicationName & "','" & moduleName & "','" & subModuleName & "','" & logSummary & "','" & logDetail & "','" & interfaceType & "') "
        Call Common.InsertTableRow(sqlSaveLog)

        're-bind the grid to reflect latest changes
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub btnInventoryDecrease_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'save this Decrease operation in the InventoryTransaction table
        Dim currentRow As GridViewRow = CType(sender, Button).Parent.Parent
        Dim assetRef As String = CType(currentRow.FindControl("hidAssetRef"), HiddenField).Value
        Dim quantity As String = CType(currentRow.FindControl("hidQty"), HiddenField).Value
        Dim newQuantity As String = quantity - CType(CType(currentRow.FindControl("ddlInventoryDecrease"), DropDownList).SelectedValue, Double)
        Dim username As String = Common.DecodeHTML(Request.Cookies("User")("Username")).Replace("'", "''") '& "|" & Request.ServerVariables("REMOTE_ADDR").Replace("'", "''") & "|" & Request.ServerVariables("USER_AGENT").Replace("'", "''")
        Dim newLocation As String = "NULL"
        Dim notes As String = CType(currentRow.FindControl("txtInventoryDecrease"), TextBox).Text.Replace("'", "''")

        Dim sqlInsert As String = " INSERT INTO dbo.INVENTORY_InventoryTransaction(InventoryTransactionType, InventoryTransactionRef, InventoryTransactionTimeStamp, AssetRef, Quantity, Username, Remarks, Remark2, Remark3) "
        sqlInsert &= " VALUES ('DECREASE','" & Guid.NewGuid.ToString.ToUpper & "','" & Now.ToString & "','" & assetRef & "'," & quantity & ",'" & username & "','" & newQuantity & "'," & newLocation & ",'" & notes & "') "

        Call Common.InsertTableRow(sqlInsert)

        'save a copy as well in the global "ActivityLog" table
        Dim userFullName As String = Common.DecodeHTML(Request.Cookies("User")("FirstName")).Replace("'", "''") & " " & Common.DecodeHTML(Request.Cookies("User")("MiddleName")).Replace("'", "''") & " " & Common.DecodeHTML(Request.Cookies("User")("Surname")).Replace("'", "''")
        Dim applicationName As String = (System.Configuration.ConfigurationManager.AppSettings("Application_Title").ToString & "|" & System.Configuration.ConfigurationManager.AppSettings("Current_SChool").ToString).Replace("'", "''")
        Dim moduleName As String = "Assets and Inventory".Replace("'", "''")
        Dim subModuleName As String = "Edit Inventory".Replace("'", "''")
        Dim logSummary As String = ("Inventory was DECREASED from '" & quantity & "' to '" & newQuantity & "'.").Replace("'", "''")
        Dim assetCode As String = CType(currentRow.FindControl("hidAssetCode"), HiddenField).Value.Replace("'", "''")
        Dim logDetail As String = ("[ACTOR-VERB-OBJECT]|" & userFullName & " decreased Inventory Quantity (" & assetCode & ") from '" & quantity & "' to '" & newQuantity & "'.").Replace("'", "''")
        Dim interfaceType As String = "DESKTOP WEB".Replace("'", "''")

        Dim sqlSaveLog As String = " INSERT INTO dbo.ACTIVITY_ActivityLog(Username, UserFullName, ApplicationName, ModuleName, SubModuleName, LogSummary, LogDetail, InterfaceType) "
        sqlSaveLog &= " VALUES ('" & username & "','" & userFullName & "','" & applicationName & "','" & moduleName & "','" & subModuleName & "','" & logSummary & "','" & logDetail & "','" & interfaceType & "') "
        Call Common.InsertTableRow(sqlSaveLog)

        're-bind the grid to reflect latest changes
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub btnInventoryMove_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'save this Move operation in the InventoryTransaction table
        Dim currentRow As GridViewRow = CType(sender, Button).Parent.Parent
        Dim assetRef As String = CType(currentRow.FindControl("hidAssetRef"), HiddenField).Value
        Dim quantity As String = CType(currentRow.FindControl("hidQty"), HiddenField).Value
        Dim newQuantity As String = "NULL"
        Dim username As String = Common.DecodeHTML(Request.Cookies("User")("Username")).Replace("'", "''") '& "|" & Request.ServerVariables("REMOTE_ADDR").Replace("'", "''") & "|" & Request.ServerVariables("USER_AGENT").Replace("'", "''")
        Dim ddlNewLocation As DropDownList = CType(currentRow.FindControl("ddlInventoryMove"), DropDownList)
        Dim notes As String = CType(currentRow.FindControl("txtInventoryMove"), TextBox).Text.Replace("'", "''")

        Dim sqlInsert As String = " INSERT INTO dbo.INVENTORY_InventoryTransaction(InventoryTransactionType, InventoryTransactionRef, InventoryTransactionTimeStamp, AssetRef, Quantity, Username, Remarks, Remark2, Remark3) "
        sqlInsert &= " VALUES ('RELOCATE','" & Guid.NewGuid.ToString.ToUpper & "','" & Now.ToString & "','" & assetRef & "'," & quantity & ",'" & username & "'," & newQuantity & ",'" & ddlNewLocation.SelectedValue & "','" & notes & "') "

        Call Common.InsertTableRow(sqlInsert)

        'save a copy as well in the global "ActivityLog" table
        Dim userFullName As String = Common.DecodeHTML(Request.Cookies("User")("FirstName")).Replace("'", "''") & " " & Common.DecodeHTML(Request.Cookies("User")("MiddleName")).Replace("'", "''") & " " & Common.DecodeHTML(Request.Cookies("User")("Surname")).Replace("'", "''")
        Dim applicationName As String = (System.Configuration.ConfigurationManager.AppSettings("Application_Title").ToString & "|" & System.Configuration.ConfigurationManager.AppSettings("Current_SChool").ToString).Replace("'", "''")
        Dim moduleName As String = "Assets and Inventory".Replace("'", "''")
        Dim subModuleName As String = "Edit Inventory".Replace("'", "''")
        Dim oldLocationCode As String = CType(currentRow.FindControl("hidLocationCode"), HiddenField).Value.Replace("'", "''")
        Dim logSummary As String = ("Inventory was RELOCATED from '" & oldLocationCode & "' to '" & ddlNewLocation.SelectedValue & "'.").Replace("'", "''")
        Dim assetCode As String = CType(currentRow.FindControl("hidAssetCode"), HiddenField).Value.Replace("'", "''")
        Dim logDetail As String = ("[ACTOR-VERB-OBJECT]|" & userFullName & " relocated Inventory (" & assetCode & ") from '" & GetInventoryLocationName(oldLocationCode) & "' to '" & GetInventoryLocationName(ddlNewLocation.SelectedValue) & "'.").Replace("'", "''")
        Dim interfaceType As String = "DESKTOP WEB".Replace("'", "''")

        Dim sqlSaveLog As String = " INSERT INTO dbo.ACTIVITY_ActivityLog(Username, UserFullName, ApplicationName, ModuleName, SubModuleName, LogSummary, LogDetail, InterfaceType) "
        sqlSaveLog &= " VALUES ('" & username & "','" & userFullName & "','" & applicationName & "','" & moduleName & "','" & subModuleName & "','" & logSummary & "','" & logDetail & "','" & interfaceType & "') "
        Call Common.InsertTableRow(sqlSaveLog)

        're-bind the grid to reflect latest changes
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub ddlInventoryMove_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlNewLocation As DropDownList = CType(sender, DropDownList)
        For Each item As ListItem In ddlNewLocation.Items
            'item.Attributes.Add("title", "TOOLTIP")
            item.Attributes.Add("title", GetInventoryLocationName(item.Text))
        Next
    End Sub

    Public Function GetInventoryLocationName(ByVal inventoryLocationCode As String) As String
        Dim ret As String

        ret = Common.GetTableRows("SELECT InventoryLocationName FROM dbo.INVENTORY_InventoryLocation WHERE InventoryLocationCode = '" & inventoryLocationCode & "'")(0).Item(0).ToString

        Return ret
    End Function
End Class
