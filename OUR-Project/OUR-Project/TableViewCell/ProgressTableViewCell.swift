//
//  ProgressTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var editState: Bool = false // 수정 여부 확인용 변수
    
    var progressList: [String] = []
    var progressState: [Bool] = []
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressStackView: UIStackView!
    @IBOutlet weak var progressTableView: UITableView!
    @IBOutlet weak var progressAddButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressTableView.dataSource = self
        progressTableView.delegate = self
        
        progressTableView.separatorStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // MARK: - Method & Action
    func setLabel(name:String){
        progressLabel.text = name
        progressLabel.textColor = .label
        progressLabel.font = .systemFont(ofSize: 15, weight: .regular)
        progressLabel.numberOfLines = 1
        progressLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
        
        print("editState : \(editState)")
    }
    
    func setTableView(){
        if editState {
            progressStackView.layer.borderWidth = 0.25
            progressStackView.layer.borderColor = UIColor.lightGray.cgColor
            progressStackView.layer.cornerRadius = 5.0
        } else {
            progressTableView.layer.borderWidth = 0.25
            progressTableView.layer.borderColor = UIColor.lightGray.cgColor
            progressTableView.layer.cornerRadius = 5.0
        }
    }
    
//    func setButton(name:String){
//        progressAddButton.setTitle(name, for: .normal)
//        progressAddButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
//        progressAddButton.contentHorizontalAlignment = .left
//
//        progressAddButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside) // 클릭 이벤트 지정
//    }
//
//    // MARK: - [버튼 클릭 이벤트]
//    @objc func buttonAction(sender: UIButton!) {
//        
//    }
}

extension ProgressTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = progressTableView.dequeueReusableCell(withIdentifier: "ProgressListTableViewCell", for: indexPath) as! ProgressListTableViewCell
        
        cell.setButton(state: progressState[indexPath.row], name: progressList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        print("editingStyle : \(editingStyle)")
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            User.userProject[0].tasks.remove(at: indexPath.row)
            User.userProjectTask.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
//        else if editingStyle == .insert {
//            print("style insert")
//        }
    }
}

extension ProgressTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
