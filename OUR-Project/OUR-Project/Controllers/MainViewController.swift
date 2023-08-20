//
//  ViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    
    var selectedUser: UserSelect?
    var projectList = dummyProjectList
    
    private var ProjectListTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
        return tableView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segments = ["종료된 프로젝트", "진행중인 프로젝트"]
        let segmentedControl = UISegmentedControl(items: segments)

        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)

        return segmentedControl
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
     
        setupNavigationBar()
        setupTableView()
    }
    
    
    // MARK: - Helpers

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.shadowColor = nil

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

        let menu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: createFilterActions(selectedFilter: nil))
        let filterImage = UIImage(systemName: "line.3.horizontal.decrease")
        let filterButton = UIBarButtonItem(image: filterImage, menu: menu)
        navigationItem.rightBarButtonItem = filterButton
        setupRightBarButtonItem(nil)
    }

    private func createFilterActions(selectedFilter: String?) -> [UIAction] {
        let nameFilter = UIAction(title: selectedFilter == "byName" ? "✓ 프로젝트 이름순" : "프로젝트 이름순", image: UIImage(systemName: "textformat.abc")) { _ in
            if selectedFilter == "byName" {
                self.setupRightBarButtonItem(nil)
            } else {
                self.projectList.sort { $0.projectName < $1.projectName }
                self.setupRightBarButtonItem("byName")
            }
            self.ProjectListTableView.reloadData()
        }

        let startDateFilter = UIAction(title: selectedFilter == "byStartDate" ? "✓ 프로젝트 시작일순" : "프로젝트 시작일순", image: UIImage(systemName: "arrow.right.to.line")) { _ in
            if selectedFilter == "byStartDate" {
                self.setupRightBarButtonItem(nil)
            } else {
                self.projectList.sort { $0.startDate < $1.startDate }
                self.setupRightBarButtonItem("byStartDate")
            }
            self.ProjectListTableView.reloadData()
        }

        let endDateFilter = UIAction(title: selectedFilter == "byEndDate" ? "✓ 프로젝트 종료일순" : "프로젝트 종료일순", image: UIImage(systemName: "arrow.left.to.line")) { _ in
            if selectedFilter == "byEndDate" {
                self.setupRightBarButtonItem(nil)
            } else {
                self.projectList.sort { $0.endDate > $1.endDate }
                self.setupRightBarButtonItem("byEndDate")
            }
            self.ProjectListTableView.reloadData()
        }

        return [nameFilter, startDateFilter, endDateFilter]
    }


    private func setupRightBarButtonItem(_ selectedFilter: String?) {
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: createFilterActions(selectedFilter: selectedFilter))
        let filterImage = UIImage(systemName: "line.3.horizontal.decrease")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: filterImage, menu: menu)
    }


    private func setupTableView() {
        view.addSubview(ProjectListTableView)
        view.addSubview(segmentedControl)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        ProjectListTableView.dataSource = self
        ProjectListTableView.delegate = self
        ProjectListTableView.register(ProjectListCell.self, forCellReuseIdentifier: "ProjectListCell")

        ProjectListTableView.estimatedRowHeight = 100
        ProjectListTableView.rowHeight = UITableView.automaticDimension

        ProjectListTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ProjectListTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            ProjectListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ProjectListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ProjectListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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

        ProjectListTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return projectList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectListCell", for: indexPath) as! ProjectListCell
        let project = projectList[indexPath.row]

        cell.projectNameLabel.text = project.projectName
        cell.projectAffiliationLabel.text = "소속: \(project.affiliation)"
        cell.setProjectDate(startDate: project.startDate, endDate: project.endDate)

        let textColor: UIColor = segmentedControl.selectedSegmentIndex == 0 ? .lightGray : .black
        cell.projectNameLabel.textColor = textColor
        cell.projectAffiliationLabel.textColor = textColor
        cell.dateLabel.textColor = textColor

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailPageViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, view, completion) in
            self.projectList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

