//
//  BarChartView.swift
//  BarChartDemo
//
//  Created by Athena Ho on 3/12/2023.
//

import SwiftUI
import Charts

struct Course: Identifiable {
    var category: String
    var count: Int
    var id = UUID()
}
var courseData: [Course] = [
    .init(category: "UG5", count: 9),
    .init(category: "Information Systems", count: 12),
    .init(category: "Computer Science", count: 14),
    .init(category: "Free Elective", count: 5)
]


struct BarChartView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Bar Chart")
                Chart {
                    ForEach(courseData) { course in
                        BarMark(
                            x: .value("Course Type", course.category),
                            y: .value("Total Count", course.count)
                        )
                    }
                }
            }
            .frame(height: 300)
            
            Spacer()
            
        }
    }
}

#Preview {
    BarChartView()
}


