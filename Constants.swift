// Constants.swift
//
// Created by Athena Ho on 3/12/2023.
//

import Foundation

struct CourseInfo: Decodable,Encodable {
    var id: Int
    let code: String
    let name: String
    let faculty: String
    let prereq: String
    let coreq: String
    let mutuallyExclusive: String
}

struct classTime: Decodable{
    let day: String
    let startime: String
    let endtime: String
}
struct ClassInfo: Identifiable, Decodable{
    var id = UUID()
    let courseCode: String
    let subclass: String
    let daytime: [classTime]
    let instructor: String
    let courseInfo: CourseInfo
}

let timeslots = ["09:00-09:30","09:30-10:00","10:00-10:30", "10:30-11:00", "11:00-11:30", "11:30-12:00", "12:00-12:30", "12:30-13:00", "13:00-13:30", "13:30-14:00", "14:00-14:30", "14:30-15:00", "15:00-15:30", "15:30-16:00", "16:00-16:30", "16:30-17:00", "17:00-17:30"
]

let myClasses=[
    ClassInfo(courseCode: "COMP3230", subclass: "B", daytime: [classTime(day: "Mon", startime: "10:30", endtime:"12:30")], instructor: "Dr. Anthony Tam", courseInfo: CourseInfo(id: 1, code: "COMP3230", name: "Principle of Operating Systems", faculty: "CS", prereq: "COMP2113, COMP2123, ENGG1340, COMP2120, ELEC2441", coreq: "Nil", mutuallyExclusive: "ELEC3443"
                                                                                                                                                                                ))
]

struct myCourse {
    let code: String
    let gpa: Double
}


let myCourses = [
    myCourse(code: "CAES1000", gpa: 3),
    myCourse(code: "CAES9920", gpa: 3),
    myCourse(code: "CBBA9002", gpa: 3),
    
    myCourse(code: "FINA1310", gpa: 3),
    myCourse(code: "ACCT1101", gpa: 3),
    myCourse(code: "ECON1210", gpa: 3),
    
    myCourse(code: "COMP3278", gpa: 3),
]

let ug5 = ["CAES1000", "CAES9920", "CBBA9002"]
let infoS = ["ECON1210", "ACCT1101", "FINA1310", "STAT1602", "IIMT2601", "MKTG2501", "MGMT2401", "IIMT3603", "IIMT4601", "STRA4701"]
let cS = ["COMP1117", "COMP2113", "COMP2119", "COMP2120", "COMP2121", "COMP2396", "COMP3230", "COMP3278", "COMP3297", "COMP3234"]








