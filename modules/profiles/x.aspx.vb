
Partial Class modules_profiles_x
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ''get the rowcollection
        'Dim rows As System.Data.DataRowCollection = Common.GetTableRows("SELECT * FROM dbo.TEMPCustomers")
        'Dim password As String = "", sqlForUpdate As String = ""

        ''loop the collection, and for each item, update its password to a fresh value from the random_password function
        'For i As Int32 = 0 To rows.Count - 1
        '    password = Common.GenerateRandomPassword(5)
        '    sqlForUpdate = "UPDATE dbo.TEMPCustomers SET [Password] = '" & password & "' WHERE CustomerCode = '" & rows(i).Item("CustomerCode").ToString & "' "
        '    Call Common.UpdateTableRow(sqlForUpdate)
        '    Response.Write("Updated '" & rows(i).Item("CustomerCode").ToString & "' with '" & password & "'<br />")
        'Next
        'Response.Write("All done.") : Response.End()
    End Sub
End Class
