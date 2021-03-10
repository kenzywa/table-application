import UIKit

class SecondViewController: UIViewController {
    let nameAndSurenameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 25))
    let professionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
    let ageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let maleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let numberPhoneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
    
    var newArray = [Employee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Your Profile"
        showData()
        
        
    //MARK: - UILabels
        nameAndSurenameLabel.center = CGPoint(x: 200,y: 105)
        nameAndSurenameLabel.textAlignment = .center
        nameAndSurenameLabel.font = nameAndSurenameLabel.font.withSize(25)
        //nameAndSurenameLabel.backgroundColor = .systemGray
        //nameAndSurenameLabel.layer.borderWidth = 2
        //nameAndSurenameLabel.layer.cornerRadius = 8
        self.view.addSubview(nameAndSurenameLabel)
        
        professionLabel.center = CGPoint(x: 103,y: 140)
        professionLabel.textAlignment = .center
        professionLabel.font = nameAndSurenameLabel.font.withSize(20)
        //professionLabel.backgroundColor = .systemGray
        professionLabel.layer.borderWidth = 2
        professionLabel.layer.cornerRadius = 8
        self.view.addSubview(professionLabel)
        
        ageLabel.center = CGPoint(x: 30,y: 185)
        ageLabel.textAlignment = .center
        numberPhoneLabel.font = nameAndSurenameLabel.font.withSize(20)
        //ageLabel.backgroundColor = .systemGray
        ageLabel.layer.borderWidth = 2
        ageLabel.layer.cornerRadius = 8
        self.view.addSubview(ageLabel)
        
        maleLabel.center = CGPoint(x: 90,y: 185)
        maleLabel.textAlignment = .center
        //maleLabel.backgroundColor = .systemGray
        maleLabel.layer.borderWidth = 2
        maleLabel.layer.cornerRadius = 8
        self.view.addSubview(maleLabel)
        
        numberPhoneLabel.center = CGPoint(x: 310,y: 140)
        numberPhoneLabel.textAlignment = .center
        numberPhoneLabel.font = nameAndSurenameLabel.font.withSize(20)
        //numberPhoneLabel.backgroundColor = .systemGray
        numberPhoneLabel.layer.borderWidth = 2
        numberPhoneLabel.layer.cornerRadius = 8
        self.view.addSubview(numberPhoneLabel)
    }
    func showData() {
        nameAndSurenameLabel.text = "Your name and surename"
        professionLabel.text = "Your profession"
        ageLabel.text = "20"
        maleLabel.text = "W"
        numberPhoneLabel.text = "Your phone number"
    }
}
