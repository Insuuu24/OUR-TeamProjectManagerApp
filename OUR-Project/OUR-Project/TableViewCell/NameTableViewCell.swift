//
//  NameTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    // MARK: - Properties

    var editState: Bool = false // 수정 여부 확인용 변수
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameTextField.delegate = self
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
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
    }
    
    func setNameTextField(name:String){
        nameTextField.text = name
        nameTextField.textColor = .label
        nameTextField.font = .systemFont(ofSize: 15, weight: .regular)
        nameTextField.textAlignment = .left
    }
    
    func setTeamTextField(name:[String]){
        var nameString: String = ""
        
        for i in 0..<name.count {
            if i == name.count-1 {
                nameString += name[i]
            } else {
                nameString += name[i] + ", "
            }
        }
        nameTextField.text = nameString
        nameTextField.textColor = .label
        nameTextField.font = .systemFont(ofSize: 15, weight: .regular)
        nameTextField.textAlignment = .left
    }
}

extension NameTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return editState // textField 변경 불가
    }
}
