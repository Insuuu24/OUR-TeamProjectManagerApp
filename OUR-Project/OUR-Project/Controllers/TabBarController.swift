//
//  TabBarController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBar()
    }
    
    // MARK: - TabBar Setting
    
    private func setupTabBar() {
        
        let projectAddViewController = ProjectAddViewController()
        projectAddViewController.tabBarItem = UITabBarItem(title: "추가하기", image: UIImage(systemName: "plus.square"), selectedImage: UIImage(systemName: "plus.square.fill"))
        
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let myPageViewController = MyPageViewController()
        myPageViewController.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        let tabBarList = [projectAddViewController, mainViewController, myPageViewController]
        
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
        self.tabBar.isHidden = false
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: -1.0)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 2.0
        tabBar.layer.masksToBounds = false

        viewControllers = tabBarList.map {
            UINavigationController(rootViewController: $0)
        }
        self.selectedIndex = 1
    }

}
