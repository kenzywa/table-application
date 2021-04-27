import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var taskListTableView = UITableView()
    let identifier = "MyCell"
    var tasks = [Task(title: "Create UI",
                      id: UUID().uuidString,
                      description: "UI",
                      start_date: Date.init(timeIntervalSinceReferenceDate: 0),
                      finish_date: Date.init(timeIntervalSinceReferenceDate: 432000),
                      status: Status.todo,
                      employee: Employee.init(name: "Roman",
                                              surname: "Shukailo",
                                              age: 22,
                                              profession: "Swift dev",
                                              male: "M",
                                              numberPhone: 79812481033,
                                              id: UUID().uuidString),
                      project: Project.init(name: "Database",
                                            desсription: "Hello",
                                            id: UUID().uuidString,
                                            start_data: "26.04.2021")),
                 Task(title: "Delete database",
                      id: UUID().uuidString,
                      description: "Database need to delete",
                      start_date: Date.init(timeIntervalSinceReferenceDate: 86400),
                      finish_date: Date.init(timeIntervalSinceReferenceDate: 432000),
                      status: Status.todo,
                      employee: Employee.init(name: "Roman",
                                              surname: "Shukailo",
                                              age: 22,
                                              profession: "Swift dev",
                                              male: "M",
                                              numberPhone: 79812481033,
                                              id: UUID().uuidString),
                      project: Project.init(name: "Database",
                                            desсription: "Hello",
                                            id: UUID().uuidString,
                                            start_data: "26.04.2021"))]
    
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
        taskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.taskListTableView.delegate = self
        self.taskListTableView.dataSource = self
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
        cell.textLabel?.font = .systemFont(ofSize: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        let taskEditorVC = TaskEditorViewController()
        taskEditorVC.task = task
        navigationController?.pushViewController(taskEditorVC, animated: true)
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Сonstants.heightOfRow)
    }
}

