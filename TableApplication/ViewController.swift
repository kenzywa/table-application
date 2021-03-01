import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var firstTableView = UITableView(frame: .zero, style: .plain)
    let identifier = "MyCell"
    var employees = [Employee(name: "Veronika", surname: "Petrova", age: 19),
                     Employee(name: "Roman", surname: "Shukailo", age: 22),
                     Employee(name: "Marina", surname: "Bondarenko", age: 28)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
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
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}


