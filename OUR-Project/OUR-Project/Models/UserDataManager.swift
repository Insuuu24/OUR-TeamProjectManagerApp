//
//  UserDataManager.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/15.
//

import UIKit

class UserManager {
    static let shared = UserManager()
    private let userKey = "com.yourappname.users"
    
    func save(users: [UserModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            UserDefaults.standard.set(encoded, forKey: userKey)
        }
    }
    
    func loadUsers() -> [UserModel] {
        let decoder = JSONDecoder()
        if let savedUsers = UserDefaults.standard.object(forKey: userKey) as? Data {
            if let loadedUsers = try? decoder.decode([UserModel].self, from: savedUsers) {
                return loadedUsers
            }
        }
        return []
    }
}
