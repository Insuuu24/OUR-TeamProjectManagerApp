//
//  ViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
     
        setupNavigationBar()
    }

    // MARK: - Navigation Bar

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
        
        setNavigationBarLogo(fileName: "ourproject_logo.png")

        let nameFilter = UIAction(title: "프로젝트 이름", image: UIImage(systemName: "list.bullet"), handler: { _ in
            // 프로젝트 이름별로 나열되게끔 로직 구성
        })

        let creationDate = UIAction(title: "프로젝트 생성 날짜", image: UIImage(systemName: "calendar"), handler: { _ in
            // 프로젝트 생성날짜별로 나열되게끔 로직 구성
        })

        let menu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: [nameFilter, creationDate])

        let filterImage = UIImage(systemName: "line.3.horizontal.decrease")
        let filterButton = UIBarButtonItem(image: filterImage, menu: menu)

        navigationItem.rightBarButtonItem = filterButton
    }

    // MARK: - Method & Action
    
    func setNavigationBarLogo(fileName: String) {
        let logoImageView = UIImageView(image: UIImage(named: fileName))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([logoImageView.widthAnchor.constraint(equalToConstant: 120)])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
    }


    
}

