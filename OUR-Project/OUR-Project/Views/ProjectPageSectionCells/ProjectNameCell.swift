//
//  ProjectNameCell.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import UIKit

class ProjectNameCell: UITableViewCell {

    // MARK: - Properties
    
    let projectNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        textField.placeholder = "프로젝트 이름을 입력해주세요"
        textField.layer.cornerRadius = 10
        return textField
    }()

    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    
    private func setupViews() {
        contentView.addSubview(projectNameTextField)

        NSLayoutConstraint.activate([
            projectNameTextField.heightAnchor.constraint(equalToConstant: 40),
            projectNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            projectNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            projectNameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with model: ProjectNameModel) {
        projectNameTextField.text = model.projectName
    }
}

