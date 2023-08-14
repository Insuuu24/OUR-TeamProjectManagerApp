//
//  ProjectAddViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class ProjectAddViewController: UIViewController {
    
    // MARK: - Properties
    
    
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
    }
    

    // MARK: - Navigation Bar
    
    func setupNavigationBar() {
        navigationItem.title = "프로젝트 생성"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "생성", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Method & Action
    
    @objc func saveButtonTapped() {
        
        
    }
    

}
// 첫 커밋

