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
    
    let datePicker = UIDatePicker()
    
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
    
    func setupDatePicker(date:Date) {
        // datePickerModed에는 time, date, dateAndTime, countDownTimer가 존재
        datePicker.datePickerMode = .date
        // datePicker 스타일을 설정합니다. wheels, inline, compact, automatic이 존재
        datePicker.preferredDatePickerStyle = .inline
        // 원하는 언어로 지역 설정도 가능
        datePicker.locale = Locale(identifier: "ko-KR")
        // 값이 변할 때마다 동작을 설정
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        // textField의 inputView가 nil이라면 기본 할당은 키보드
        datePicker.date = date
        dateTextField.inputView = datePicker
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        dateTextField.text = dateFormatter.string(from: date)
    }
    
    // 값이 변할 때 마다 동작
    @objc func dateChange(_ sender: UIDatePicker) {
        // 값이 변하면 UIDatePicker에서 날짜를 받아와 형식을 변형해서 textField에 넣어줍니다.
        dateTextField.text = dateFormat(date: sender.date)
    }
    
    // 텍스트 필드에 들어갈 텍스트를 DateFormatter 변환
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter.string(from: date)
    }
    
    // 툴바 세팅
    func setupToolBar() {
        let toolBar = UIToolbar()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandeler))
        
        toolBar.items = [flexibleSpace, doneButton]
        // 적절한 사이즈로 toolBar의 크기를 만들어 줍니다.
        toolBar.sizeToFit()
        
        // textField의 경우 클릭 시 키보드 위에 AccessoryView가 표시된다고 합니다.
        // 현재 inputView를 datePicker로 만들어 줬으니 datePicker위에 표시되겠죠?
        dateTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonHandeler(_ sender: UIBarButtonItem) {
        dateTextField.text = dateFormat(date: datePicker.date)
        // 키보드 내리기
        dateTextField.resignFirstResponder()
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

