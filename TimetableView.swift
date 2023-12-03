//
//  TimetableView.swift
//  CourseMap
// 
//  Created by Vicky Li on 1/12/2023.
//  Updated by Athena Ho on 3/12/2023.
//

import SwiftUI

struct TimetableView: View {
    let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    let timeSlots: [String]
    let myClasses: [ClassInfo]
    
    init(timeSlots: [String], myClasses: [ClassInfo]) {
        self.timeSlots = timeSlots
        self.myClasses = myClasses
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Time")
                        .font(.headline)
                        .padding(.vertical, 10)
                        .frame(width: 80)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.trailing, 4)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(weekdays, id: \.self) { day in
                                Text(day)
                                    .font(.headline)
                                    .padding(.vertical, 10)
                                    .frame(width: 80)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                
                ScrollView {
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(timeSlots, id: \.self) { time in
                                Text(time)
                                    .font(.caption)
                                    .frame(width: 80, height: calculateTimeSlotHeight())
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                        }
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 0) {
                                //day logic
                                ForEach(weekdays, id: \.self) { day in
                                    VStack(alignment: .leading, spacing: 0) {
                                        ForEach(timeSlots, id: \.self) { time in
                                            if let classInfo = getClassInfo(day: day, time: time) {
                                                Text(classInfo.courseCode)
                                                    .font(.caption)
                                                    .frame(width: 80, height: calculateTimeSlotHeight())
                                                    .background(Color.blue)
                                                    .cornerRadius(5)
                                            } else {
                                                Text("")
                                                    .frame(width: 80, height: calculateTimeSlotHeight())
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // Helper function to calculate the height of each time slot
    private func calculateTimeSlotHeight() -> CGFloat {
        let numberOfTimeSlots = timeSlots.count
        let totalHeight: CGFloat = 300 // Adjust this value as per your layout requirements
        let slotHeight = totalHeight / CGFloat(numberOfTimeSlots)
        return slotHeight
    }
    
    func getClassInfo(day: String, time: String) -> ClassInfo? {
        return myClasses.first { classInfo in
            classInfo.daytime.contains { classTime in
                let startTimeComponents = classTime.startime.components(separatedBy: ":")
                let endTimeComponents = classTime.endtime.components(separatedBy: ":")
                
                guard let startHour = Int(startTimeComponents[0]),
                      let startMinute = Int(startTimeComponents[1]),
                      let endHour = Int(endTimeComponents[0]),
                      let endMinute = Int(endTimeComponents[1]) else {
                    return false
                }
                
                let timeComponents = time.components(separatedBy: "-")
                let timeRangeStart = timeComponents[0]
                let timeRangeEnd = timeComponents[1]
                
                let timeRangeStartComponents = timeRangeStart.components(separatedBy: ":")
                let timeRangeEndComponents = timeRangeEnd.components(separatedBy: ":")
                
                guard let rangeStartHour = Int(timeRangeStartComponents[0]),
                      let rangeStartMinute = Int(timeRangeStartComponents[1]),
                      let rangeEndHour = Int(timeRangeEndComponents[0]),
                      let rangeEndMinute = Int(timeRangeEndComponents[1]) else {
                    return false
                }
                
                let classStartTime = Calendar.current.date(bySettingHour: startHour, minute: startMinute, second: 0, of: Date()) ?? Date()
                let classEndTime = Calendar.current.date(bySettingHour: endHour, minute: endMinute, second: 0, of: Date()) ?? Date()
                
                let timeRangeStartTime = Calendar.current.date(bySettingHour: rangeStartHour, minute: rangeStartMinute, second: 0, of: Date()) ?? Date()
                let timeRangeEndTime = Calendar.current.date(bySettingHour: rangeEndHour, minute: rangeEndMinute, second: 0, of: Date()) ?? Date()
                
                return classStartTime <= timeRangeStartTime && classEndTime >= timeRangeEndTime
            }
        }
    }
}

#Preview {
    TimetableView(timeSlots: timeslots, myClasses: myClasses)
}



