//
//  ProfileEditViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    // MARK: - Properties
    
    var user: UserSelect?
    var selectedImage: UIImage?
    
    private let profileImageView: UIImageView = {
        let piv = UIImageView()
        piv.contentMode = .scaleAspectFill
        piv.layer.cornerRadius = 75
        piv.layer.masksToBounds = true
        piv.layer.borderColor = UIColor.lightGray.cgColor
        piv.layer.borderWidth = 0.5
        return piv
    }()
    
    private lazy var imagePickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(profileImageViewTapped), for: .touchUpInside)
        return button
    }()

    
    private let nameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
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

    private let affiliationHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "소속"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private let affiliationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "소속을 입력하세요."
        return textField
    }()
    
    private lazy var affiliationStack: UIStackView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        let stack = UIStackView(arrangedSubviews: [affiliationHeaderLabel, affiliationTextField, separator])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let introductionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "소개"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private let introductionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
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
        
        configureNavigationBar()
        configureUI()
        configure(with: user)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Helpers
    
    private func configureNavigationBar() {
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
    
    private func configureUI() {
        [profileImageView, imagePickerButton, nameStack, affiliationStack, introductionStack].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            
            imagePickerButton.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            imagePickerButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            imagePickerButton.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            imagePickerButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),

            nameStack.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            nameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            affiliationStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor, constant: 50),
            affiliationStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            affiliationStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            introductionStack.topAnchor.constraint(equalTo: affiliationStack.bottomAnchor, constant: 40),
            introductionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            introductionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            introductionTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configure(with user: UserSelect?) {
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
        user?.icon = profileImageView.image
            
        var users = UserManager.shared.loadUsers()
            
        if let user = user {
            if let index = users.firstIndex(where: { $0.name == user.name }) {
                users[index] = user
            } else {
                users.append(user)
            }
            UserManager.shared.save(users: users)
        }
            
        let encoder = JSONEncoder()
        if let user = user, let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: "selectedUser")
        }
            
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func profileImageViewTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
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

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ProfileEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
