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
    
    var nameTextField = UITextField()
    var surnameTextField = UITextField()
    var professionTextField = UITextField()
    let ageLabel = UILabel()
    let maleLabel = UILabel()
    var numberPhoneTextField = UITextField()
    let buttonToSave = UIButton()
    var employee : Employee?
    
    private struct Сonstants {
        static let viewTitle : String = "Employee's Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Сonstants.viewTitle
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.text = employee?.name
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        
        nameTextField.textAlignment = .center
        nameTextField.font = UIFont(name: "San Francisco", size: 25)
        
        self.view.addSubview(surnameTextField)
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.text = employee?.surname
        surnameTextField.rightAnchor.constraint(equalTo: nameTextField.leftAnchor, constant: -20).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        surnameTextField.textAlignment = .center
        surnameTextField.font = UIFont(name: "San Francisco", size: 25)
        
        self.view.addSubview(professionTextField)
        professionTextField.translatesAutoresizingMaskIntoConstraints = false
        professionTextField.text = employee?.profession
        professionTextField.topAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 30).isActive = true
        professionTextField.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: -100).isActive = true
        professionTextField.rightAnchor.constraint(equalTo: surnameTextField.rightAnchor).isActive = true
        professionTextField.bottomAnchor.constraint(equalTo: professionTextField.topAnchor, constant: 30).isActive = true
        
        professionTextField.textAlignment = .center
        professionTextField.font = UIFont(name: "San Francisco", size: 25)
        professionTextField.layer.borderWidth = 2
        professionTextField.layer.cornerRadius = 8
        
        self.view.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = String(employee!.age)
        ageLabel.topAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 65).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: -100).isActive = true
        ageLabel.rightAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: -25).isActive = true
        ageLabel.bottomAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 120).isActive = true
        
        ageLabel.textAlignment = .center
        ageLabel.font = UIFont(name: "San Francisco", size: 25)
        ageLabel.layer.borderWidth = 2
        ageLabel.layer.cornerRadius = 8
       
        self.view.addSubview(maleLabel)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        maleLabel.text =  employee?.male
        maleLabel.topAnchor.constraint(equalTo: ageLabel.topAnchor).isActive = true
        maleLabel.leftAnchor.constraint(equalTo: ageLabel.rightAnchor, constant: 15).isActive = true
        maleLabel.rightAnchor.constraint(equalTo: professionTextField.rightAnchor).isActive = true
        maleLabel.bottomAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: 120).isActive = true
        
        maleLabel.font = UIFont(name: "San Francisco", size: 25)
        maleLabel.textAlignment = .center
        maleLabel.layer.borderWidth = 2
        maleLabel.layer.cornerRadius = 8
        
        self.view.addSubview(numberPhoneTextField)
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneTextField.text = String(employee!.numberPhone)
        numberPhoneTextField.topAnchor.constraint(equalTo: professionTextField.topAnchor).isActive = true
        numberPhoneTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        numberPhoneTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: 70).isActive = true
        numberPhoneTextField.bottomAnchor.constraint(equalTo: professionTextField.bottomAnchor).isActive = true
        
        numberPhoneTextField.textAlignment = .center
        numberPhoneTextField.font = UIFont(name: "San Francisco", size: 25)
        numberPhoneTextField.layer.borderWidth = 2
        numberPhoneTextField.layer.cornerRadius = 8
        
        self.view.addSubview(buttonToSave)
        buttonToSave.translatesAutoresizingMaskIntoConstraints = false
        buttonToSave.topAnchor.constraint(equalTo: maleLabel.bottomAnchor,constant: 10).isActive = true
        buttonToSave.bottomAnchor.constraint(equalTo: buttonToSave.topAnchor, constant: 40).isActive = true
        buttonToSave.leftAnchor.constraint(equalTo: numberPhoneTextField.leftAnchor).isActive = true
        buttonToSave.rightAnchor.constraint(equalTo: numberPhoneTextField.rightAnchor).isActive = true
        
        buttonToSave.setTitle("Save", for: .normal)
        buttonToSave.layer.borderWidth = 2
        buttonToSave.layer.cornerRadius = 8
        buttonToSave.backgroundColor = .systemGreen
        buttonToSave.setTitleColor(.black, for: .normal)
        buttonToSave.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
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

