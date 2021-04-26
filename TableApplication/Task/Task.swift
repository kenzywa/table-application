import Foundation

enum Status {
    case todo
    case inProgress
    case done
}

struct Task {
    var title : String
    var id : String
    var description : String
    var start_date : Date
    var finish_date : Date
    var status : Status
    var employee : Employee
    var project : Project
}
