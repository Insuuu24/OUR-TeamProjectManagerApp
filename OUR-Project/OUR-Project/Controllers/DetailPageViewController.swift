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
    
    // test용 데이터
    let testProjectData: Project = Project(
        name: "Our App Project",
        team: "내일배움캠프 8조",
        startDate: "2023-08-14".toDate() ?? Date(),
        endDate: "2023-08-21".toDate() ?? Date(),
        description: "4명이서 만드는 프로젝트 App",
        member: ["김상훈", "박인수", "윤혁진", "조영현"],
        task: ["test 1", "test 2", "test 3", "test 4", "test 5"]
    )
    
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
        self.title = "Detail Page"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(editDetailPage))
    }
    
    @objc func editDetailPage(){
        // page rfdsnfjklmnskfn
    }
   

}

extension DetailPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: // "프로젝트명"
            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
            cellName.setLabel(name: tableViewList[indexPath.row])
            cellName.setTextField(name: testProjectData.name)
            cellName.setStackView()
            return cellName
        case 1: //"소속"
            let cellName = detailTableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
            cellName.setLabel(name: tableViewList[indexPath.row])
            cellName.setTextField(name: testProjectData.team)
            cellName.setStackView()
            return cellName
        case 2: //"시작 날짜"
            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
            return cellDate
        case 3: //"종료 날짜"
            let cellDate = detailTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
            return cellDate
        case 4: //"프로젝트 설명"
            let cellDescription = detailTableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            return cellDescription
        case 5: //"참여인원"
            let cellMember = detailTableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
            return cellMember
        case 6: //"진행상황"
            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
            return cellProgress
        default:
            print("defalut")
            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
            return cellProgress
        }
    }
}

extension DetailPageViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
}

extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}
