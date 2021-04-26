import UIKit

class TaskEditorViewController: UIViewController {
    var task : Task?
    var titleTextField : UITextField = {
        let firstTextField = UITextField()
        firstTextField.text = "Eliminate database"
        firstTextField.textAlignment = .left
        firstTextField.font = .systemFont(ofSize: 20)
        return firstTextField
    }()
    
    var descriptionTextField : UITextField = {
        let secondTextField = UITextField()
        secondTextField.text = "Delete databases"
        secondTextField.textAlignment = .left
        secondTextField.font = .systemFont(ofSize: 20)
        return secondTextField
    }()
    
    let idLabel : UILabel = {
        let firstLabel = UILabel()
        firstLabel.text = "111111"
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 20)
        return firstLabel
    }()
    
    let start_dateLabel : UILabel = {
        let secondLabel = UILabel()
        secondLabel.text = "25.04.2021"
        secondLabel.textAlignment = .center
        secondLabel.font = .systemFont(ofSize: 20)
        return secondLabel
    }()
    
    let finish_dateLabel : UILabel = {
        let thirdLabel = UILabel()
        thirdLabel.text = "31.04.2021"
        thirdLabel.textAlignment = .center
        thirdLabel.font = .systemFont(ofSize: 20)
        return thirdLabel
    }()
    
    var employeeTextField : UITextField = {
        let fouthTextField = UITextField()
        fouthTextField.text = "Shukailo Roman"
        fouthTextField.textAlignment = .center
        fouthTextField.font = .systemFont(ofSize: 20)
        return fouthTextField
    }()
    
    var projectTextField : UITextField = {
        let fifthTextField = UITextField()
        fifthTextField.text = "Dragon"
        fifthTextField.textAlignment = .center
        fifthTextField.font = .systemFont(ofSize: 20)
        return fifthTextField
    }()
    
    let statusLabel : UILabel = {
        let fouthLabel = UILabel()
        fouthLabel.text = "To Do"
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
