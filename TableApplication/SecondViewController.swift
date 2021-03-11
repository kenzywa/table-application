import UIKit

class SecondViewController: UIViewController {
    let nameAndSurenameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 25))
    let professionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
    let ageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let maleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let numberPhoneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
    
    var employee : Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Your Profile"
        
    //MARK: - UILabels
        nameAndSurenameLabel.center = CGPoint(x: 200,y: 105)
        nameAndSurenameLabel.textAlignment = .center
        nameAndSurenameLabel.font = nameAndSurenameLabel.font.withSize(25)
        nameAndSurenameLabel.text = (employee?.name)! + " " + (employee?.surname)!
        //nameAndSurenameLabel.backgroundColor = .systemGray
        //nameAndSurenameLabel.layer.borderWidth = 2
        //nameAndSurenameLabel.layer.cornerRadius = 8
        self.view.addSubview(nameAndSurenameLabel)
        
        professionLabel.center = CGPoint(x: 103,y: 140)
        professionLabel.textAlignment = .center
        professionLabel.font = nameAndSurenameLabel.font.withSize(20)
        professionLabel.text = employee?.profession
        //professionLabel.backgroundColor = .systemGray
        professionLabel.layer.borderWidth = 2
        professionLabel.layer.cornerRadius = 8
        self.view.addSubview(professionLabel)
        
        ageLabel.center = CGPoint(x: 30,y: 185)
        ageLabel.textAlignment = .center
        numberPhoneLabel.font = nameAndSurenameLabel.font.withSize(20)
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
        
        numberPhoneLabel.center = CGPoint(x: 310,y: 140)
        numberPhoneLabel.textAlignment = .natural
        numberPhoneLabel.font = nameAndSurenameLabel.font.withSize(20)
        numberPhoneLabel.text = employee?.numberPhone
        //numberPhoneLabel.backgroundColor = .systemGray
        numberPhoneLabel.layer.borderWidth = 2
        numberPhoneLabel.layer.cornerRadius = 8
        self.view.addSubview(numberPhoneLabel)
    }
}
