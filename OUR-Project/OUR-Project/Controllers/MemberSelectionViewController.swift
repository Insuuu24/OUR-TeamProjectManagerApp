//
//  MemberSelectionViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/15.
//

import UIKit

protocol MemberSelectionDelegate: AnyObject {
    func didSelectMember(user: UserSelect)
}

class MemberSelectionViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: MemberSelectionDelegate?
    private let collectionView: UICollectionView
    private var users: [UserSelect] = []
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자를 선택해주세요"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 160, left: 10, bottom: 10, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        users = UserManager.shared.loadUsers()
        collectionView.reloadData()
    }
    
    // MARK: - Helpers
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.shadowColor = nil

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black

        let logoImage = UIImage(named: "ourproject_logo.png")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit

        let container = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        logoImageView.frame = container.bounds
        container.addSubview(logoImageView)
        navigationItem.titleView = container

        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUserButtonTapped))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserSelectCell.self, forCellWithReuseIdentifier: "UserCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    //MARK: - Actions
    
    @objc private func addUserButtonTapped() {
        if users.count >= 4 {
            let alert = UIAlertController(title: "멤버 추가", message: "멤버를 4명 이상 추가할 수 없습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let alert = UIAlertController(title: "프로필 추가", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "프로필 이름"
        }
        
        let addAction = UIAlertAction(title: "저장", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            if let name = alert.textFields?.first?.text, !name.isEmpty {
                let randomImage = self.randomAssetImage()
                let newUser = UserSelect(name: name, icon: randomImage)
                
                var users = UserManager.shared.loadUsers()
                users.append(newUser)
                UserManager.shared.save(users: users)
                self.users = users
                
                self.collectionView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

    func randomAssetImage() -> UIImage? {
        let imageNames = ["profile1", "profile2", "profile3"]
        let randomIndex = Int.random(in: 0..<imageNames.count)
        return UIImage(named: imageNames[randomIndex])
    }

    
    private func removeUser(at indexPath: IndexPath) {
        var users = UserManager.shared.loadUsers()
        users.remove(at: indexPath.item)
        UserManager.shared.save(users: users)
        self.users = users
        collectionView.reloadData()
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state != .began {
            return
        }

        let location = gesture.location(in: collectionView)
        if let indexPath = collectionView.indexPathForItem(at: location) {
            presentDeletionAlert(for: indexPath)
        }
    }

    func presentDeletionAlert(for indexPath: IndexPath) {
        let alert = UIAlertController(title: "멤버 삭제", message: "정말로 이 멤버를 삭제하시겠습니까?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { [weak self] _ in
            self?.removeUser(at: indexPath)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension MemberSelectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserSelectCell
        cell.configure(with: users[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.item]
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(selectedUser) {
            UserDefaults.standard.set(encoded, forKey: "selectedUser")
        }

        delegate?.didSelectMember(user: selectedUser)
        let mainViewController = MainViewController()
        mainViewController.selectedUser = selectedUser
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}
