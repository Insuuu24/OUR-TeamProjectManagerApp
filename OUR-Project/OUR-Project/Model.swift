//
//  Model.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/14.
//

import Foundation

struct Member: Codable {
    var name: String
    var age: Int
    var bio: String
    var project: [String]
    var team: [String]
}

struct Project: Codable {
    var name: String
    var team: String
    var startDate: Date
    var endDate: Date
    var description: String
    var member: [String]
    var task: [String]
}

struct Task: Codable {
    var name: String
    var isCompleted: Bool
    var projectName: String
}
