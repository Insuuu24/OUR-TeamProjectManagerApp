//
//  ProjectList.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import UIKit

struct ProjectList: Codable {
    var projectName: String
    var affiliation: String
    var startDate: Date
    var endDate: Date
    var isArchived: Bool = false
}
