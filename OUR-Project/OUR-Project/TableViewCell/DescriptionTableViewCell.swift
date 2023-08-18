//
//  DescriptionTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    var editState: Bool = false // 수정 여부 확인용 변수
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        descriptionTextView.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setLabel(name:String){
        descriptionLabel.text = name
        descriptionLabel.textColor = .label
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.numberOfLines = 1
        descriptionLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
    }
    
    // MARK: - Method & Action
    func setTextView(description: String) {
        descriptionTextView.text = description
        descriptionTextView.textColor = .black
        descriptionTextView.font = .systemFont(ofSize: 15)
        
        descriptionTextView.textContainer.maximumNumberOfLines = 0
        descriptionTextView.textContainer.lineFragmentPadding = 0
        
        descriptionTextView.layer.borderWidth = 0.25
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 5.0
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    }
}

extension DescriptionTableViewCell:UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return editState
    }
}
