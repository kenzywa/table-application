import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var firstTableView = UITableView(frame: .zero, style: .plain)
    let identifier = "MyCell"
    var employees = [Employee(name: "Veronika", surname: "Petrova", age: "19" , profession: "Doctor", male: "W", numberPhone: "+79811234567", id : UUID().uuidString),
                     Employee(name: "Roman", surname: "Shukailo", age: "22" , profession: "Swift dev", male: "M", numberPhone: "+79811234567", id: UUID().uuidString),
                     Employee(name: "Marina", surname: "Bondarenko", age: "28", profession: "Sales Manager", male: "W", numberPhone: "+79811234567", id: UUID().uuidString),
                     Employee(name: "Kirill", surname: "Unshikov", age: "21" , profession: "Go dev", male: "M", numberPhone: "+79811234567", id: UUID().uuidString),
                     Employee(name: "Roman", surname: "Suhov", age: "22" , profession: "Python dev ", male: "m", numberPhone: "+79811234567", id: UUID().uuidString),
                     Employee(name: "Raif", surname: "Garipov", age: "19" , profession: "Student ", male: "M", numberPhone: "+78005553535", id: UUID().uuidString),
                     Employee(name: "Igor", surname: "Avgustov", age: "22" , profession: "Frontend dev", male: "M", numberPhone: "+78005553535", id: UUID().uuidString)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Table of Employees"
        
        createTable()
        firstTableView.reloadData()

        
        
        view.addSubview(firstTableView)
    }
    
    func createTable() {
        self.firstTableView.frame = view.bounds
        firstTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        
        self.firstTableView.delegate = self
        self.firstTableView.dataSource = self
        
        firstTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(firstTableView)
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
        let secondVC = SecondViewController()
        secondVC.employee = employee
        navigationController?.pushViewController(secondVC, animated: true)
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}


