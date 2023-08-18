//
//  MemberTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var memberList: [String] = []
    var isCellDeletable: Bool = false
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var memberLabel: UILabel!
    
    @IBOutlet weak var memberStackView: UIStackView!
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var memberAddButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        memberTableView.dataSource = self
        memberTableView.delegate = self
        
        memberTableView.separatorStyle = .none
        
        //        memberTableView.rowHeight = UITableView.automaticDimension
        //        memberTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Method & Action
    func setLabel(name:String){
        memberLabel.text = name
        memberLabel.textColor = .label
        memberLabel.font = .systemFont(ofSize: 15, weight: .regular)
        memberLabel.numberOfLines = 1
        memberLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
    }
    
    func setButton(name:String){
        memberAddButton.setImage(UIImage(systemName: "plus")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        memberAddButton.configuration?.imagePadding = 10

        memberAddButton.setTitle(name, for: .normal)
        memberAddButton.setTitleColor(.label, for: .normal)
        memberAddButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        memberAddButton.contentHorizontalAlignment = .left
    }
    
    func setTableView(){
        if isCellDeletable {
            memberStackView.layer.borderWidth = 0.25
            memberStackView.layer.borderColor = UIColor.lightGray.cgColor
            memberStackView.layer.cornerRadius = 5.0
            
            memberTableView.layer.borderWidth = 0.25
            memberTableView.layer.borderColor = UIColor.lightGray.cgColor
            
        } else {
            memberTableView.layer.borderWidth = 0.25
            memberTableView.layer.borderColor = UIColor.lightGray.cgColor
            memberTableView.layer.cornerRadius = 5.0
        }
    }
}

extension MemberTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberTableView.dequeueReusableCell(withIdentifier: "MemberListTableViewCell", for: indexPath) as! MemberListTableViewCell
        cell.setLabel(name: memberList[indexPath.row])
        
        return cell
    }
}

extension MemberTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if isCellDeletable {
            let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, success) in
                //                self.memberList.remove(at: indexPath.row)
                User.userProject[0].members.remove(at: indexPath.row)
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
