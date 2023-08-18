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
    var sortCells: SortOptions?
    
    var memberList = dummyMemberList
    var projectList = dummyProjectList
    var projectTaskList = dummyProjectTaskList
    var selectedUser: UserModel?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupSegmentControl()
        setupTableView()
        
        // testButton()
        
        // // test
        // if User.userProject.isEmpty {
        //     let data1: Project = Project(
        //         name: "Our App Project",
        //         teams: ["내일배움캠프", "8조"],
        //         startDate: "2023-08-14".toDate() ?? Date(),
        //         endDate: "2023-08-21".toDate() ?? Date(),
        //         description: "4명이서 만드는 프로젝트 App",
        //         members: ["김상훈", "박인수", "윤혁진"],
        //         tasks: ["메인 페이지 만들기", "Launch Screen 만들기", "상세 페이지 만들기", "편집 페이지 만들기", "마이 페이지 만들기"],
        //         createdBy: "김상훈"
        //     )
            
        //     User().appendProject(project: data1)
            
        //     let taskData1: ProjectTask = ProjectTask(
        //         task: "메인 페이지 만들기", isCompleted: true, projectName: "Our App Project")
        //     let taskData2: ProjectTask = ProjectTask(
        //         task: "Launch Screen 만들기", isCompleted: false, projectName: "Our App Project")
        //     let taskData3: ProjectTask = ProjectTask(
        //         task: "상세 페이지 만들기", isCompleted: true, projectName: "Our App Project")
        //     let taskData4: ProjectTask = ProjectTask(
        //         task: "편집 페이지 만들기", isCompleted: false, projectName: "Our App Project")
        //     let taskData5: ProjectTask = ProjectTask(
        //         task: "마이 페이지 만들기", isCompleted: false, projectName: "Our App Project")
            
        //     User().appendProjectTask(task: taskData1)
        //     User().appendProjectTask(task: taskData2)
        //     User().appendProjectTask(task: taskData3)
        //     User().appendProjectTask(task: taskData4)
        //     User().appendProjectTask(task: taskData5)
            
        //     User().appendProjectMember(member: "김상훈")
        //     User().appendProjectMember(member: "박인수")
        //     User().appendProjectMember(member: "윤혁진")
        //     User().appendProjectMember(member: "조영현")
        // }
    }
    
    
    // MARK: - Helpers

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
        let nameFilter = UIAction(title: "프로젝트 이름순", image: UIImage(systemName: "textformat.abc"), handler: { _ in
            self.sortCells = .projectName
            self.tableView.reloadData()
        })
        let startDateFilter = UIAction(title: "프로젝트 시작일순", image: UIImage(systemName: "arrow.right.to.line"), handler: { _ in
            self.sortCells = .startDate
            self.tableView.reloadData()
        })
        let endDateFilter = UIAction(title: "프로젝트 종료일순", image: UIImage(systemName: "arrow.left.to.line"), handler: { _ in
            self.sortCells = .endDate
            self.tableView.reloadData()
        })
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: [nameFilter, startDateFilter, endDateFilter])
        let filterImage = UIImage(systemName: "line.3.horizontal.decrease")
        let filterButton = UIBarButtonItem(image: filterImage, menu: menu)
        navigationItem.rightBarButtonItem = filterButton
      }
   
    private func setupSegmentControl() {
        let segments = ["종료된 프로젝트", "진행중인 프로젝트"]
        segmentedControl = UISegmentedControl(items: segments)

        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        self.view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true // TODO: equalTo 네비게이션 바를 기준으로 수정하기
        segmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProjectListCell.self, forCellReuseIdentifier: "ProjectListCell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Action
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        let currentDate = Calendar.current.startOfDay(for: Date())
        
        switch sender.selectedSegmentIndex {
        case 0:
            projectList = dummyProjectList.filter { $0.endDate < currentDate }
            
        case 1:
            projectList = dummyProjectList.filter { $0.endDate >= currentDate }
        
        default:
            break
        }
        
        if let sortOption = sortCells {
            switch sortOption {
            case .projectName:
                projectList.sort { $0.name < $1.name }
            case .startDate:
                projectList.sort { $0.startDate < $1.startDate }
            case .endDate:
                projectList.sort { $0.endDate > $1.endDate }
            }
        }
        
        tableView.reloadData()
        
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return projectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectListCell", for: indexPath) as! ProjectListCell
                    
        
        if let sortOption = sortCells {
            switch sortOption {
            case .projectName:
                projectList.sort { $0.name < $1.name }
            case .startDate:
                projectList.sort { $0.startDate < $1.startDate }
            case .endDate:
                projectList.sort { $0.endDate > $1.endDate }
            }
        }
        
        let project = projectList[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        cell.projectNameLabel.text = project.name
        cell.projectInfoLabel.text =
        """
        소속: \(project.teams.joined(separator: ", "))
        시작: \(dateFormatter.string(from: project.startDate))　/　종료: \(dateFormatter.string(from: project.endDate))
        """
        
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.projectNameLabel.textColor = .gray
            cell.projectInfoLabel.textColor = .gray
        } else {
            cell.projectNameLabel.textColor = .black
            cell.projectInfoLabel.textColor = .black
        }
        
        return cell
    }
    
    
}


