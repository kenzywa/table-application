import UIKit

class TaskEditorViewController: UIViewController {
    var task : Task?
    var titleTextField : UITextField = {
        let firstTextField = UITextField()
        firstTextField.textAlignment = .left
        firstTextField.font = .systemFont(ofSize: 20)
        return firstTextField
    }()
    
    var descriptionTextField : UITextField = {
        let secondTextField = UITextField()
        secondTextField.textAlignment = .left
        secondTextField.font = .systemFont(ofSize: 20)
        return secondTextField
    }()
    
    let idLabel : UILabel = {
        let firstLabel = UILabel()
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 20)
        return firstLabel
    }()
    
    let start_dateLabel : UILabel = {
        let secondLabel = UILabel()
        secondLabel.textAlignment = .center
        secondLabel.font = .systemFont(ofSize: 20)
        return secondLabel
    }()
    
    let finish_dateLabel : UILabel = {
        let thirdLabel = UILabel()
        thirdLabel.textAlignment = .center
        thirdLabel.font = .systemFont(ofSize: 20)
        return thirdLabel
    }()
    
    var employeeLabel : UILabel = {
        let fouthLabel = UILabel()
        fouthLabel.textAlignment = .center
        fouthLabel.font = .systemFont(ofSize: 20)
        return fouthLabel
    }()
    
    private struct Сonstants {
        static let viewTitle : String = "Tasks's Profile"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Сonstants.viewTitle
    }
}

