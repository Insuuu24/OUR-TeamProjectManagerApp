//
//  Project.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/17.
//

import Foundation

struct Project: Codable {
    var name: String // 프로젝트명
    var teams: [String] // 프로젝트 참여 팀
    var startDate: Date // 시작일
    var endDate: Date // 종료일
    var description: String // 프로젝트 소개
    var members: [String] // 참여자명
    var tasks: [String] // 할 일
    var createdBy: String // 이 프로젝트를 생성한 사람
}
