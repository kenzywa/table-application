import UIKit

class TaskEditorViewController: UIViewController {
    //var task : Task?
    
    private struct Сonstants {
        static let viewTitle : String = "Employee's Profile"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Сonstants.viewTitle
}
}
