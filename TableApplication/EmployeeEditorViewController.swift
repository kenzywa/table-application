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
    
    var nameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
    var surnameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 130, height: 25))
    var professionTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
    let ageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let maleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    var numberPhoneTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 25))
    let buttonToSave = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    var employee : Employee?
    
    private struct constants {
        static let viewTitle : String = "Employee's Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = constants.viewTitle
        setupUI()
    }
    
    func setupUI() {
        nameTextField.text = employee?.name
        nameTextField.center = CGPoint(x: 250,y: 105)
        nameTextField.textAlignment = .center
        nameTextField.font = nameTextField.font?.withSize(20)
        self.view.addSubview(nameTextField)
        
        surnameTextField.text = employee?.surname
        surnameTextField.center = CGPoint(x: 130,y: 105)
        surnameTextField.textAlignment = .center
        surnameTextField.font = surnameTextField.font?.withSize(20)
        self.view.addSubview(surnameTextField)
        
        professionTextField.text = employee?.profession
        professionTextField.center = CGPoint(x: 103,y: 140)
        professionTextField.textAlignment = .center
        professionTextField.font = professionTextField.font?.withSize(20)
        professionTextField.layer.borderWidth = 2
        professionTextField.layer.cornerRadius = 8
        self.view.addSubview(professionTextField)
        
        ageLabel.text = String(employee!.age)
        ageLabel.center = CGPoint(x: 30,y: 185)
        ageLabel.textAlignment = .center
        ageLabel.font = ageLabel.font.withSize(20)
        ageLabel.layer.borderWidth = 2
        ageLabel.layer.cornerRadius = 8
        self.view.addSubview(ageLabel)
        
        maleLabel.text =  employee?.male
        maleLabel.center = CGPoint(x: 90,y: 185)
        maleLabel.textAlignment = .center
        maleLabel.layer.borderWidth = 2
        maleLabel.layer.cornerRadius = 8
        self.view.addSubview(maleLabel)
        
        numberPhoneTextField.text = ("+") + String(employee!.numberPhone)
        numberPhoneTextField.center = CGPoint(x: 290,y: 140)
        numberPhoneTextField.textAlignment = .center
        numberPhoneTextField.font = numberPhoneTextField.font?.withSize(20)
        numberPhoneTextField.layer.borderWidth = 2
        numberPhoneTextField.layer.cornerRadius = 8
        self.view.addSubview(numberPhoneTextField)
        
        buttonToSave.center = CGPoint(x: 310, y: 235)
        buttonToSave.setTitle("Save", for: .normal)
        buttonToSave.layer.borderWidth = 2
        buttonToSave.layer.cornerRadius = 8
        buttonToSave.backgroundColor = .systemGreen
        buttonToSave.setTitleColor(.black, for: .normal)
        buttonToSave.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        self.view.addSubview(buttonToSave)
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

