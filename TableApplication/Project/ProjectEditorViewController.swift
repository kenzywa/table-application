import UIKit

class ProjectEditorViewController: UIViewController {
    var project : Project?
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 25)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var descriptionTextField: UITextField = {
        let descTextField = UITextField()
        descTextField.textAlignment = .center
        descTextField.font = .systemFont(ofSize: 17)
        descTextField.textColor = .systemGreen
        return descTextField
    }()
    
    var start_dataLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textAlignment = .center
        dateLabel.font = .systemFont(ofSize: 20)
        dateLabel.layer.borderWidth = 2
        dateLabel.layer.cornerRadius = 8
        return dateLabel
    }()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 8
        return label
    }()
    
    let buttonToSave: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    private struct Сonstants {
        static let viewTitle : String = "Project's Profile"
    }
    
    private struct Padding {
        static let areaBetweenNameAndViewOnLeft = 100
        static let areaBetweenNameAndViewOnTop = 5
        static let areaBetweenNameAndViewOnRight = -100
        static let hieghtOfName = 40
        static let areaBetweenDescAndViewOnLeft = 40
        static let areaBetweenDescAndNameonTop = 2
        static let areaBetweenDescAndViewOnRight = -40
        static let heightOfDesc = 20
        static let areaBetweenIdAndDescOnLeft = 10
        static let areaBetweenIdAndDescOnTop = 5
        static let areaBetweenIdAndDescOnRight = -10
        static let heightOfId = 20
        static let areaBetweenDataAndIdOtTop = 5
        static let areaBetweenButtonAndDataOnLeft = 60
        static let areaBetweenButtonAndDataOnTop = 20
        static let areaBetweenButtonAndDataOnRight = -60
        static let heightOfButton = 70
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Сonstants.viewTitle
        setupUI()
        bind(projectName: project?.name, description: project?.desсription, id: project?.id, start_data: project?.start_data)
    }
    
    func bind(projectName: String?,description: String?,id: String?,start_data: String?) {
        nameTextField.text = projectName
        descriptionTextField.text = description
        idLabel.text = id
        start_dataLabel.text = start_data
    }
    
    func setupUI() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(Padding.areaBetweenNameAndViewOnLeft)).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(Padding.areaBetweenNameAndViewOnTop)).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(Padding.areaBetweenNameAndViewOnRight)).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(Padding.hieghtOfName)).isActive = true
        
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextField)
        
        descriptionTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(Padding.areaBetweenDescAndViewOnLeft)).isActive = true
        descriptionTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: CGFloat(Padding.areaBetweenDescAndNameonTop)).isActive = true
        descriptionTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(Padding.areaBetweenDescAndViewOnRight)).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfDesc)).isActive = true
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)

        idLabel.leadingAnchor.constraint(equalTo: descriptionTextField.leadingAnchor, constant: CGFloat(Padding.areaBetweenIdAndDescOnLeft)).isActive = true
        idLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: CGFloat(Padding.areaBetweenIdAndDescOnTop)).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: descriptionTextField.trailingAnchor, constant: CGFloat(Padding.areaBetweenIdAndDescOnRight)).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfId)).isActive = true

        start_dataLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(start_dataLabel)
       
        start_dataLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor).isActive = true
        start_dataLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: CGFloat(Padding.areaBetweenDataAndIdOtTop)).isActive = true
        start_dataLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor).isActive = true
        
        buttonToSave.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonToSave)
      
        buttonToSave.leadingAnchor.constraint(equalTo: start_dataLabel.leadingAnchor, constant: CGFloat(Padding.areaBetweenButtonAndDataOnLeft)).isActive = true
        buttonToSave.topAnchor.constraint(equalTo: start_dataLabel.bottomAnchor,constant: CGFloat(Padding.areaBetweenButtonAndDataOnTop)).isActive = true
        buttonToSave.trailingAnchor.constraint(equalTo: start_dataLabel.trailingAnchor, constant: CGFloat(Padding.areaBetweenButtonAndDataOnRight)).isActive = true
        buttonToSave.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfButton)).isActive = true
}
    
    @objc private func didTapSaveButton() {
        bind(projectName: "vasya", description: "pety", id: "", start_data: "")
    }
}
