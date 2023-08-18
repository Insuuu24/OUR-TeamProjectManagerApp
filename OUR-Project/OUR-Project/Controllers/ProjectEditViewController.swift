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
      self.title = "프로젝트 편집"
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelConfirm))
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)

        let saveButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveConfirm))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
      
    }
    @objc func cancelConfirm(){
      // TODO: 이전화면으로 돌아가기전에 변경사항 다 취소시키는 로직 작성 필요
      navigationController?.popViewController(animated: true)
    }
    @objc func saveConfirm(){
      // TODO: 변경사항들 다 저장하는 로직 작성 필요
      navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Method & Action
    
    @IBAction func addMember(_ sender: Any) {
        let alert = UIAlertController(title: "팀 멤버", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        alert.view.addSubview(pickerFrame)
        pickerFrame.delegate = self
        pickerFrame.dataSource = self
        
        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (UIAlertAction) in
            self.detailTableView.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addTask(_ sender: Any) {
        let alert = UIAlertController(title: "진행 목록 추가", message: "프로젝트 진행 일정을 추가해주세요.", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "진행"
        }
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            guard let text = alert.textFields?[0].text else { return }
            if text != "" {
                print("데이터 추가 : \(text)")
                User.userProject[0].tasks.append(text)
                User.userProjectTask.append(
                    ProjectTask(
                        task: text, isCompleted: false, projectName: "Our App Project")
                )
                self.detailTableView.reloadData()
                //                ProgressTableViewCell().progressTableView.reloadData()
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
            
            cellMember.isCellDeletable = true
            
            cellMember.setLabel(name: tableViewList[indexPath.row])
            cellMember.setButton(name: "멤버 추가")
            cellMember.memberList = User.userProject[0].members
            
            cellMember.setStackView()
            cellMember.setTableView()
            
            cellMember.memberTableView.reloadData()
            
            return cellMember
        case 6: //"진행상황"
            let cellProgress = detailTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
            cellProgress.selectionStyle = UITableViewCell.SelectionStyle.none
            
            cellProgress.editState = true
            cellProgress.isCellDeletable = true
            
            cellProgress.setLabel(name: tableViewList[indexPath.row])
            cellProgress.setButton(name: "할일 추가")
            cellProgress.progressList = User.userProject[0].tasks
            var taskisCompleted: [Bool] = []
            for i in 0..<User.userProjectTask.count{
                taskisCompleted.append(User.userProjectTask[i].isCompleted)
            }
            cellProgress.progressState = taskisCompleted
            cellProgress.setStackView()
            cellProgress.setTableView()
            
            cellProgress.progressTableView.reloadData()
            
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

extension ProjectEditViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return memberCount().count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return memberCount()[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        User.userProject[0].members.append(User.proejectMember[row])
    }
    
    // 총 인원에서 등록된 인원을 뺀 것
    func memberCount() -> [String]{
        var member: [String] = []
        for i in User.proejectMember {
            if User.userProject[0].members.contains(i) == false {
                member.append(i)
            }
        }
        return member
    }
}
