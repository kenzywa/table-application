import UIKit

class TaskEditorViewController: UIViewController {
    
    var task : Task?
    var titleTextField : UITextField = {
        let firstTextField = UITextField()
        firstTextField.textAlignment = .center
        firstTextField.font = .systemFont(ofSize: 20)
        firstTextField.backgroundColor = .red
        return firstTextField
    }()
    
    var descriptionTextField : UITextField = {
        let secondTextField = UITextField()
        secondTextField.textAlignment = .center
        secondTextField.font = .systemFont(ofSize: 17)
        secondTextField.backgroundColor = .blue
        return secondTextField
    }()
    
    let idLabel : UILabel = {
        let firstLabel = UILabel()
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 13)
        firstLabel.backgroundColor = .yellow
        return firstLabel
    }()
    
    let start_dateLabel : UILabel = {
        let secondLabel = UILabel()
        secondLabel.textAlignment = .center
        secondLabel.font = .systemFont(ofSize: 20)
        secondLabel.backgroundColor = .systemGreen
        return secondLabel
    }()
    
    let finish_dateLabel : UILabel = {
        let thirdLabel = UILabel()

        thirdLabel.textAlignment = .center
        thirdLabel.font = .systemFont(ofSize: 20)
        thirdLabel.backgroundColor = .brown
        return thirdLabel
    }()
    
    var employeeLabel : UILabel = {
        let fouthLabel = UILabel()
        fouthLabel.textAlignment = .center
        fouthLabel.font = .systemFont(ofSize: 20)
        fouthLabel.backgroundColor = .cyan
        return fouthLabel
    }()
    
    var projectLabel : UILabel = {
        let fifthLabel = UILabel()
        fifthLabel.textAlignment = .center
        fifthLabel.font = .systemFont(ofSize: 20)
        fifthLabel.backgroundColor = .orange
        return fifthLabel
    }()
    
    let statusLabel : UILabel = {
        let sixthLabel = UILabel()
        sixthLabel.textAlignment = .center
        sixthLabel.font = .systemFont(ofSize: 20)
        sixthLabel.backgroundColor = .purple
        return sixthLabel
    }()
    
    let button : UIButton = {
        let firstButton = UIButton()
        firstButton.setTitle("Save", for: .normal)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.backgroundColor = .systemGreen
        return firstButton
    }()
    
    private struct Сonstants {
        static let viewTitle : String = "Tasks's Profile"
    }
    
    private struct Pudding {
        static let areaBetweenTitleAndViewOnLeft = 100
        static let areaBetweenTitleAndViewOnTop = 5
        static let areaBetweenTitleAndViewOnRight = -100
        static let heightOfTitle = 40
        static let areaBetweenDescAndTitleOnLeft = -10
        static let areaBetweenDescAndTitleOnTop = 5
        static let areaBetweenDescAndTitleOnRight = 10
        static let heightOfDesc = 20
        static let areaBetweenIdAndDescOnLeft = -50
        static let areaBetweenIdAndDescOnTop = 5
        static let areaBetweenIdAndDescOnRight = 50
        static let heightOfId = 20
        static let areaBetweenStartDataAndIdOnLeft = 30
        static let areaBetweenStartDataAndIdOnTop = 5
        static let areaBetweenStartDataAndIdOnRight = -30
        static let heightOfStartData = 20
        static let areaBetweenFinishDataAndStartDataOnLeft = 0
        static let areaBetweenFinishDataAndStartDataOnTop = 5
        static let areaBetweenFinishDataAndStartDataOnRight = 0
        static let heightOfFinishData = 20
        static let areaBetweenStatusAndFinishDataOnLeft = -10
        static let areaBetweenStatusAndFinishDataOnTop = 5
        static let areaBetweenStatusAndFinishDataOnRight = 10
        static let heightOfStatus = 30
        static let areaBetweenEmployeeAndStatusOnLeft = -10
        static let areaBetweenEmplyeeAndStatusOnTop = 5
        static let areaBetweenEmployeeAndStatusOnRight = 10
        static let heightOfEmployee = 30
        static let areaBetweenProjectAndEmployeeOnLeft = 0
        static let areaBetweenProjectAndEmployeeOnTop = 5
        static let areaBetweenProjectAndEmployeeOnRight = 0
        static let heightOfProject = 30
        static let areaBetweenButtonAndProjectOnLeft = 20
        static let areaBetweenButtonAndProjectOnTop = 25
        static let areaBetweenButtonAndProjectOnRight = -20
        static let heightOfButton = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Сonstants.viewTitle
        setupUI()
        bind(title: task?.title, description: task?.description, id: task?.id, start_date: task?.start_date,finish_date: task?.finish_date)
    }
    
    func bind(title: String?,description: String?,id: String?, start_date : Date?, finish_date : Date?) {
        titleTextField.text = title
        descriptionTextField.text = description
        idLabel.text = id
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        start_dateLabel.text = formatter.string(for: start_date)
        finish_dateLabel.text = formatter.string(for: finish_date)
    }
    
    func setupUI() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        
        titleTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(Pudding.areaBetweenTitleAndViewOnLeft)).isActive = true
        titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(Pudding.areaBetweenTitleAndViewOnTop)).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(Pudding.areaBetweenTitleAndViewOnRight)).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfTitle)).isActive = true
        
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextField)
        
        descriptionTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor, constant: CGFloat(Pudding.areaBetweenDescAndTitleOnLeft)).isActive = true
        descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: CGFloat(Pudding.areaBetweenDescAndTitleOnTop)).isActive = true
        descriptionTextField.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor, constant: CGFloat(Pudding.areaBetweenDescAndTitleOnRight)).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfDesc)).isActive = true
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)
        
        idLabel.leadingAnchor.constraint(equalTo: descriptionTextField.leadingAnchor, constant: CGFloat(Pudding.areaBetweenIdAndDescOnLeft)).isActive = true
        idLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: CGFloat(Pudding.areaBetweenIdAndDescOnTop)).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: descriptionTextField.trailingAnchor, constant: CGFloat(Pudding.areaBetweenIdAndDescOnRight)).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfId)).isActive = true
        
        start_dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(start_dateLabel)
        
        start_dateLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor, constant: CGFloat(Pudding.areaBetweenStartDataAndIdOnLeft)).isActive = true
        start_dateLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: CGFloat(Pudding.areaBetweenStartDataAndIdOnTop)).isActive = true
        start_dateLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: CGFloat(Pudding.areaBetweenStartDataAndIdOnRight)).isActive = true
        start_dateLabel.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfStartData)).isActive = true
        
        finish_dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(finish_dateLabel)
        
        finish_dateLabel.leadingAnchor.constraint(equalTo: start_dateLabel.leadingAnchor, constant: CGFloat(Pudding.areaBetweenFinishDataAndStartDataOnLeft)).isActive = true
        finish_dateLabel.topAnchor.constraint(equalTo: start_dateLabel.bottomAnchor, constant: CGFloat(Pudding.areaBetweenFinishDataAndStartDataOnTop)).isActive = true
        finish_dateLabel.trailingAnchor.constraint(equalTo: start_dateLabel.trailingAnchor, constant: CGFloat(Pudding.areaBetweenFinishDataAndStartDataOnRight)).isActive = true
        finish_dateLabel.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfFinishData)).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusLabel)
        
        statusLabel.leadingAnchor.constraint(equalTo: finish_dateLabel.leadingAnchor, constant: CGFloat(Pudding.areaBetweenStatusAndFinishDataOnLeft)).isActive = true
        statusLabel.topAnchor.constraint(equalTo: finish_dateLabel.bottomAnchor, constant: CGFloat(Pudding.areaBetweenStartDataAndIdOnTop)).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: finish_dateLabel.trailingAnchor, constant: CGFloat(Pudding.areaBetweenEmployeeAndStatusOnRight)).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfStatus)).isActive = true
        
        employeeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(employeeLabel)
        
        employeeLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: CGFloat(Pudding.areaBetweenEmployeeAndStatusOnLeft)).isActive = true
        employeeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: CGFloat(Pudding.areaBetweenEmplyeeAndStatusOnTop)).isActive = true
        employeeLabel.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: CGFloat(Pudding.areaBetweenEmployeeAndStatusOnRight)).isActive = true
        employeeLabel.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfEmployee)).isActive = true
        
        projectLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(projectLabel)
        
        projectLabel.leadingAnchor.constraint(equalTo: employeeLabel.leadingAnchor, constant: CGFloat(Pudding.areaBetweenProjectAndEmployeeOnLeft)).isActive = true
        projectLabel.topAnchor.constraint(equalTo: employeeLabel.bottomAnchor, constant: CGFloat(Pudding.areaBetweenProjectAndEmployeeOnTop)).isActive = true
        projectLabel.trailingAnchor.constraint(equalTo: employeeLabel.trailingAnchor, constant: CGFloat(Pudding.areaBetweenProjectAndEmployeeOnRight)).isActive = true
        projectLabel.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfProject)).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: projectLabel.leadingAnchor, constant: CGFloat(Pudding.areaBetweenButtonAndProjectOnLeft)).isActive = true
        button.topAnchor.constraint(equalTo: projectLabel.bottomAnchor, constant: CGFloat(Pudding.areaBetweenButtonAndProjectOnTop)).isActive = true
        button.trailingAnchor.constraint(equalTo: projectLabel.trailingAnchor, constant: CGFloat(Pudding.areaBetweenButtonAndProjectOnRight)).isActive = true
        button.heightAnchor.constraint(equalToConstant: CGFloat(Pudding.heightOfButton)).isActive = true
    }
}


