//
//  Member.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/15.
//

import Foundation

struct Member: Codable {
    var name: String // 이름
    var age: Int // 나이
    var bio: String // 자기소개
    var joinedProjects: [String] // 참여중인 프로젝트
    var createdProjects: [String] // 생성한 프로젝트
    var team: String // 소속
    var profileImg: String // 프로필 이미지 파일
    var email: String // 이메일
}
