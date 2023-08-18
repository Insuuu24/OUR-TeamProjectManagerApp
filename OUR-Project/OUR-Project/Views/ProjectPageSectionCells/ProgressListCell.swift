//
//  ProgressListCell.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import UIKit

class ProgressListCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var checkBoxAction: (() -> Void)?
    
    // 체크박스 버튼 정의
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        return button
    }()
    
    // 할일 레이블 정의
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Initializers
    
    // 초기화 함수
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func setupViews() {
        // 체크박스 버튼과 레이블을 셀에 추가
        contentView.addSubview(checkBoxButton)
        contentView.addSubview(taskLabel)
        
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkBoxButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkBoxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 20),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 20),
            
            taskLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 16),
            taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])


    }
    
    @objc private func checkBoxTapped() {
        checkBoxButton.isSelected = !checkBoxButton.isSelected
        
        if checkBoxButton.isSelected {
            checkBoxButton.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        } else {
            checkBoxButton.tintColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.00)
        }
        checkBoxAction?()
    }
    
    func configure(with model: ProgressListModel) {
        taskLabel.text = model.list
        checkBoxButton.isSelected = model.isChecked
        checkBoxAction = model.checkBox
    }
}

