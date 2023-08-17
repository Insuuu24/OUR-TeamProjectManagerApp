//
//  ProjectEditViewController.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/17.
//

import UIKit

class ProjectEditViewController: UIViewController {
    // MARK: - Properties
    let tableViewList: [String] = ["프로젝트명", "소속", "시작 날짜", "종료 날짜", "프로젝트 설명", "참여인원", "진행상황"]
    let storyboardName = "Main" // 생성된 storyboard의 이름이 "Main"
    let storyboardID = "ProjectEditViewController"
    
    // test용 데이터
    let testProjectData: Project = Project(
        name: "Our App Project",
        team: "내일배움캠프 8조",
        startDate: "2023-08-14".toDate() ?? Date(),
        endDate: "2023-08-21".toDate() ?? Date(),
        description: "4명이서 만드는 프로젝트 App",
        member: ["김상훈", "박인수", "윤혁진", "조영현"],
        task: ["메인 페이지 만들기", "Launch Screen 만들기", "상세 페이지 만들기", "편집 페이지 만들기", "마이 페이지 만들기"]
    )
    let testProjectTask: [Task] = [
        Task(name: "메인 페이지 만들기", isCompleted: true, projectName: "Our App Project"),
        Task(name: "Launch Screen 만들기", isCompleted: false, projectName: "Our App Project"),
        Task(name: "상세 페이지 만들기", isCompleted: true, projectName: "Our App Project"),
        Task(name: "편집 페이지 만들기", isCompleted: false, projectName: "Our App Project"),
        Task(name: "마이 페이지 만들기", isCompleted: true, projectName: "Our App Project")
    ]
    
    @IBOutlet weak var detailTableView: UITableView!
    
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        detailTableView.separatorStyle = .none
    }
    

    // MARK: - Navigation Bar
    private func setupNavigationBar() {
        self.title = "Project Edit Page"
    }

}

extension ProjectEditViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: // "프로젝트명"
            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
            cellName.selectionStyle = UITableViewCell.SelectionStyle.none // 셀 선택 효과 없애기
            cellName.setLabel(name: tableViewList[indexPath.row])
            cellName.setTextField(name: testProjectData.name)
            cellName.setStackView()
            return cellName
        case 1: //"소속"
            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
            cellName.selectionStyle = UITableViewCell.SelectionStyle.none
            cellName.setLabel(name: tableViewList[indexPath.row])
            cellName.setTextField(name: testProjectData.team)
            cellName.setStackView()
            return cellName
        case 2: //"시작 날짜"
            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
            cellDate.selectionStyle = UITableViewCell.SelectionStyle.none
            cellDate.setLabel(name: tableViewList[indexPath.row])
            cellDate.setTextField(date: testProjectData.startDate)
            cellDate.setStackView()
            return cellDate
        case 3: //"종료 날짜"
            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
            cellDate.selectionStyle = UITableViewCell.SelectionStyle.none
            cellDate.setLabel(name: tableViewList[indexPath.row])
            cellDate.setTextField(date: testProjectData.endDate)
            cellDate.setStackView()
            return cellDate
        case 4: //"프로젝트 설명"
            let cellDescription = detailTableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            cellDescription.selectionStyle = UITableViewCell.SelectionStyle.none
            cellDescription.setLabel(name: tableViewList[indexPath.row])
            cellDescription.setTextView(description: testProjectData.description)
            cellDescription.setStackView()
            return cellDescription
        case 5: //"참여인원"
            let cellMember = detailTableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
            cellMember.selectionStyle = UITableViewCell.SelectionStyle.none
            cellMember.setLabel(name: String(tableViewList[indexPath.row]  + " - \(testProjectData.member.count)명"))
            cellMember.memberList = testProjectData.member
            cellMember.setStackView()
            cellMember.setTableView()
            return cellMember
        case 6: //"진행상황"
            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
            cellProgress.selectionStyle = UITableViewCell.SelectionStyle.none
            cellProgress.setLabel(name: tableViewList[indexPath.row])
            cellProgress.progressList = testProjectData.task
            
            var taskisCompleted: [Bool] = []
            for i in 0..<testProjectTask.count{
                taskisCompleted.append(testProjectTask[i].isCompleted)
            }
            cellProgress.progressState = taskisCompleted
            cellProgress.setStackView()
            cellProgress.setTableView()
//            cellProgress.setStackView()
            return cellProgress
        default:
            print("defalut")
            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
            cellProgress.selectionStyle = UITableViewCell.SelectionStyle.none
            return cellProgress
        }
    }
}

extension ProjectEditViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
}
