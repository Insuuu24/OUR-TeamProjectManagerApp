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
        
        testButton()
        
        // test
        if User.userProject.isEmpty {
            let data1: Project = Project(
                name: "Our App Project",
                teams: ["내일배움캠프", "8조"],
                startDate: "2023-08-14".toDate() ?? Date(),
                endDate: "2023-08-21".toDate() ?? Date(),
                description: "4명이서 만드는 프로젝트 App",
                members: ["김상훈", "박인수", "윤혁진"],
                tasks: ["메인 페이지 만들기", "Launch Screen 만들기", "상세 페이지 만들기", "편집 페이지 만들기", "마이 페이지 만들기"],
                createdBy: "김상훈"
            )
            
            User().appendProject(project: data1)
            
            let taskData1: ProjectTask = ProjectTask(
                task: "메인 페이지 만들기", isCompleted: true, projectName: "Our App Project")
            let taskData2: ProjectTask = ProjectTask(
                task: "Launch Screen 만들기", isCompleted: false, projectName: "Our App Project")
            let taskData3: ProjectTask = ProjectTask(
                task: "상세 페이지 만들기", isCompleted: true, projectName: "Our App Project")
            let taskData4: ProjectTask = ProjectTask(
                task: "편집 페이지 만들기", isCompleted: false, projectName: "Our App Project")
            let taskData5: ProjectTask = ProjectTask(
                task: "마이 페이지 만들기", isCompleted: false, projectName: "Our App Project")
            
            User().appendProjectTask(task: taskData1)
            User().appendProjectTask(task: taskData2)
            User().appendProjectTask(task: taskData3)
            User().appendProjectTask(task: taskData4)
            User().appendProjectTask(task: taskData5)
            
            User().appendProjectMember(member: "김상훈")
            User().appendProjectMember(member: "박인수")
            User().appendProjectMember(member: "윤혁진")
            User().appendProjectMember(member: "조영현")
        }
    }
    
    // MARK: - Navigation Bar
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
        let logoImage = UIImage(named: "ourproject_logo.png")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        logoImageView.frame = container.bounds
        container.addSubview(logoImageView)
        navigationItem.titleView = container
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
    
    // MARK: - Test용 Detail Page 이동 버튼
    func testButton() {
        let testButton = UIButton()
        testButton.setTitle("Detail Page", for: .normal)
        testButton.backgroundColor = .black
        testButton.translatesAutoresizingMaskIntoConstraints = false

        // layer
        testButton.layer.cornerRadius = 4.0
        testButton.layer.masksToBounds = true
        
        testButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside) // 클릭 이벤트 지정
        
        view.addSubview(testButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        testButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        testButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20).isActive = true
        testButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
    }
    
    // MARK: - [버튼 클릭 이벤트]
    @objc func buttonAction(sender: UIButton!) {
        let detailViewController = DetailPageViewController()
        let storyboardName = detailViewController.storyboardName
        let storyboardID = detailViewController.storyboardID
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main) // Main.stroyboard와 연동하는 작업 (변수에 담는 작업)
        guard let viewController = storyboard.instantiateViewController(identifier: storyboardID) as? DetailPageViewController else { return }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Method & Action
    // 임의로 화면 이동을 위해
    @IBAction func testBtn(_ sender: Any) {
        let detailViewController = DetailPageViewController()
        let storyboardName = detailViewController.storyboardName
        let storyboardID = detailViewController.storyboardID
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main) // Main.stroyboard와 연동하는 작업 (변수에 담는 작업)
        guard let viewController = storyboard.instantiateViewController(identifier: storyboardID) as? DetailPageViewController else { return }
        
        present(viewController, animated: true)
    }
    
    
    
    
}

