import UIKit

class SecondViewController: UIViewController {
    let nameAndSurenameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 25))
    let professionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
    let ageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    let maleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    let numberPhoneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 25))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.title = "Your Profile"
        
    //MARK: - UILabels
        nameAndSurenameLabel.center = CGPoint(x: 103,y: 85)
        nameAndSurenameLabel.textAlignment = .natural
        self.view.addSubview(nameAndSurenameLabel)
        
        professionLabel.center = CGPoint(x: 103,y: 110)
        professionLabel.textAlignment = .natural
        self.view.addSubview(professionLabel)
        
        ageLabel.center = CGPoint(x: 103,y: 135)
        ageLabel.textAlignment = .natural
        self.view.addSubview(ageLabel)
        
        maleLabel.center = CGPoint(x: 140,y: 135)
        maleLabel.textAlignment = .natural
        self.view.addSubview(maleLabel)
        
        numberPhoneLabel.center = CGPoint(x: 280,y: 135)
        numberPhoneLabel.textAlignment = .natural
        self.view.addSubview(numberPhoneLabel)
        
        
        
    }
}
