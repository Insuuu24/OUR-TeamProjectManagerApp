//
//  MyPageViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class MyPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        let borderColor = UIColor(red: 0.86, green: 0.85, blue: 0.78, alpha: 1.00)
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 60
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = borderColor.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let nameLabel: UILabel = {
        let nlb = UILabel()
        nlb.font = UIFont.boldSystemFont(ofSize: 20)
        nlb.translatesAutoresizingMaskIntoConstraints = false
        return nlb
    }()

    private let emailLabel: UILabel = {
        let elb = UILabel()
        elb.font = UIFont.systemFont(ofSize: 14)
        elb.textColor = .gray
        elb.translatesAutoresizingMaskIntoConstraints = false
        return elb
    }()

    private let introductionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private lazy var editButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("편집", for: .normal)
        btn.setTitleColor(UIColor(red: 0.36, green: 0.33, blue: 0.14, alpha: 1.00), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        btn.layer.cornerRadius = 15
        btn.backgroundColor = UIColor(red: 0.86, green: 0.85, blue: 0.78, alpha: 1.00)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return btn
    }()

    private let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["생성한 프로젝트", "참여중인 프로젝트"])
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()

    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
        setupViews()
        loadSelectedUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSelectedUser()
    }


    // MARK: - Navigation Bar
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let logoImage = UIImage(named: "ourproject_logo.png")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }
    
    // MARK: - Method & Action
    
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(introductionLabel)
        view.addSubview(editButton)
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),

            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 60),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            introductionLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            introductionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            introductionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            editButton.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 60),
            editButton.heightAnchor.constraint(equalToConstant: 30),

            segmentedControl.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 40),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func loadSelectedUser() {
        let decoder = JSONDecoder()
        if let savedUser = UserDefaults.standard.object(forKey: "selectedUser") as? Data,
           let loadedUser = try? decoder.decode(UserModel.self, from: savedUser) {
            configure(with: loadedUser)
        }
    }
    
    func configure(with user: UserModel) {
        profileImageView.image = user.icon
        nameLabel.text = user.name
        emailLabel.text = "sample@email.com"
        introductionLabel.text = "자기 소개 예시..."
    }
    
    @objc func editButtonTapped() {
        let profileEditVC = ProfileEditViewController()

        let decoder = JSONDecoder()
        if let savedUser = UserDefaults.standard.object(forKey: "selectedUser") as? Data,
           let loadedUser = try? decoder.decode(UserModel.self, from: savedUser) {
            profileEditVC.user = loadedUser
        }

        self.navigationController?.pushViewController(profileEditVC, animated: true)
    }


    
}
