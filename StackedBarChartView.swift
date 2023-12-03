//
//  ContentView.swift
//  BarChartDemo
//
//  Created by Leo Lai on 1/12/2023.
//  Updated by Athena Ho on 3/12/2023.
//

import SwiftUI
import Charts

struct BarData: Identifiable {
    var category: String
    var status: String
    var count: Int
    var id = UUID()
}
var stackedBarData: [BarData] = [
    .init(category: "UG5", status: "Finished", count: myCourses.filter { course in ug5.contains(course.code) || course.code.hasPrefix("CC")}.count),
    .init(category: "UG5", status: "Not Finished", count: 9 - myCourses.filter { course in ug5.contains(course.code) || course.code.hasPrefix("CC")}.count),
    .init(category: "Information Systems", status: "Finished", count: myCourses.filter { course in infoS.contains(course.code) || course.code.hasPrefix("IIMT")}.count),
    .init(category: "Information Systems", status: "Not Finished", count: 12 - myCourses.filter { course in infoS.contains(course.code) || course.code.hasPrefix("IIMT")}.count),
    .init(category: "Computer Science", status: "Finished", count: myCourses.filter { course in cS.contains(course.code) || course.code.hasPrefix("COMP")}.count),
    .init(category: "Computer Science", status: "Not Finished", count: 14 - myCourses.filter { course in cS.contains(course.code) || course.code.hasPrefix("COMP")}.count),
    .init(category: "Free Elective", status: "Finished", count: myCourses.filter { course in
        return !(cS.contains(course.code) || course.code.hasPrefix("COMP")) &&
        !(infoS.contains(course.code) || course.code.hasPrefix("IIMT")) &&
        !(ug5.contains(course.code) || course.code.hasPrefix("CC"))
    }.count),
    .init(category: "Free Elective", status: "Not Finished", count: 5 - myCourses.filter { course in
        return !(cS.contains(course.code) || course.code.hasPrefix("COMP")) &&
        !(infoS.contains(course.code) || course.code.hasPrefix("IIMT")) &&
        !(ug5.contains(course.code) || course.code.hasPrefix("CC"))
    }.count)
]


struct StackedBarChartView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Stacked Bar Chart")
                Chart {
                    ForEach(stackedBarData) { course in
                        BarMark(
                            x: .value("Shape Type", course.category),
                            y: .value("Total Count", course.count)
                        )
                        .foregroundStyle(by: .value("Status", course.status))
                    }
                }
            }
            .frame(height: 300)
            
            Spacer()
            
        }
    }
}

#Preview {
    StackedBarChartView()
}

