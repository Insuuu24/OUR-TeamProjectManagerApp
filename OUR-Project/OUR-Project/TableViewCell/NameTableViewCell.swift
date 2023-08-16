//
//  NameTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
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
        nameLabel.text = name
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 15, weight: .regular)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
    }
    
    func setTextField(name:String){
        nameTextField.text = name
        nameTextField.textColor = .label
        nameTextField.font = .systemFont(ofSize: 15, weight: .regular)
        nameTextField.textAlignment = .left
    }
}
