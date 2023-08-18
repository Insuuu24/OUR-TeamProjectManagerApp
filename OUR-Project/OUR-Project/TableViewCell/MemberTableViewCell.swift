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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var memberTableView: UITableView!
    
    
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
    
    func setTableView(){
        memberTableView.layer.borderWidth = 0.25
        memberTableView.layer.borderColor = UIColor.lightGray.cgColor
        memberTableView.layer.cornerRadius = 5.0
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
}
