//
//  DateTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateTextField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // MARK: - Method & Action
    func setLabel(name:String){
        dateLabel.text = name
        dateLabel.textColor = .label
        dateLabel.font = .systemFont(ofSize: 15, weight: .regular)
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
    }
    
    func setTextField(date:Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        dateTextField.text = dateFormatter.string(from: date)
        dateTextField.textColor = .label
        dateTextField.font = .systemFont(ofSize: 15, weight: .regular)
        dateTextField.textAlignment = .left
        
        dateTextField.addPaddingAndIcon((UIImage(systemName: "calendar")?.withTintColor(.gray, renderingMode: .alwaysOriginal))!, padding: 10, isLeftView: false)
    }
}

extension DateTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

extension UITextField {
    func addPaddingAndIcon(_ image: UIImage, padding: CGFloat,isLeftView: Bool) {
        let frame = CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height)
        
        let outerView = UIView(frame: frame)
        let iconView  = UIImageView(frame: frame)
        iconView.image = image
        iconView.contentMode = .center
        outerView.addSubview(iconView)
        
        if isLeftView {
          leftViewMode = .always
          leftView = outerView
        } else {
          rightViewMode = .always
          rightView = outerView
        }
        
      }
}

