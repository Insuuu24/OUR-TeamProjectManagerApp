//
//  ViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    private var tableView: UITableView!
    private var segmentedControl: UISegmentedControl!
    
    var memberList = dummyMemberList
    var projectList = dummyProjectList
    var projectTaskList = dummyProjectTaskList
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
     
        setupNavigationBar()
        setupSegmentControl()
        setupTableView()
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
   
    // MARK: - 세그먼트 컨트롤
    private func setupSegmentControl() {
        let segments = ["종료된 프로젝트", "진행중인 프로젝트"]
        segmentedControl = UISegmentedControl(items: segments)

        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        
        self.view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true // TODO: equalTo 네비게이션 바를 기준으로 수정하기
        segmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    // MARK: - 테이블 뷰
    private func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "projectListCell") // 셀 등록
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: - Method & Action
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return projectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectListCell", for: indexPath)
                    
        let project = projectList[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let context = """
        \(project.name)
        소속: \(project.teams.joined(separator: ", "))
        시작: \(dateFormatter.string(from: project.startDate)) / 종료: \(dateFormatter.string(from: project.endDate))
        """
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = context

        return cell
    }
    
    
}


