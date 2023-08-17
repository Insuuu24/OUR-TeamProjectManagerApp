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
    
    let projectInfoLabel: UILabel = {
        let il = UILabel()
        il.font = UIFont.systemFont(ofSize: 10)
       il.numberOfLines = 0
        il.lineBreakMode = .byWordWrapping
        return il
    }()
    
    private let projectProgressBar: UIProgressView = {
       let pb = UIProgressView()
        pb.progressViewStyle = .bar
        pb.progressTintColor = UIColor(red: 0.3569, green: 0.3255, blue: 0.1373, alpha: 1.0) // #5B5323
        pb.trackTintColor = UIColor(red: 0.7647, green: 0.7569, blue: 0.7255, alpha: 1.0) // #C3C1B9
        pb.transform = pb.transform.scaledBy(x: 1, y: 2)
        return pb
    }()
    
    private let projectTaskCompletionLabel: UILabel = {
       let tcl = UILabel()
        tcl.font = UIFont.systemFont(ofSize: 8)
        tcl.text = "0%"
        return tcl
    }()
    
    private let joinedProjectBadge: UIButton = {
        let jpb = UIButton()
        jpb.setTitle("　내가 참여중인　", for: .normal)
        jpb.setTitleColor(UIColor(red: 0.3569, green: 0.3255, blue: 0.1373, alpha: 1.0), for: .normal) // #5B5323
        jpb.backgroundColor = UIColor(red: 0.8667, green: 0.8509, blue: 0.7725, alpha: 1.0) // #DDD9C5
        jpb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        jpb.layer.cornerRadius = 10
        jpb.layer.masksToBounds = true
        return jpb
    }()
    
    private let rightButton: UIButton = {
       let rb = UIButton()
        rb.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        rb.tintColor = UIColor(red: 0.36, green: 0.33, blue: 0.14, alpha: 1.00) // #5B5323
        return rb
    }()
    
    private let spacer: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return view
    }()
    
    private let projectNameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return stack
    }()
    
    private let progressStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return stack
    }()
    
    private let leftSideStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        stack.isLayoutMarginsRelativeArrangement = true
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
        contentView.addSubview(mainStackView)

        projectNameStack.addArrangedSubview(projectNameLabel)
        projectNameStack.addArrangedSubview(joinedProjectBadge)
    
        progressStack.addArrangedSubview(projectProgressBar)
        progressStack.addArrangedSubview(projectTaskCompletionLabel)
        
        leftSideStack.addArrangedSubview(projectNameStack)
        leftSideStack.addArrangedSubview(spacer)
        leftSideStack.addArrangedSubview(projectInfoLabel)
        leftSideStack.addArrangedSubview(progressStack)
        
        mainStackView.addArrangedSubview(leftSideStack)
        mainStackView.addArrangedSubview(rightButton)
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            projectNameLabel.widthAnchor.constraint(equalToConstant: 200),
            rightButton.centerYAnchor.constraint(equalTo: mainStackView.centerYAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: 15),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contentView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
