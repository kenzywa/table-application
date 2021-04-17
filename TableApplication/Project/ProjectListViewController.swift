import UIKit

class ProjectListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var projectListTableView = UITableView()
    let identifier = "MyCell"
    var projects = [Project(name: "Hello DataBase", desсription: "Project for databases",id: UUID().uuidString, start_data: "09.04.2021"),
                    Project(name: "Dragon", desсription: "Project for game ", id: UUID().uuidString, start_data: "10.04.2021")]
    
    private struct Сonstants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Projects"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Сonstants.titleOfView
        createTable()
        setupUI()
    }
    //MARK: - Methods
    func createTable() {
        self.projectListTableView.frame = view.bounds
        projectListTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.projectListTableView.delegate = self
        self.projectListTableView.dataSource = self
        projectListTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(projectListTableView)
    }
    func setupUI() {
        projectListTableView.translatesAutoresizingMaskIntoConstraints = false
        projectListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        projectListTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        projectListTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        projectListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectListTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.text = "\(project.name)"
        cell.textLabel?.font = UIFont(name: "San Francisco", size: 40.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        let projectEditorVC = ProjectEditorViewController()
        projectEditorVC.project = project
        navigationController?.pushViewController(projectEditorVC, animated: true)
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Сonstants.heightOfRow)
    }
}
