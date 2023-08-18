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
    
    @IBOutlet weak var detailTableView: UITableView!
    
    // test용 데이터
    var testProjectData: Project = User.userProject[0]
    var testProjectTask: [ProjectTask] = User.userProjectTask
    
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
    
    
    // MARK: - Method & Action
    @IBAction func test(_ sender: Any) {
        let alert = UIAlertController(title: "진행 목록 추가", message: "프로젝트 진행 일정을 추가해주세요.", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "진행"
        }
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            guard let text = alert.textFields?[0].text else { return }
            if text != "" {
                print("데이터 추가 : \(text)")
                self.testProjectData.tasks.append(text)
                self.detailTableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
            
            cellName.editState = true
            
            cellName.setLabel(name: tableViewList[indexPath.row])
            cellName.setNameTextField(name: testProjectData.name)
            cellName.setStackView()
            
            return cellName
        case 1: //"소속"
            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
            cellName.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cellName.editState = false
            
            cellName.setLabel(name: tableViewList[indexPath.row])
            cellName.setTeamTextField(name: testProjectData.teams)
            cellName.setStackView()
            
            return cellName
        case 2: //"시작 날짜"
            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
            cellDate.selectionStyle = UITableViewCell.SelectionStyle.none
            cellDate.setLabel(name: tableViewList[indexPath.row])
            cellDate.setTextField(date: testProjectData.startDate)
            cellDate.setStackView()
            
            cellDate.setupDatePicker(date: testProjectData.startDate)
            cellDate.setupToolBar()
            
            return cellDate
        case 3: //"종료 날짜"
            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
            cellDate.selectionStyle = UITableViewCell.SelectionStyle.none
            cellDate.setLabel(name: tableViewList[indexPath.row])
            cellDate.setTextField(date: testProjectData.endDate)
            cellDate.setStackView()
            
            cellDate.setupDatePicker(date: testProjectData.endDate)
            cellDate.setupToolBar()
            
            return cellDate
        case 4: //"프로젝트 설명"
            let cellDescription = detailTableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            cellDescription.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cellDescription.editState = true
            
            cellDescription.setLabel(name: tableViewList[indexPath.row])
            cellDescription.setTextView(description: testProjectData.description)
            cellDescription.setStackView()
            
            return cellDescription
        case 5: //"참여인원"
            let cellMember = detailTableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
            cellMember.selectionStyle = UITableViewCell.SelectionStyle.none
            cellMember.setLabel(name: String(tableViewList[indexPath.row]  + " - \(testProjectData.members.count)명"))
            cellMember.memberList = testProjectData.members
            cellMember.setStackView()
            cellMember.setTableView()
            return cellMember
        case 6: //"진행상황"
            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
            cellProgress.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cellProgress.editState = true
            
            cellProgress.setLabel(name: tableViewList[indexPath.row])
            cellProgress.progressList = testProjectData.tasks
            
            var taskisCompleted: [Bool] = []
            for i in 0..<testProjectTask.count{
                taskisCompleted.append(testProjectTask[i].isCompleted)
            }
            cellProgress.progressState = taskisCompleted
            cellProgress.setStackView()
            cellProgress.setTableView()

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
