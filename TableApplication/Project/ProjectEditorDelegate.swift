protocol ProjectEditorDelegate {
    func toSaveData(name : String,
                    description: String,
                    startData : String,
                    id : String)
    func showAlertFailed()
}
