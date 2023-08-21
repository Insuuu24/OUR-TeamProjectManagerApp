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
        self.tabBar.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
        self.tabBar.isHidden = false
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: -1.0)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 2.0
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowPath = UIBezierPath(rect: tabBar.bounds).cgPath

        viewControllers = tabBarList.map {
            UINavigationController(rootViewController: $0)
        }
        self.selectedIndex = 1
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let navController = selectedViewController as? UINavigationController,
           let currentController = navController.viewControllers.first as? ProjectAddViewController,
           currentController.isInputInProgress {
            
            let alert = UIAlertController(title: "주의!", message: "입력도중 다른 페이지로 이동할 수 없습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            currentController.present(alert, animated: true, completion: nil)
            
            return false
        }
        return true
    }
}
