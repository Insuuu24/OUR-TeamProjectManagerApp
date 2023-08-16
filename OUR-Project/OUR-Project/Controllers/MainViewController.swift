//
//  ViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    var memberList = dummyMemberList
    var projectList = dummyProjectList
    var projectTeskList = dummyProjectTaskList
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
     
        setupNavigationBar()
        setupSegmentControl()
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
    
    func setNavigationBarLogo(fileName: String) {
        let logoImageView = UIImageView(image: UIImage(named: fileName))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([logoImageView.widthAnchor.constraint(equalToConstant: 120)])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
    }
    
    // MARK: - 세그먼트 컨트롤
    func setupSegmentControl() {
        let segments = ["종료된 프로젝트", "진행중인 프로젝트"]
        let segmentedControl = UISegmentedControl(items: segments)

        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        
        self.view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true // TODO: equalTo 네비게이션 바를 기준으로 수정하기
        segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
        
    }
  
    
    // MARK: - Method & Action
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("종료된 프로젝트 선택됨")
            
        case 1:
            print("진행중인 프로젝트 선택됨")
            
        default:
            break
        }
    }
   


    
}

