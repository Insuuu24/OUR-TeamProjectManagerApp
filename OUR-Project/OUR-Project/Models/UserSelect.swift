//
//  UserSelect.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/15.
//

import UIKit

struct UserSelect: Codable {
    var name: String
    var email: String
    var introduction: String
    var iconData: Data?
    
    var icon: UIImage? {
        get {
            if let data = iconData {
                return UIImage(data: data)
            }
            return nil
        }
        set {
            if let newValue = newValue {
                iconData = newValue.pngData()
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case introduction
        case iconData
    }
    
    init(name: String, email: String, introduction: String, icon: UIImage?) {
        self.name = name
        self.email = email
        self.introduction = introduction
        self.icon = icon
    }
}

extension UserSelect {
    init(name: String, icon: UIImage?) {
        self.name = name
        self.email = ""
        self.introduction = ""
        self.icon = icon
    }
}
