//
//  UserDataManager.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/15.
//

import UIKit

class UserManager {
    static let shared = UserManager()
    private let userKey = "com.ourproject.users"
    
    func save(users: [UserSelect]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            UserDefaults.standard.set(encoded, forKey: userKey)
        }
    }
    
    func loadUsers() -> [UserSelect] {
        let decoder = JSONDecoder()
        if let savedUsers = UserDefaults.standard.object(forKey: userKey) as? Data {
            if let loadedUsers = try? decoder.decode([UserSelect].self, from: savedUsers) {
                return loadedUsers
            }
        }
        return []
    }
}
