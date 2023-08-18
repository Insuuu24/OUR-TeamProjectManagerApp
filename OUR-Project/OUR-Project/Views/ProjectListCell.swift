//
//  ProjectListCell.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/16.
//

import UIKit

class ProjectListCell: UITableViewCell {
    
    // MARK: - Properties
    
    let projectNameLabel: UILabel = {
        let nl = UILabel()
        nl.font = UIFont.systemFont(ofSize: 14)
        return nl
    }()
    
    let projectIsJoinedBadge: UIButton = {
        let jpb = UIButton()
        jpb.setTitle("내가 참여중인", for: .normal)
        jpb.setTitleColor(UIColor(red: 0.3569, green: 0.3255, blue: 0.1373, alpha: 1.0), for: .normal) // #5B5323
        jpb.backgroundColor = UIColor(red: 0.8667, green: 0.8509, blue: 0.7725, alpha: 1.0) // #DDD9C5
        jpb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        jpb.layer.cornerRadius = 15
        jpb.layer.masksToBounds = true
        return jpb
    }()
    
    let projectAffiliationLabel: UILabel = {
        let il = UILabel()
        il.font = UIFont.systemFont(ofSize: 10)
        il.numberOfLines = 0
        il.lineBreakMode = .byWordWrapping
        return il
    }()
    
    let dateLabel: UILabel = {
        let dl = UILabel()
        dl.font = UIFont.systemFont(ofSize: 10)
        dl.numberOfLines = 1
        dl.lineBreakMode = .byWordWrapping
        dl.textColor = UIColor(red: 0.36, green: 0.33, blue: 0.14, alpha: 1.00) // #5B5323
        return dl
    }()
    
    private let rightButton: UIButton = {
        let rb = UIButton()
        rb.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        rb.tintColor = UIColor(red: 0.36, green: 0.33, blue: 0.14, alpha: 1.00) // #5B5323
        return rb
    }()

    private lazy var projectNameAndBadgeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private lazy var affiliationAndDateStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
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
        projectNameAndBadgeStack.addArrangedSubview(projectNameLabel)
        projectNameAndBadgeStack.addArrangedSubview(projectIsJoinedBadge)

        affiliationAndDateStack.addArrangedSubview(projectAffiliationLabel)
        affiliationAndDateStack.addArrangedSubview(dateLabel)

        mainStack.addArrangedSubview(projectNameAndBadgeStack)
        mainStack.addArrangedSubview(affiliationAndDateStack)
        
        contentView.addSubview(mainStack)
        contentView.addSubview(rightButton)

        mainStack.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        projectIsJoinedBadge.widthAnchor.constraint(equalToConstant: 70).isActive = true

        projectAffiliationLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        projectAffiliationLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)

        dateLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -10),
            
            rightButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rightButton.widthAnchor.constraint(equalToConstant: 30),
            rightButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }


    
    // 프로젝트 시작 및 종료 날짜를 설정하는 함수
    func setProjectDate(startDate: Date, endDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = "시작: \(formatter.string(from: startDate)) / 종료: \(formatter.string(from: endDate))"
    }
}
