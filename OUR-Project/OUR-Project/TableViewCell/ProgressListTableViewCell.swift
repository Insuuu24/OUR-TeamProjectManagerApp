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
        
        let nameString = NSMutableAttributedString(string: name)
        
        if state {
            nameString.setAttributedString(name.strikeThrough())
        } else {
            nameString.setAttributedString(name.clear())
        }
        nameString.addAttribute(.foregroundColor, value: UIColor.label, range: NSRange(location: 0, length: name.count))
        checkButton.setAttributedTitle(nameString, for: .normal)
        checkButton.setTitle(name, for: .normal)
        checkButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        checkButton.contentHorizontalAlignment = .left
        
        checkButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside) // 클릭 이벤트 지정
    }
    
    // MARK: - [버튼 클릭 이벤트]
    @objc func buttonAction(sender: UIButton!) {
        let name:String = sender.currentTitle ?? "name is nil"
        print("name : \(name)")
        
        let nameString = NSMutableAttributedString(string: name)
        
        if checkButton.isChecked {
            print("isChecked")
            nameString.setAttributedString(name.strikeThrough())
        } else {
            print("!isChecked")
            nameString.setAttributedString(name.clear())
        }
        
        nameString.addAttribute(.foregroundColor, value: UIColor.label, range: NSRange(location: 0, length: name.count))
        checkButton.setAttributedTitle(nameString, for: .normal)
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    func clear() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, 0))
        return attributeString
    }
}
