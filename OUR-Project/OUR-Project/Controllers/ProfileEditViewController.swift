//
//  ProfileEditViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    // MARK: - Properties
    
    var user: UserModel? {
        didSet {
            configure(with: user)
        }
    }
    
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
        textView.layer.cornerRadius = 10
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
    
    func configure(with user: UserModel?) {
        guard let user = user else { return }
        profileImageView.image = user.icon
        nameTextField.text = user.name
    }
    
    // MARK: - Actions
    
    @objc private func saveButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        user?.name = name
        
        var users = UserManager.shared.loadUsers()
        
        // 해당 사용자의 정보를 찾아 수정합니다.
        if let user = user, let index = users.firstIndex(where: { $0.email == user.email }) {
            users[index] = user
            
            // 변경된 사용자 목록을 다시 저장합니다.
            UserManager.shared.save(users: users)
        }
        
        let encoder = JSONEncoder()
        if let user = user, let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: "selectedUser")
        }
        
        self.navigationController?.popViewController(animated: true)
    }


    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
}
