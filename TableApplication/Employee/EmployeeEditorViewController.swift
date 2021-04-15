import UIKit

class EmployeeEditorViewController: UIViewController {
    private var delegate : EmployeeEditorDelegate?
    
    init(delegate: EmployeeEditorDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nameTextField: UITextField = {
        let firstTextField = UITextField()
        firstTextField.textAlignment = .center
        firstTextField.font = .systemFont(ofSize: 20)
        return firstTextField
    }()
    
    var surnameTextField: UITextField = {
        let secondTextField = UITextField()
        secondTextField.textAlignment = .center
        secondTextField.font = .systemFont(ofSize: 20)
        return secondTextField
    }()
        
    var professionTextField: UITextField = {
        let profTextField = UITextField()
        profTextField.textAlignment = .center
        profTextField.font = .systemFont(ofSize: 20)
        profTextField.layer.borderWidth = 2
        profTextField.layer.cornerRadius = 8
        return profTextField
    }()
    
    var numberPhoneTextField: UITextField = {
        let numberTextField = UITextField()
        numberTextField.textAlignment = .center
        numberTextField.font = .systemFont(ofSize: 20)
        numberTextField.layer.borderWidth = 2
        numberTextField.layer.cornerRadius = 8
        return numberTextField
    }()
    
    let ageLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 25)
        firstLabel.layer.borderWidth = 2
        firstLabel.layer.cornerRadius = 8
        return firstLabel
    }()
    
    let maleLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.font = .systemFont(ofSize: 20)
        secondLabel.textAlignment = .center
        secondLabel.layer.borderWidth = 2
        secondLabel.layer.cornerRadius = 8
        return secondLabel
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
    var employee : Employee?
    
    private struct Сonstants {
        static let viewTitle : String = "Employee's Profile"
    }
    
    private struct Padding {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Сonstants.viewTitle
        setupUI()
        bind(name: employee?.name, surname: employee?.surname, profession: employee?.profession, age: String(employee!.age), male: employee?.male, numberPhone: String(employee!.numberPhone))
    }
    
    func bind(name: String?, surname: String?,profession: String?,age : String?, male: String?, numberPhone: String?) {
        nameTextField.text = name
        surnameTextField.text = surname
        professionTextField.text = profession
        ageLabel.text = age
        maleLabel.text = male
        numberPhoneTextField.text = numberPhone
        
    }
    
    func setupUI() {
        self.view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        
        self.view.addSubview(surnameTextField)
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        surnameTextField.rightAnchor.constraint(equalTo: nameTextField.leftAnchor, constant: -20).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        self.view.addSubview(professionTextField)
        professionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        professionTextField.topAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 30).isActive = true
        professionTextField.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: -100).isActive = true
        professionTextField.rightAnchor.constraint(equalTo: surnameTextField.rightAnchor).isActive = true
        professionTextField.bottomAnchor.constraint(equalTo: professionTextField.topAnchor, constant: 30).isActive = true
        
        self.view.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
    
        ageLabel.topAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 65).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: -100).isActive = true
        ageLabel.rightAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: -25).isActive = true
        ageLabel.bottomAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 120).isActive = true
        
        self.view.addSubview(maleLabel)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        maleLabel.topAnchor.constraint(equalTo: ageLabel.topAnchor).isActive = true
        maleLabel.leftAnchor.constraint(equalTo: ageLabel.rightAnchor, constant: 15).isActive = true
        maleLabel.rightAnchor.constraint(equalTo: professionTextField.rightAnchor).isActive = true
        maleLabel.bottomAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 120).isActive = true
        
        self.view.addSubview(numberPhoneTextField)
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneTextField.topAnchor.constraint(equalTo: professionTextField.topAnchor).isActive = true
        numberPhoneTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        numberPhoneTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: 70).isActive = true
        numberPhoneTextField.bottomAnchor.constraint(equalTo: professionTextField.bottomAnchor).isActive = true
        
        self.view.addSubview(buttonToSave)
        buttonToSave.translatesAutoresizingMaskIntoConstraints = false
        
        buttonToSave.topAnchor.constraint(equalTo: maleLabel.bottomAnchor,constant: 10).isActive = true
        buttonToSave.bottomAnchor.constraint(equalTo: buttonToSave.topAnchor, constant: 40).isActive = true
        buttonToSave.leftAnchor.constraint(equalTo: numberPhoneTextField.leftAnchor).isActive = true
        buttonToSave.rightAnchor.constraint(equalTo: numberPhoneTextField.rightAnchor).isActive = true
    }
  
    @objc private func didTapSaveButton() {
            guard let name = nameTextField.text,
                  let surname = surnameTextField.text,
                  let numberPhone = numberPhoneTextField.text,
                  let id = employee?.id,
                  let profession = professionTextField.text else {
                delegate?.showAlertFailed()
                return
            }
        delegate?.toSaveData(name: name,surname: surname, profession: profession, numberPhone: numberPhone, id : id)
        navigationController?.popViewController(animated: true)
    }
}

