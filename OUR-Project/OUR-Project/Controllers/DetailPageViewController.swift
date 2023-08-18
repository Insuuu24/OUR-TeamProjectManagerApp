//
//  DetailPageViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class DetailPageViewController: UIViewController {
    // MARK: - Properties
    let tableViewList: [String] = ["프로젝트명", "소속", "시작 날짜", "종료 날짜", "프로젝트 설명", "참여인원", "진행상황"]
    let storyboardName = "Main" // 생성된 storyboard의 이름이 "Main"
    let storyboardID = "DetailPageViewController"

    var memberList = dummyMemberList
    var projectList = dummyProjectList
    var projectTaskList = dummyProjectTaskList
    
    @IBOutlet weak var detailTableView: UITableView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
//        detailTableView.dataSource = self
//        detailTableView.delegate = self
//        
        detailTableView.separatorStyle = .none
    }
    

    // MARK: - Navigation Bar
    private func setupNavigationBar() {
        self.title = "Detail Page"
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(editDetailPage))
    }
    
//    @objc func editDetailPage(){
//        // page 이동 함수
//        let projectEditViewController = ProjectEditViewController()
//        let storyboardName = projectEditViewController.storyboardName
//        let storyboardID = projectEditViewController.storyboardID
//
//        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main) // Main.stroyboard와 연동하는 작업 (변수에 담는 작업)
//        guard let viewController = storyboard.instantiateViewController(identifier: storyboardID) as? ProjectEditViewController else { return }
//
//        navigationController?.pushViewController(viewController, animated: true)
//    }
   

    // MARK: - Method & Action
    
    
    
    
    
    
}

//extension DetailPageViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tableViewList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0: // "프로젝트명"
//            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
//            cellName.selectionStyle = UITableViewCell.SelectionStyle.none // 셀 선택 효과 없애기
//            cellName.setLabel(name: tableViewList[indexPath.row])
//            //cellName.setTextField(name: projectList[0].name)
//            cellName.setStackView()
//            return cellName
//        case 1: //"소속"
//            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
//            cellName.selectionStyle = UITableViewCell.SelectionStyle.none
//            cellName.setLabel(name: tableViewList[indexPath.row])
//            //cellName.setTextField(name: projectList[0].teams[0])
//            cellName.setStackView()
//            return cellName
//        case 2: //"시작 날짜"
//            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
//            cellDate.selectionStyle = UITableViewCell.SelectionStyle.none
//            cellDate.setLabel(name: tableViewList[indexPath.row])
//            cellDate.setTextField(date: projectList[0].startDate)
//            cellDate.setStackView()
//            return cellDate
//        case 3: //"종료 날짜"
//            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
//            cellDate.selectionStyle = UITableViewCell.SelectionStyle.none
//            cellDate.setLabel(name: tableViewList[indexPath.row])
//            cellDate.setTextField(date: projectList[0].endDate)
//            cellDate.setStackView()
//            return cellDate
//        case 4: //"프로젝트 설명"
//            let cellDescription = detailTableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
//            cellDescription.selectionStyle = UITableViewCell.SelectionStyle.none
//            cellDescription.setLabel(name: tableViewList[indexPath.row])
//            //cellDescription.setTextView(description: projectList[0].description)
//            cellDescription.setStackView()
//            return cellDescription
//        case 5: //"참여인원"
//            let cellMember = detailTableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
//            cellMember.selectionStyle = UITableViewCell.SelectionStyle.none
//            //cellMember.setLabel(name: String(tableViewList[indexPath.row]  + " - \(projectList[0].members.count)명"))
//            //cellMember.memberList = projectList[0].members
//            cellMember.setStackView()
//            cellMember.setTableView()
//            return cellMember
//        case 6: //"진행상황"
//            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
//            cellProgress.selectionStyle = UITableViewCell.SelectionStyle.none
//            cellProgress.setLabel(name: tableViewList[indexPath.row])
//            //cellProgress.progressList = projectList[0].tasks
//            
//            var taskisCompleted: [Bool] = []
//            for i in 0..<projectList.count{
//                taskisCompleted.append(projectTaskList[i].isCompleted)
//            }
//            cellProgress.progressState = taskisCompleted
//            cellProgress.setStackView()
//            cellProgress.setTableView()
////            cellProgress.setStackView()
//            return cellProgress
//        default:
//            print("defalut")
//            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
//            cellProgress.selectionStyle = UITableViewCell.SelectionStyle.none
//            return cellProgress
//        }
//    }
//}
//
//extension DetailPageViewController: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return 50
////    }
//}
//
//extension String {
//    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        dateFormatter.timeZone = TimeZone(identifier: "UTC")
//        if let date = dateFormatter.date(from: self) {
//            return date
//        } else {
//            return nil
//        }
//    }
//}
