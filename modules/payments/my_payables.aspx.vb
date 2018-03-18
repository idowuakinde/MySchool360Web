
Partial Class modules_payments_my_payables
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow And gvUsers.EditIndex = e.Row.RowIndex Then
            Dim lstPayables As ListBox = CType(e.Row.FindControl("lstPayableEdit"), ListBox)
            Dim payablesArray As String()
            Dim payable As String = Common.GetTableRows(" SELECT PayableShortName FROM dbo.PAYMENT_StudentPayable WHERE StudentPayableId = '" & CType(gvUsers.DataKeys.Item(e.Row.RowIndex).Value, Int32) & "' ")(0).Item(0).ToString

            If payable.Contains("|") Then
                'split into array
                payablesArray = payable.Split("|")
                'rearrange listitems by arranging the pre-selected items at the top of the list, then additional ones below...
                For j As Int32 = LBound(payablesArray) To UBound(payablesArray)
                    lstPayables.Items.Remove(payablesArray(j))
                    lstPayables.Items.Insert(0 + j, payablesArray(j))
                Next
            ElseIf payable = "" Then
                'do nothing
            Else
                'do not split into array
                'place pre-selected item at the top of the list, then additional ones below...
                lstPayables.Items.Remove(payable)
                lstPayables.Items.Insert(0, payable)
            End If
        End If
    End Sub

    Protected Sub gvUsers_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvUsers.RowUpdating
        'loop through the items in the ListBox control and determine which were selected...
        Dim lstPayables As ListBox = CType(CType(sender, GridView).Rows(e.RowIndex).FindControl("lstPayableEdit"), ListBox)
        Dim strPayables As String = ""

        Select Case lstPayables.Items.Count
            Case 0
                strPayables = ""
            Case Else
                For i As Int32 = 0 To lstPayables.Items.Count - 1
                    strPayables &= lstPayables.Items(i).ToString & "|"
                Next
                If strPayables.Length > 0 Then strPayables = Left(strPayables, strPayables.Length - 1) 'remove the trailing comma
        End Select

        Session(Common.SESSION_PAYMENTS_SELECTEDPAYABLES) = strPayables
    End Sub

    Protected Sub dsSqlPayables_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlPayables.Inserting
        'loop through the items in the ListBox control and determine which were selected...
        Dim lstPayables As ListBox = CType(Me.DetailsView1.FindControl("lstPayableInsert"), ListBox)
        Dim strPayables As String = ""

        Select Case lstPayables.Items.Count
            Case 0
                strPayables = ""
            Case Else
                For i As Int32 = 0 To lstPayables.Items.Count - 1
                    strPayables &= lstPayables.Items(i).ToString & "|"
                Next
                If strPayables.Length > 0 Then strPayables = Left(strPayables, strPayables.Length - 1) 'remove the trailing comma
        End Select

        e.Command.Parameters("@PayableShortName").Value = strPayables
    End Sub

    Protected Sub dsSqlPayables_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlPayables.Updating
        Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        cmdParams.Item("@PayableShortName").Value = Session(Common.SESSION_PAYMENTS_SELECTEDPAYABLES)
        Session.Remove(Common.SESSION_PAYMENTS_SELECTEDPAYABLES)
    End Sub

    Public Sub MoveListBoxItem(ByRef listbox As ListBox, ByVal direction As Int32)
        'check that something is selected...
        If listbox.SelectedIndex < 0 Then
            'do nothing - no selected item
        Else
            'calculate new index using move direction
            Dim newIndex As Int32 = listbox.SelectedIndex + direction

            'verify that the new position will be valid given the current range of ListItems
            If newIndex < 0 Or newIndex >= listbox.Items.Count Then
                'do nothing - Index out of Range
            Else
                Dim selectedItem As ListItem = listbox.SelectedItem
                'remove removable item
                listbox.Items.Remove(selectedItem)
                'insert in new position
                listbox.Items.Insert(newIndex, selectedItem)
                'restore selection
                listbox.SelectedIndex = newIndex
            End If
        End If
    End Sub

    Protected Sub imgbtnUpInsert_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        'MoveUp was clicked, so supply a negative value for "direction" when calling MoveListBoxItem...
        MoveListBoxItem(CType(Me.DetailsView1.FindControl("lstPayableInsert"), ListBox), -1)
    End Sub

    Protected Sub imgbtnDownInsert_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        'MoveDown was clicked, so supply a positive value for "direction" when calling MoveListBoxItem...
        MoveListBoxItem(CType(Me.DetailsView1.FindControl("lstPayableInsert"), ListBox), 1)
    End Sub

    Protected Sub imgbtnUpEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        'MoveUp was clicked, so supply a negative value for "direction" when calling MoveListBoxItem...
        MoveListBoxItem(CType(Me.gvUsers.Rows(Me.gvUsers.EditIndex).FindControl("lstPayableEdit"), ListBox), -1)
    End Sub

    Protected Sub imgbtnDownEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        'MoveDown was clicked, so supply a positive value for "direction" when calling MoveListBoxItem...
        MoveListBoxItem(CType(Me.gvUsers.Rows(Me.gvUsers.EditIndex).FindControl("lstPayableEdit"), ListBox), 1)
    End Sub
End Class
