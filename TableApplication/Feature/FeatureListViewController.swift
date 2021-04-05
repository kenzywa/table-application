import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var homeScreenTableView = UITableView(frame: .zero, style: .plain)
    var temporaryLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 15))
    let identifier = "MyCell"
    var features = [Feature(name: "List of Employees", task: "Show list of employees", id: UUID().uuidString)]
    
    private struct constants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Features"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = constants.titleOfView
        createTable()
        view.addSubview(homeScreenTableView)
        temporaryLabel.center = CGPoint(x: 170, y: 150)
        temporaryLabel.textAlignment = .natural
        temporaryLabel.font = UIFont(name: "San Francisco", size: 5.0)
        temporaryLabel.text = features.first?.task
        temporaryLabel.textColor = .systemBlue
        view.addSubview(temporaryLabel)
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
        //let employee = features[indexPath.row]
        let employeeListVC = EmployeeListViewController()
        //employeeListVC.employee = employee
        navigationController?.pushViewController(employeeListVC, animated: true)
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(constants.heightOfRow)
    }
}
