//
//  GroupAsmDemo.swift
//  Group Assignment Demo 
//  Data visualization in bar charts and calendar-like timetable
//
//  Created by Leo Lai on 1/12/2023.
//  Updated by Athena Ho on 3/12/2023.
//

import SwiftUI

@main
struct BarChartDemoApp: App {
    var body: some Scene {
        WindowGroup {
            BarChartView()
            StackedBarChartView()
            TimetableView(timeSlots: timeslots, myClasses: myClasses)
        }
    }
}

