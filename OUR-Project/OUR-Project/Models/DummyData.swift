//
//  DummyData.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/15.
//

import Foundation

let dummyProjectList: [Project] = [
    Project(
        name: "KIOSK 만들기",
        teams: ["8조"],
        startDate: Date(),
        endDate: Date(),
        description: "KIOSK앱을 만드는 프로젝트",
        members: ["김김김", "이이이", "박박박", "신신신"],
        tasks: ["아이디어 내기", "팀장 정하기", "팀 노션 만들기", "TIL 작성하기"],
        createdBy: "김김김"
    ),
    
    Project(
        name: "TODO앱 만들기",
        teams: ["8조","1조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["김김김", "최최최"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "최최최"
    ),
    
    Project(
        name: "종료된 프로젝트",
        teams: ["7조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["멤버1", "멤버2"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "멤버1"
    ),
    
    Project(
        name: "가나다라마바사아자차카타파하ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        teams: ["7조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["멤버1", "멤버2"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "멤버1"
    ),
    
    Project(
        name: "ㅋ",
        teams: ["7조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["멤버1", "멤버2"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "멤버1"
    ),
    
    Project(
        name: "!@#$%^&*()",
        teams: ["7조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["멤버1", "멤버2"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "멤버1"
    ),
    
    Project(
        name: "0123456789",
        teams: ["7조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["멤버1", "멤버2"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "멤버1"
    ),
    Project(
        name: "아야어여오요우유으이",
        teams: ["7조"],
        startDate: Date(),
        endDate: Date(),
        description: "TODO앱을 만드는 프로젝트",
        members: ["멤버1", "멤버2"],
        tasks: ["9시에 게더에서 모이기", "발표 준비하기"],
        createdBy: "멤버1"
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
