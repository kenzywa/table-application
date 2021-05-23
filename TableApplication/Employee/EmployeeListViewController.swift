import UIKit

class EmployeeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmployeeEditorDelegate{
    
    var firstTableView = UITableView(frame: .zero, style: .plain)
    let identifier = "MyCell"
    var employees: [Employee] = []
    let server: Server = Stub()
    
    private struct constants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Employees"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = constants.titleOfView
        createTable()
        
        employees = server.getEmployees()
        firstTableView.reloadData()
    }
    //MARK: - Methods
    func createTable() {
        self.firstTableView.frame = view.bounds
        firstTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.firstTableView.delegate = self
        self.firstTableView.dataSource = self
        view.addSubview(firstTableView)
    }
    
    func showAlertFailed() {
        let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func toSaveData(name : String, surname : String, profession : String, numberPhone : String, id : String) {

            if let index = employees.firstIndex(where: {$0.id == id}) {
                employees[index].name = name
                employees[index].surname = surname
                employees[index].numberPhone = Int(numberPhone)!
                employees[index].profession = profession
                firstTableView.reloadData()
            } else {
                showAlertFailed()
                return
            }
    }
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let employee = employees[indexPath.row]
        cell.textLabel?.text = "\(employee.name) \(employee.surname)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employees[indexPath.row]
        let employeeEditorVC = EmployeeEditorViewController(delegate: self)
        employeeEditorVC.employee = employee
        navigationController?.pushViewController(employeeEditorVC, animated: true)
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(constants.heightOfRow)
    }
}


