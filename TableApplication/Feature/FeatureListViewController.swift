import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var homeScreenTableView = UITableView(frame: .zero, style: .plain)
    var temporaryLabel = UILabel()
    let identifier = "MyCell"
    var features = [Feature(name: "List of Employees", task: "Show list of employees", id: UUID().uuidString)]
    
    private struct Сonstants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Features"
        static let fromTopViewToLabel : Int = 140
        static let fromRightViewToLabel : Int = 250
        static let fromLeftViewToLavel : Int = 20
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Сonstants.titleOfView
        createTable()
        setupUI()
    }
    //MARK: - Methods
    func createTable() {
        self.homeScreenTableView.frame = view.bounds
        homeScreenTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.homeScreenTableView.delegate = self
        self.homeScreenTableView.dataSource = self
        homeScreenTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(homeScreenTableView)
    }
    func setupUI() {
        view.addSubview(temporaryLabel)
        temporaryLabel.translatesAutoresizingMaskIntoConstraints = false
        temporaryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(Сonstants.fromTopViewToLabel)).isActive = true
        temporaryLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat(Сonstants.fromLeftViewToLavel)).isActive = true
        temporaryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(Сonstants.fromLeftViewToLavel)).isActive = true
        
        temporaryLabel.textAlignment = .natural
        temporaryLabel.font = UIFont(name: "San Francisco", size: 5.0)
        temporaryLabel.text = features.first?.task
        temporaryLabel.textColor = .systemBlue
    }
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let feature = features[indexPath.row]
        cell.textLabel?.text = "\(feature.name)"
        cell.textLabel?.font = UIFont(name: "San Francisco", size: 40.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeeListVC = EmployeeListViewController()
        navigationController?.pushViewController(employeeListVC, animated: true)
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Сonstants.heightOfRow)
    }
}
