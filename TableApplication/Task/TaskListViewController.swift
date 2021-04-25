import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var taskListTableView = UITableView()
    let identifier = "MyCell"
    var tasks = [Task(title: "Create UI",id: UUID().uuidString,description: "UI",
                      start_date: "25.04.2021",finish_date: "31.04.2021",status: "In progress",employee: "",project: ""),
                 Task(title: "Delete database",id: UUID().uuidString, description: "Database need to delete", start_date: "26.04.2021", finish_date: "31.04.2021", status: "To do", employee: "", project: "")]
    
    private struct Сonstants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Tasks"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Сonstants.titleOfView
        createTable()
        setupUI()
    }
    //MARK: - Methods
    func createTable() {
        self.taskListTableView.frame = view.bounds
        taskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.taskListTableView.delegate = self
        self.taskListTableView.dataSource = self
        taskListTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(taskListTableView)
    }
    func setupUI() {
        taskListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        taskListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        taskListTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        taskListTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        taskListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = "\(task.title)"
        cell.textLabel?.font = UIFont(name: "San Francisco", size: 40.0)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let employeeListVC = EmployeeListViewController()
//        let projectListVC = ProjectListViewController()
//        switch indexPath {
//        case [0,0]: navigationController?.pushViewController(employeeListVC, animated: true)
//        case [0,1]: navigationController?.pushViewController(projectListVC, animated: true)
//        default:
//            print("Failed")
//        }
        
//   }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Сonstants.heightOfRow)
    }
}

