//
//  ProjectAddViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class ProjectAddViewController: UIViewController {
    
    // MARK: - Properties
    
    private let projectAddTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var dataSource = [ProjectPageSection]()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
        setupTableView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        dataSource = [
            .projectName(ProjectNameModel(projectName: "프로젝트 넘나리 빡센것..")),
            .affiliations(AffiliationModel(affiliation: "8조")),
            .startDates(StartDateModel(startDate: "2023-08-18", datePickerAction: {})),
            .endDates(EndDateModel(endDate: "2023-08-25", datePickerAction: {})),
            .userAttends(UserAttendModel(user: UserSelect(name: "ㄴㅁ언모ㅓㅏㄹㄴ모ㅓㅏㄹ", icon: UIImage(named: "userIcon")))),
            .progressList(ProgressListModel(checkBox: {}, list: "언제끝나지..", isChecked: false))
        ]
    }
    

    // MARK: - Helpers
    
    func setupNavigationBar() {
        navigationItem.title = "신규 프로젝트"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView() {
        view.addSubview(projectAddTableView)
        
        projectAddTableView.delegate = self
        projectAddTableView.dataSource = self
        
        projectAddTableView.register(ProjectNameCell.self, forCellReuseIdentifier: "ProjectNameCell")
        projectAddTableView.register(AffiliationCell.self, forCellReuseIdentifier: "AffiliationCell")
        projectAddTableView.register(StartDateCell.self, forCellReuseIdentifier: "StartDateCell")
        projectAddTableView.register(EndDateCell.self, forCellReuseIdentifier: "EndDateCell")
        projectAddTableView.register(UserAttendCell.self, forCellReuseIdentifier: "UserAttendCell")
        projectAddTableView.register(ProgressListCell.self, forCellReuseIdentifier: "ProgressListCell")

        projectAddTableView.estimatedRowHeight = 100
        projectAddTableView.rowHeight = UITableView.automaticDimension
        
        projectAddTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            projectAddTableView.topAnchor.constraint(equalTo: view.topAnchor),
            projectAddTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            projectAddTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            projectAddTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    // MARK: - Action
    
    @objc func saveButtonTapped() {
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension ProjectAddViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.section] {
        case .projectName(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectNameCell", for: indexPath) as! ProjectNameCell
            cell.configure(with: model)
            return cell

        case .affiliations(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AffiliationCell", for: indexPath) as! AffiliationCell
            cell.configure(with: model)
            return cell

        case .startDates(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "StartDateCell", for: indexPath) as! StartDateCell
            cell.configure(with: model)
            return cell

        case .endDates(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "EndDateCell", for: indexPath) as! EndDateCell
            cell.configure(with: model)
            return cell

        case .userAttends(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserAttendCell", for: indexPath) as! UserAttendCell
            cell.configure(with: model)
            return cell

        case .progressList(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressListCell", for: indexPath) as! ProgressListCell
            cell.configure(with: model)
            return cell
        }
    }
    
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 14)
        headerLabel.textColor = UIColor(red: 0.36, green: 0.33, blue: 0.14, alpha: 1.00)
        
        headerView.addSubview(headerLabel)

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        switch dataSource[section] {
        case .projectName(_):
            headerLabel.text = "프로젝트 이름"
        case .affiliations(_):
            headerLabel.text = "소속"
        case .startDates(_):
            headerLabel.text = "시작 날짜"
        case .endDates(_):
            headerLabel.text = "종료 날짜"
        case .userAttends(_):
            headerLabel.text = "참석자"
        case .progressList(_):
            headerLabel.text = "진행 사항"
        }

        return headerView
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30 // 원하는 높이를 반환
    }
    
    
}
