//
//  AffiliationCell.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import UIKit

class AffiliationCell: UITableViewCell {
    
    // MARK: - Properties
    
    let affiliationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        textField.placeholder = "소속을 입력해주세요"
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
        contentView.addSubview(affiliationTextField)

        NSLayoutConstraint.activate([
            affiliationTextField.heightAnchor.constraint(equalToConstant: 40),
            affiliationTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            affiliationTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            affiliationTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with model: AffiliationModel) {
        affiliationTextField.text = model.affiliation
    }

}
