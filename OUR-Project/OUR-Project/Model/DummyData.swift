//
//  DummyData.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/15.
//

import Foundation

let dummyProjectList: [ProjectList] = [
    ProjectList(
        projectName: "(가)KIOSK 만들기",
        affiliation: "8조",
        startDate: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +7, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "(A)TODO앱 만들기",
        affiliation: "8조",
        startDate: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +7, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "(나)종료된 프로젝트",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .year, value: -2, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .year, value: -7, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "(D)가나다라마바사아자차카타파하ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +3, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "(B)ㅋ",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .day, value: -20, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .day, value: +9, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "(C)!@#$%^&*()",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "0123456789",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +2, to: Date()) ?? Date()
    ),
    
    ProjectList(
        projectName: "(다)아야어여오요우유으이",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .month, value: -9, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .year, value: +1, to: Date()) ?? Date()
    ),
]

