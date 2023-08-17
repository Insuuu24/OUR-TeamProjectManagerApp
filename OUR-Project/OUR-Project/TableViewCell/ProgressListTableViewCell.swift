//
//  ProgressListTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class ProgressListTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var checkButton: CheckBox!
    
    
    
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
    func setButton(state:Bool, name:String){
        checkButton.isChecked = state
        checkButton.setTitle(name, for: .normal)
        checkButton.setTitleColor(.label, for: .normal)
        checkButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        checkButton.contentHorizontalAlignment = .left
    }
}
