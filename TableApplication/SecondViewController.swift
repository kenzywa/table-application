import UIKit

class SecondViewController: UIViewController {
    
    var nameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
    var surnameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 80, height: 25))
    var professionTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
    let ageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let maleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    var numberPhoneTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 25))
    let buttonToSave = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    var employee : Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Your Profile"
        
    //MARK: - UI
        nameTextField.center = CGPoint(x: 230,y: 105)
        nameTextField.textAlignment = .center
        nameTextField.font = nameTextField.font?.withSize(20)
        nameTextField.text = employee?.name
        self.view.addSubview(nameTextField)
        
        surnameTextField.center = CGPoint(x: 150,y: 105)
        surnameTextField.textAlignment = .center
        surnameTextField.font = surnameTextField.font?.withSize(20)
        surnameTextField.text = employee?.surname
        self.view.addSubview(surnameTextField)
        
        
        professionTextField.center = CGPoint(x: 103,y: 140)
        professionTextField.textAlignment = .center
        professionTextField.font = professionTextField.font?.withSize(20)
        professionTextField.text = employee?.profession
        //professionLabel.backgroundColor = .systemGray
        professionTextField.layer.borderWidth = 2
        professionTextField.layer.cornerRadius = 8
        self.view.addSubview(professionTextField)
        
        ageLabel.center = CGPoint(x: 30,y: 185)
        ageLabel.textAlignment = .center
        ageLabel.font = ageLabel.font.withSize(20)
        ageLabel.text = employee?.age
        //ageLabel.backgroundColor = .systemGray
        ageLabel.layer.borderWidth = 2
        ageLabel.layer.cornerRadius = 8
        self.view.addSubview(ageLabel)
        
        maleLabel.center = CGPoint(x: 90,y: 185)
        maleLabel.textAlignment = .center
        maleLabel.text =  employee?.male
        //maleLabel.backgroundColor = .systemGray
        maleLabel.layer.borderWidth = 2
        maleLabel.layer.cornerRadius = 8
        self.view.addSubview(maleLabel)
        
        numberPhoneTextField.center = CGPoint(x: 290,y: 140)
        numberPhoneTextField.textAlignment = .center
        numberPhoneTextField.font = numberPhoneTextField.font?.withSize(20)
        numberPhoneTextField.text = employee?.numberPhone
        //numberPhoneLabel.backgroundColor = .systemGray
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
    @objc private func didTapSaveButton()
    {
        
    }

}

