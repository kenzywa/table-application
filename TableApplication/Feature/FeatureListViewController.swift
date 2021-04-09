import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var homeScreenTableView = UITableView()
    let identifier = "MyCell"
    var features = [Feature(name: "List of Employees", task: "Temporary label", id: UUID().uuidString)]
    
    private struct Сonstants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Features"
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
        homeScreenTableView.translatesAutoresizingMaskIntoConstraints = false
        homeScreenTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeScreenTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        homeScreenTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        homeScreenTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
