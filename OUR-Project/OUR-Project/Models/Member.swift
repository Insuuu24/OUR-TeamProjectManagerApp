//
//  Member.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/15.
//

import Foundation

struct Member: Codable {
    var name: String // 이름
    var bio: String // 자기소개
    var joinedProjects: [String] // 참여중인 프로젝트
    var createdProjects: [String] // 생성한 프로젝트
    var profileImg: String // 프로필 이미지 파일
    var email: String // 이메일
}

// 8.17 영현님 모델
//struct Member: Codable {
//    var name: String
//    var age: Int
//    var bio: String
//    var project: [String]
//    var team: [String]
//}
