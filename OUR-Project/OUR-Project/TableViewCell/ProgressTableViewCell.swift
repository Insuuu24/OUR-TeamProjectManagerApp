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
    var isCellDeletable: Bool = false
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressStackView: UIStackView!
    @IBOutlet weak var progressTableView: UITableView!
    @IBOutlet weak var progressAddButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("ProgressTableViewCell awakeFromNib")
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
}

extension ProgressTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("progressList.count : \(progressList.count)")
        return progressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = progressTableView.dequeueReusableCell(withIdentifier: "ProgressListTableViewCell", for: indexPath) as! ProgressListTableViewCell
        print("indexPath.row : \(indexPath.row)")
        
        cell.progressIndex = indexPath.row
        
        cell.setButton(state: progressState[indexPath.row], name: progressList[indexPath.row])
        
        return cell
    }
}

extension ProgressTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if isCellDeletable {
            let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, success) in
                self.progressList.remove(at: indexPath.row)
                tableView.reloadData()
                success(true)
            }
            delete.backgroundColor = UIColor(red: 0.5412, green: 0.4902, blue: 0.2157, alpha: 1.0)
            delete.title = "삭제"
            
            return UISwipeActionsConfiguration(actions: [delete])
        }
        return nil
    }
}
