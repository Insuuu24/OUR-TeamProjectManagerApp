//
//  ProjectListDataManager.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/19.
//

import Foundation

class ProjectListDataManager {
    func saveProjectToUserDefaults(project: ProjectList) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(project) {
            UserDefaults.standard.set(encoded, forKey: "project")
        }
    }
    
    func loadProjectFromUserDefaults() -> ProjectList? {
        if let savedData = UserDefaults.standard.data(forKey: "project") {
            let decoder = JSONDecoder()
            if let loadedProject = try? decoder.decode(ProjectList.self, from: savedData) {
                return loadedProject
            }
        }
        return nil
    }
}
