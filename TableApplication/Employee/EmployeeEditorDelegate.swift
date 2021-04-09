protocol EmployeeEditorDelegate {
    func toSaveData(name : String,
                    surname: String,
                    profession : String,
                    numberPhone : String,
                    id : String)
    func showAlertFailed()
}
