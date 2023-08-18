//
//  ProjectTask.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/17.
//

import Foundation

struct ProjectTask: Codable {
    var task: String // 할 일
    var isCompleted: Bool // 할일 완료 여부
    var projectName: String // 프로젝트명
}
