import Foundation

protocol Server {
    func getProjects() -> [Project]
    func getTasks() -> [Task]
    func getEmployees() -> [Employee]
//    func updateProjects(project: Project) -> Project
//
//    func updateEmployees(emploee : Employee) -> Employee
//
//    func updateTasks(task: Task) -> Task
    
}

class Stub: Server {
    private var employees = [Employee(name: "Veronika", surname: "Petrova", age: 19 , profession: "Doctor", male: "W", numberPhone: 79811234567, id : UUID().uuidString),
                               Employee(name: "Roman", surname: "Shukailo", age: 22 , profession: "Swift dev", male: "M", numberPhone: 79811234567, id: UUID().uuidString),
                               Employee(name: "Marina", surname: "Bondarenko", age: 28, profession: "Sales Manager", male: "W", numberPhone: 79811234567, id: UUID().uuidString),
                               Employee(name: "Kirill", surname: "Unshikov", age: 21 , profession: "Go dev", male: "M", numberPhone: 79811234567, id: UUID().uuidString),
                               Employee(name: "Roman", surname: "Suhov", age: 22, profession: "Python dev ", male: "m", numberPhone: 79811234567, id: UUID().uuidString),
                               Employee(name: "Raif", surname: "Garipov", age: 19 , profession: "Student ", male: "M", numberPhone: 78005553535, id: UUID().uuidString),
                               Employee(name: "Igor", surname: "Avgustov", age: 22 , profession: "Frontend dev", male: "M", numberPhone: 78005553535, id: UUID().uuidString)]
    
    private var projects = [Project(name: "Hello DataBase", desсription: "Project for databases",id: UUID().uuidString, start_data: "09.04.2021"),
                            Project(name: "Dragon", desсription: "Project for game ", id: UUID().uuidString, start_data: "10.04.2021")]
    
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
    
    
    func getEmployees() -> [Employee] {
        return employees
    }
    
    func getProjects() -> [Project] {
        return projects
    }
    
    func getTasks() -> [Task] {
        return tasks
    }
    
//    func updateEmployees(emploee: Employee) -> Employee {
//        return employees
//    }
//    
//    func updateTasks(task: Task) -> Task {
//        return tasks
//    }
//
//    func updateProject(project: Project) -> Project {
//        return projects
//    }
    
}



