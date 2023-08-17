//
//  ProjectListCell.swift
//  OUR-Project
//
//  Created by Sanghun K. on 2023/08/16.
//

import Foundation
import UIKit

class ProjectListCell: UITableViewCell {
    
    var stackView: UIStackView!
    var projectNameLabel: UILabel!
    var projectInfoLabel: UILabel!
    var projectProgressBar: UIProgressView!
    var projectTaskCompletionLabel: UILabel!
    var joinedProjectBadge: UIButton!
    var rightButton: UIButton!
    let spacer = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setProjectListCellUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setProjectListCellUI() {
        
        projectNameLabel = UILabel()
        projectInfoLabel = UILabel()
        projectProgressBar = UIProgressView()
        projectTaskCompletionLabel = UILabel()
        joinedProjectBadge = UIButton()
        
        spacer.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        joinedProjectBadge.setTitle("　내가 참여중인　", for: .normal)
        joinedProjectBadge.setTitleColor(UIColor(red: 0.3569, green: 0.3255, blue: 0.1373, alpha: 1.0), for: .normal) // #5B5323
        joinedProjectBadge.backgroundColor = UIColor(red: 0.8667, green: 0.8509, blue: 0.7725, alpha: 1.0) // #DDD9C5
        joinedProjectBadge.titleLabel?.font = UIFont.boldSystemFont(ofSize: 7)
        joinedProjectBadge.layer.cornerRadius = 10
        joinedProjectBadge.layer.masksToBounds = true
        
        projectNameLabel.font = UIFont.systemFont(ofSize: 14)
        projectNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        projectInfoLabel.font = UIFont.systemFont(ofSize: 10)
        projectInfoLabel.numberOfLines = 0
        projectInfoLabel.lineBreakMode = .byWordWrapping
 
        projectProgressBar.progressViewStyle = .bar
        projectProgressBar.progressTintColor = UIColor(red: 0.3569, green: 0.3255, blue: 0.1373, alpha: 1.0) // #5B5323
        projectProgressBar.trackTintColor = UIColor(red: 0.7647, green: 0.7569, blue: 0.7255, alpha: 1.0) // #C3C1B9
        projectProgressBar.transform = projectProgressBar.transform.scaledBy(x: 1, y: 2)
        
        projectTaskCompletionLabel.font = UIFont.systemFont(ofSize: 8)
        projectTaskCompletionLabel.text = "0%"
        
        rightButton = UIButton()
        rightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        rightButton.tintColor = UIColor(red: 91/255, green: 83/255, blue: 35/255, alpha: 1.0) // #5B5323

        let projectName = UIStackView(arrangedSubviews: [projectNameLabel, joinedProjectBadge])
        let progress = UIStackView(arrangedSubviews: [projectProgressBar, projectTaskCompletionLabel])
        let leftSide = UIStackView(arrangedSubviews: [projectName, spacer, projectInfoLabel, progress])
        stackView = UIStackView(arrangedSubviews: [leftSide, rightButton])
        
        projectName.axis = .horizontal
        projectName.spacing = 0
        projectName.alignment = .center
        projectName.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        progress.axis = .horizontal
        progress.spacing = 10
        progress.alignment = .center
        progress.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        leftSide.axis = .vertical
        leftSide.spacing = 1

        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            rightButton.widthAnchor.constraint(equalToConstant: 15),
            rightButton.heightAnchor.constraint(equalToConstant: 15),
            rightButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: rightButton.bottomAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            contentView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
}
