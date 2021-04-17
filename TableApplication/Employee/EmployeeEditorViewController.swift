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
        firstTextField.textAlignment = .left
        firstTextField.font = .systemFont(ofSize: 20)
        return firstTextField
    }()
    
    var surnameTextField: UITextField = {
        let secondTextField = UITextField()
        secondTextField.textAlignment = .right
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
        firstLabel.font = .systemFont(ofSize: 20)
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
        static let areaBetweenNameAndViewOnLeft = 200
        static let areaBetweenNameAndViewOnTop = 5
        static let areaBetweenNameAndViewOnRight = -50
        static let heightOfName = 30
        static let areaBetweenSurnameAndViewOnLeft = 50
        static let areaBetweenSurnameAndViewOnTop = 5
        static let areaBetweenSurnameAndViewOnRight = -250
        static let heightOfSurname = 30
        static let areaBetweenProfessionAndSurnameOnLeft = -30
        static let areaBetweenProfessionAndSurnameOnTop = 5
        static let heightOfProfession = 30
        static let areaBetweenAgeAndProfessionOnTop = 5
        static let areaBetweenAgeAndProfessionOnRight = -80
        static let heightOfAge = 30
        static let areaBetweenMaleAndAgeOnLeft = 5
        static let heightOfMale = 30
        static let heightOfNumber = 30
        static let areaBetweenMaleAndButtonOnTop = 15
        static let areaBetweenMaleAndButtonOnRight = 120
        static let heightOfButton = 50
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
        
        nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(Padding.areaBetweenNameAndViewOnLeft)).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(Padding.areaBetweenNameAndViewOnTop)).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(Padding.areaBetweenNameAndViewOnRight)).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfName)).isActive = true
        
        self.view.addSubview(surnameTextField)
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        surnameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: CGFloat(Padding.areaBetweenSurnameAndViewOnLeft) ).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(Padding.areaBetweenSurnameAndViewOnTop)).isActive = true
        surnameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: CGFloat(Padding.areaBetweenSurnameAndViewOnRight)).isActive = true
        surnameTextField.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfSurname)).isActive = true
        
        nameTextField.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        self.view.addSubview(professionTextField)
        professionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        professionTextField.leadingAnchor.constraint(equalTo: surnameTextField.leadingAnchor, constant: CGFloat(Padding.areaBetweenProfessionAndSurnameOnLeft)).isActive = true
        professionTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: CGFloat(Padding.areaBetweenProfessionAndSurnameOnTop)).isActive = true
        professionTextField.trailingAnchor.constraint(equalTo: surnameTextField.trailingAnchor).isActive = true
        professionTextField.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfProfession)).isActive = true
        
        self.view.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
    
        ageLabel.leadingAnchor.constraint(equalTo: professionTextField.leadingAnchor).isActive = true
        ageLabel.topAnchor.constraint(equalTo: professionTextField.bottomAnchor, constant: CGFloat(Padding.areaBetweenAgeAndProfessionOnTop)).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo: professionTextField.trailingAnchor, constant: CGFloat(Padding.areaBetweenAgeAndProfessionOnRight)).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfAge)).isActive = true
        
        self.view.addSubview(maleLabel)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        maleLabel.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: CGFloat(Padding.areaBetweenMaleAndAgeOnLeft)).isActive = true
        maleLabel.topAnchor.constraint(equalTo: ageLabel.topAnchor).isActive = true
        maleLabel.trailingAnchor.constraint(equalTo: professionTextField.trailingAnchor).isActive = true
        maleLabel.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfMale)).isActive = true
        
        self.view.addSubview(numberPhoneTextField)
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        numberPhoneTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        numberPhoneTextField.topAnchor.constraint(equalTo: professionTextField.topAnchor).isActive = true
        numberPhoneTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        numberPhoneTextField.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfNumber)).isActive = true
        
        self.view.addSubview(buttonToSave)
        buttonToSave.translatesAutoresizingMaskIntoConstraints = false
        
        buttonToSave.leadingAnchor.constraint(equalTo: maleLabel.leadingAnchor).isActive = true
        buttonToSave.topAnchor.constraint(equalTo: maleLabel.bottomAnchor,constant: CGFloat(Padding.areaBetweenMaleAndButtonOnTop)).isActive = true
        buttonToSave.trailingAnchor.constraint(equalTo: maleLabel.trailingAnchor, constant: CGFloat(Padding.areaBetweenMaleAndButtonOnRight)).isActive = true
        buttonToSave.heightAnchor.constraint(equalToConstant: CGFloat(Padding.heightOfButton)).isActive = true
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

