import UIKit

class EmployeeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmployeeEditorDelegate {
    var firstTableView = UITableView(frame: .zero, style: .plain)
    let identifier = "MyCell"
    var employees = [Employee(name: "Veronika", surname: "Petrova", age: 19 , profession: "Doctor", male: "W", numberPhone: 79811234567, id : UUID().uuidString),
                     Employee(name: "Roman", surname: "Shukailo", age: 22 , profession: "Swift dev", male: "M", numberPhone: 79811234567, id: UUID().uuidString),
                     Employee(name: "Marina", surname: "Bondarenko", age: 28, profession: "Sales Manager", male: "W", numberPhone: 79811234567, id: UUID().uuidString),
                     Employee(name: "Kirill", surname: "Unshikov", age: 21 , profession: "Go dev", male: "M", numberPhone: 79811234567, id: UUID().uuidString),
                     Employee(name: "Roman", surname: "Suhov", age: 22, profession: "Python dev ", male: "m", numberPhone: 79811234567, id: UUID().uuidString),
                     Employee(name: "Raif", surname: "Garipov", age: 19 , profession: "Student ", male: "M", numberPhone: 78005553535, id: UUID().uuidString),
                     Employee(name: "Igor", surname: "Avgustov", age: 22 , profession: "Frontend dev", male: "M", numberPhone: 78005553535, id: UUID().uuidString)]
    
    private struct constants {
        static let heightOfRow : Float = 80.0
        static let titleOfView : String = "List of Employees"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = constants.titleOfView
        createTable()
    }
    //MARK: - Methods
    func createTable() {
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


