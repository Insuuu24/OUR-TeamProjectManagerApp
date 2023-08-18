//
//  test.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/18.
//

import Foundation

class User {
    static var userProject: [Project] = []
    
    func appendProject(project: Project) {
        Self.userProject.append(project)
    }
    
    func removeProject(index: Int) {
        Self.userProject.remove(at: index)
    }
    
    static var userProjectTask: [ProjectTask] = []
    
    func appendProjectTask(task: ProjectTask) {
        Self.userProjectTask.append(task)
    }

}
