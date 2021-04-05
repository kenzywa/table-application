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
    
    private struct constants {
        static let viewTitle : String = "Employee's Profile"
    }
    
    private struct innerPadding {
        static let topSpaceBewteenTopOfViewAndName : Int = 100
        static let spaceBetweenRightOfViewAndName : Int = -150
        static let spaceBetweenBottomOfViewAndName : Int = 130
        static let spaceBetweenNameAndSurname : Int = -20
        static let topSpaceBetweenProfessionAndSurname : Int = 30
        static let leftSpaceBetweenProfessionAndSurname : Int = -100
        static let heightOfProfession : Int = 30
        static let topSpaceBetweenAgeAndSurname : Int = 65
        static let leftSpaceBetweenAgeAndSurname : Int = -100
        static let rightSpaceBetweenAgeAndSurname : Int = -25
        static let bottomSpaceBetweenAgeAndSurname : Int = 120
        static let leftSpaceBetweenMaleAndAge : Int = 15
        static let bottomSpaceBetweenMaleAndSurname : Int = 120
        static let rightSpaceBetweenNumberAndName : Int = 90
        static let topSpaceBetweenButtonAndMale : Int = 10
        static let heightOfButton : Int = 40
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = constants.viewTitle
        setupUI()
        contentView()
    }
    func contentView() {
        nameTextField.text = employee?.name
        surnameTextField.text = employee?.surname
        professionTextField.text = employee?.profession
        ageLabel.text = String(employee!.age)
        maleLabel.text =  employee?.male
        numberPhoneTextField.text = String(employee!.numberPhone)
    }
    func setupUI() {
        self.view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(innerPadding.topSpaceBewteenTopOfViewAndName)).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat(innerPadding.spaceBetweenRightOfViewAndName)).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(innerPadding.spaceBetweenBottomOfViewAndName)).isActive = true
        
        nameTextField.textAlignment = .center
        nameTextField.font = UIFont(name: "San-Francisco", size: 25)
        
        self.view.addSubview(surnameTextField)
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.rightAnchor.constraint(equalTo: nameTextField.leftAnchor, constant: CGFloat(innerPadding.spaceBetweenNameAndSurname)).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor).isActive = true
        surnameTextField.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        surnameTextField.textAlignment = .center
        surnameTextField.font = UIFont(name: "San-Francisco", size: 25)
        
        self.view.addSubview(professionTextField)
        professionTextField.translatesAutoresizingMaskIntoConstraints = false
        professionTextField.topAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: CGFloat(innerPadding.topSpaceBetweenProfessionAndSurname)).isActive = true
        professionTextField.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: CGFloat(innerPadding.leftSpaceBetweenProfessionAndSurname)).isActive = true
        professionTextField.rightAnchor.constraint(equalTo: surnameTextField.rightAnchor).isActive = true
        professionTextField.bottomAnchor.constraint(equalTo: professionTextField.topAnchor, constant: CGFloat(innerPadding.heightOfProfession)).isActive = true
        
        professionTextField.textAlignment = .center
        professionTextField.font = UIFont(name: "San-Francisco", size: 25)
        professionTextField.layer.borderWidth = 2
        professionTextField.layer.cornerRadius = 8
        
        self.view.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.topAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: CGFloat(innerPadding.topSpaceBetweenAgeAndSurname)).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: CGFloat(innerPadding.leftSpaceBetweenAgeAndSurname)).isActive = true
        ageLabel.rightAnchor.constraint(equalTo: surnameTextField.leftAnchor, constant: CGFloat(innerPadding.rightSpaceBetweenAgeAndSurname)).isActive = true
        ageLabel.bottomAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: CGFloat(innerPadding.bottomSpaceBetweenAgeAndSurname)).isActive = true
        
        ageLabel.textAlignment = .center
        ageLabel.font = UIFont(name: "San-Francisco", size: 25)
        ageLabel.layer.borderWidth = 2
        ageLabel.layer.cornerRadius = 8
       
        self.view.addSubview(maleLabel)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        maleLabel.topAnchor.constraint(equalTo: ageLabel.topAnchor).isActive = true
        maleLabel.leftAnchor.constraint(equalTo: ageLabel.rightAnchor, constant: CGFloat(innerPadding.leftSpaceBetweenMaleAndAge)).isActive = true
        maleLabel.rightAnchor.constraint(equalTo: professionTextField.rightAnchor).isActive = true
        maleLabel.bottomAnchor.constraint(equalTo: surnameTextField.topAnchor, constant: CGFloat(innerPadding.bottomSpaceBetweenAgeAndSurname)).isActive = true
        
        maleLabel.textAlignment = .center
        maleLabel.font = UIFont(name: "San-Francisco", size: 25)
        maleLabel.layer.borderWidth = 2
        maleLabel.layer.cornerRadius = 8
        
        
        self.view.addSubview(numberPhoneTextField)
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneTextField.topAnchor.constraint(equalTo: professionTextField.topAnchor).isActive = true
        numberPhoneTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        numberPhoneTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: CGFloat(innerPadding.rightSpaceBetweenNumberAndName)).isActive = true
        numberPhoneTextField.bottomAnchor.constraint(equalTo: professionTextField.bottomAnchor).isActive = true
        
        numberPhoneTextField.textAlignment = .center
        numberPhoneTextField.font = UIFont(name: "San-Francisco", size: 20)
        numberPhoneTextField.layer.borderWidth = 2
        numberPhoneTextField.layer.cornerRadius = 8
        
        self.view.addSubview(buttonToSave)
        buttonToSave.translatesAutoresizingMaskIntoConstraints = false
        buttonToSave.topAnchor.constraint(equalTo: maleLabel.bottomAnchor,constant: CGFloat(innerPadding.topSpaceBetweenButtonAndMale)).isActive = true
        buttonToSave.bottomAnchor.constraint(equalTo: buttonToSave.topAnchor, constant: CGFloat(innerPadding.heightOfButton)).isActive = true
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

