//
//  ProjectTask.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/15.
//

import Foundation

struct ProjectTask: Codable {
    var task: String // 할 일
    var isCompleted: Bool // 할일 완료 여부
    var projectName: String // 프로젝트명
}

// 8.17 영현님 모델
//struct Task: Codable {
//    var name: String
//    var isCompleted: Bool
//    var projectName: String
//}
