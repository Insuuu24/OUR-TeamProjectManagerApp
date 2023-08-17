//
//  MemberListTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class MemberListTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var memberLabel: UILabel!
    
    
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
}
