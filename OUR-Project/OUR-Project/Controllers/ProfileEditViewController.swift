//
//  ProfileEditViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let piv = UIImageView()
        piv.contentMode = .scaleAspectFill
        piv.layer.cornerRadius = 75
        piv.layer.masksToBounds = true
        piv.layer.borderColor = UIColor.lightGray.cgColor
        piv.layer.borderWidth = 0.5
        return piv
    }()
    
    private let nameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요."
        return textField
    }()
    
    private lazy var nameStack: UIStackView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        let stack = UIStackView(arrangedSubviews: [nameHeaderLabel, nameTextField, separator])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private let emailHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일을 입력하세요."
        return textField
    }()
    
    private lazy var emailStack: UIStackView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        let stack = UIStackView(arrangedSubviews: [emailHeaderLabel, emailTextField, separator])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let introductionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "소개"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let introductionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        return textView
    }()
    
    private lazy var introductionStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [introductionHeaderLabel, introductionTextView])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
        setupViews()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Helpers
    
    private func setupNavigationBar() {
        navigationItem.title = "프로필 설정"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupViews() {
        [profileImageView, nameStack, emailStack, introductionStack].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),

            nameStack.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            nameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            emailStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor, constant: 50),
            emailStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            introductionStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 40),
            introductionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            introductionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            introductionTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // MARK: - Action
    
    @objc private func saveButtonTapped() {
        
    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    
}
