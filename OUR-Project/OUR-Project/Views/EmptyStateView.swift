//
//  EmptyStateView.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/17.
//

import UIKit

class EmptyStateView: UIView {
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "text.badge.xmark")?.withTintColor(UIColor(red: 0.86, green: 0.85, blue: 0.78, alpha: 1.00), renderingMode: .alwaysOriginal))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "프로젝트가 없습니다"
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lbl.textColor = .lightGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Helpers
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -70),
            imageView.widthAnchor.constraint(equalToConstant: 45),
            imageView.heightAnchor.constraint(equalToConstant: 45),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10)
        ])
    }
}
