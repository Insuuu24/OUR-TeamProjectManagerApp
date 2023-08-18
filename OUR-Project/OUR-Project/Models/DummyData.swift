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
        endDate: Calendar.current.date(byAdding: .month, value: +7, to: Date()) ?? Date(),
        isJoined: false
    ),
    
    ProjectList(
        projectName: "(A)TODO앱 만들기",
        affiliation: "8조",
        startDate: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +7, to: Date()) ?? Date(),
        isJoined: true
    ),
    
    ProjectList(
        projectName: "(나)종료된 프로젝트",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .year, value: -2, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .year, value: -7, to: Date()) ?? Date(),
        isJoined: true
    ),
    
    ProjectList(
        projectName: "(D)가나다라마바사아자차카타파하ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +3, to: Date()) ?? Date(),
        isJoined: true
    ),
    
    ProjectList(
        projectName: "(B)ㅋ",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .day, value: -20, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .day, value: +9, to: Date()) ?? Date(),
        isJoined: true
    ),
    
    ProjectList(
        projectName: "(C)!@#$%^&*()",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(),
        isJoined: true
    ),
    
    ProjectList(
        projectName: "0123456789",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .month, value: +2, to: Date()) ?? Date(),
        isJoined: true
    ),
    ProjectList(
        projectName: "(다)아야어여오요우유으이",
        affiliation: "7조",
        startDate: Calendar.current.date(byAdding: .month, value: -9, to: Date()) ?? Date(),
        endDate: Calendar.current.date(byAdding: .year, value: +1, to: Date()) ?? Date(),
        isJoined: true
    ),
]

let dummyProjectTaskList: [ProjectTask] = [
    ProjectTask(
        task: "아이디어 내기",
        isCompleted: true,
        projectName: "KIOSK 만들기"
    ),
    ProjectTask(
        task: "팀장 정하기",
        isCompleted: true,
        projectName: "KIOSK 만들기"
    ),
    ProjectTask(
        task: "팀 노션 만들기",
        isCompleted: false,
        projectName: "KIOSK 만들기"
    ),
    ProjectTask(
        task: "TIL 작성하기",
        isCompleted: false,
        projectName: "KIOSK 만들기"
    ),
    ProjectTask(
        task: "9시에 게더에서 모이기",
        isCompleted: false,
        projectName: "KIOSK 만들기"
    ),
    ProjectTask(
        task: "9시에 게더에서 모이기",
        isCompleted: false,
        projectName: "발표 준비하기"
    ),
    
]

let dummyMemberList: [Member] = [
    Member(
        name: "김김김",
        bio: "노는게 제일 좋아",
        joinedProjects: ["KIOSK 만들기", "TODO앱 만들기"],
        createdProjects: ["KIOSK 만들기"],
        profileImg: "",
        email:"kim@gmail.com"
    ),
    
    Member(
        name: "이이이",
        bio: "짜장면 좋아합니다",
        joinedProjects: ["KIOSK 만들기"],
        createdProjects: [""],
        profileImg: "",
        email:"lee@gmail.com"
        
    ),
    
    Member(
        name: "박박박",
        bio: "낮잠이 취미에요",
        joinedProjects: ["KIOSK 만들기"],
        createdProjects: [""],
        profileImg: "",
        email:"park@gmail.com"
    ),
    Member(
        name: "최최최",
        bio: "반가워요 잘 부탁해요",
        joinedProjects: ["TODO앱 만들기"],
        createdProjects: ["TODO앱 만들기"],
        profileImg: "",
        email:"choi@gmail.com"
    ),
    Member(
        name: "신신신",
        bio: "산책 갈 사람",
        joinedProjects: ["KIOSK 만들기"],
        createdProjects: [""],
        profileImg: "",
        email:"shin@gmail.com"
    ),
]
