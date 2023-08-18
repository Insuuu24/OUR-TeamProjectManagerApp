//
//  ProjectPageSection.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import UIKit

enum ProjectPageSection {
    case projectName(ProjectNameModel)
    case affiliations(AffiliationModel)
    case startDates(StartDateModel)
    case endDates(EndDateModel)
    case userAttends(UserAttendModel)
    case progressList(ProgressListModel)
}

struct ProjectNameModel {
    var projectName: String
}

struct AffiliationModel {
    var affiliation: String
}

struct StartDateModel {
    var startDate: String
    var datePickerAction: () -> Void
}

struct EndDateModel {
    var endDate: String
    var datePickerAction: () -> Void
}

struct UserAttendModel {
    var user: UserSelect
    
    var name: String {
        return user.name
    }
    
    var icon: UIImage? {
        return user.icon
    }
}

struct ProgressListModel {
    var checkBox: () -> Void
    var list: String
    var isChecked: Bool
}
