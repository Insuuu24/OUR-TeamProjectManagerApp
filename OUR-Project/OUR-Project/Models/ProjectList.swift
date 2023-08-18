//
//  ProjectList.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import Foundation

struct ProjectList {
    var projectName: String      // 프로젝트 이름
    var affiliation: String      // 소속 (예: 개발팀, 마케팅팀 등)
    var startDate: Date          // 시작 날짜
    var endDate: Date            // 종료 날짜
    var isJoined: Bool           // 사용자가 프로젝트에 참여했는지 여부
}

