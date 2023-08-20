//
//  UserSelect.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/15.
//

import UIKit

struct UserSelect: Codable {
    var name: String
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
        case iconData
    }
    
    init(name: String, icon: UIImage?) {
        self.name = name
        self.icon = icon
    }
}
