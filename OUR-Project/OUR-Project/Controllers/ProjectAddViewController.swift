//
//  ProjectAddViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

protocol ProjectAddDelegate: AnyObject {
    func didAddProject(project: ProjectList)
}

import UIKit

class ProjectAddViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: ProjectAddDelegate?
    
    private var progressList: [UITextField] = []
    
    private let projectNamePickerHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "프로젝트 이름"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private let projectNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "프로젝트 이름을 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let affiliationPickerHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "소속"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private let affiliationTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "소속을 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var datePickerPopupView: DatePickerPopupView = {
        let datePicker = DatePickerPopupView()
        datePicker.onSelectDate = { [weak self] date in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = formatter.string(from: date)
            
            switch datePicker.currentSelection {
            case .start:
                self?.startDateSelectedDateLabel.text = formattedDate
            case .end:
                self?.endDateSelectedDateLabel.text = formattedDate
            case .none:
                break
            }
            datePicker.currentSelection = .none
        }
        return datePicker
    }()

    
    private let startDateHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "시작 날짜"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private lazy var startDateborderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let startDateSelectedDateLabel: UILabel = {
        let label = UILabel()
        label.text = "선택한 날짜 없음"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .separator
        return label
    }()
    
    private lazy var startDateCalendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        button.addTarget(self, action: #selector(startDateCalendarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let endDateHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "종료 날짜"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private lazy var endDateborderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let endDateSelectedDateLabel: UILabel = {
        let label = UILabel()
        label.text = "선택한 날짜 없음"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .separator
        return label
    }()
    
    private lazy var endDateCalendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        button.addTarget(self, action: #selector(endDateCalendarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let descriptionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "프로젝트 설명"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private let descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureNavigationBar()
        configureUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Helpers
    
    private func configureNavigationBar() {
        navigationItem.title = "신규 프로젝트"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureUI() {
        let elements = [
            projectNamePickerHeaderLabel,
            projectNameTextField,
            affiliationPickerHeaderLabel,
            affiliationTextField,
            startDateHeaderLabel,
            startDateborderView,
            startDateSelectedDateLabel,
            startDateCalendarButton,
            endDateHeaderLabel,
            endDateborderView,
            endDateSelectedDateLabel,
            endDateCalendarButton,
            descriptionHeaderLabel,
            descriptionTextView
        ]

        elements.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        startDateborderView.addSubview(startDateSelectedDateLabel)
        startDateborderView.addSubview(startDateCalendarButton)
        endDateborderView.addSubview(endDateSelectedDateLabel)
        endDateborderView.addSubview(endDateCalendarButton)
        
        NSLayoutConstraint.activate([
            projectNamePickerHeaderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            projectNamePickerHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            projectNameTextField.topAnchor.constraint(equalTo: projectNamePickerHeaderLabel.bottomAnchor, constant: 10),
            projectNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            projectNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            projectNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            affiliationPickerHeaderLabel.topAnchor.constraint(equalTo: projectNameTextField.bottomAnchor, constant: 16),
            affiliationPickerHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            affiliationTextField.topAnchor.constraint(equalTo: affiliationPickerHeaderLabel.bottomAnchor, constant: 10),
            affiliationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            affiliationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            affiliationTextField.heightAnchor.constraint(equalToConstant: 50),
            
            startDateHeaderLabel.topAnchor.constraint(equalTo: affiliationTextField.bottomAnchor, constant: 16),
            startDateHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        
            startDateborderView.topAnchor.constraint(equalTo: startDateHeaderLabel.bottomAnchor, constant: 10),
            startDateborderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startDateborderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startDateborderView.heightAnchor.constraint(equalToConstant: 50),
            
            startDateSelectedDateLabel.leadingAnchor.constraint(equalTo: startDateborderView.leadingAnchor, constant: 10),
            startDateSelectedDateLabel.centerYAnchor.constraint(equalTo: startDateborderView.centerYAnchor),
            
            startDateCalendarButton.trailingAnchor.constraint(equalTo: startDateborderView.trailingAnchor, constant: -16),
            startDateCalendarButton.centerYAnchor.constraint(equalTo: startDateborderView.centerYAnchor),
            
            endDateHeaderLabel.topAnchor.constraint(equalTo: startDateborderView.bottomAnchor, constant: 10),
            endDateHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            endDateborderView.topAnchor.constraint(equalTo: endDateHeaderLabel.bottomAnchor, constant: 10),
            endDateborderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            endDateborderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            endDateborderView.heightAnchor.constraint(equalToConstant: 50),
            
            endDateSelectedDateLabel.leadingAnchor.constraint(equalTo: endDateborderView.leadingAnchor, constant: 10),
            endDateSelectedDateLabel.centerYAnchor.constraint(equalTo: endDateborderView.centerYAnchor),
            
            endDateCalendarButton.trailingAnchor.constraint(equalTo: endDateborderView.trailingAnchor, constant: -16),
            endDateCalendarButton.centerYAnchor.constraint(equalTo: endDateborderView.centerYAnchor),
            
            descriptionHeaderLabel.topAnchor.constraint(equalTo: endDateborderView.bottomAnchor, constant: 16),
            descriptionHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            descriptionTextView.topAnchor.constraint(equalTo: descriptionHeaderLabel.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 150),
        ])
        projectNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: projectNameTextField.frame.height))
        projectNameTextField.leftViewMode = .always
        
        affiliationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: projectNameTextField.frame.height))
        affiliationTextField.leftViewMode = .always
    }
    
    func resetInputFields() {
        projectNameTextField.text = ""
        affiliationTextField.text = ""
        startDateSelectedDateLabel.text = "선택한 날짜 없음"
        endDateSelectedDateLabel.text = "선택한 날짜 없음"
        descriptionTextView.text = ""
    }
    
    // MARK: - Action
    
    @objc func saveButtonTapped() {
        guard let projectName = projectNameTextField.text, !projectName.isEmpty,
              let affiliation = affiliationTextField.text, !affiliation.isEmpty,
              let startDateStr = startDateSelectedDateLabel.text, startDateStr != "선택한 날짜 없음",
              let endDateStr = endDateSelectedDateLabel.text, endDateStr != "선택한 날짜 없음" else {
            return
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let startDate = formatter.date(from: startDateStr),
              let endDate = formatter.date(from: endDateStr) else {
            return
        }

        let newProject = ProjectList(projectName: projectName, affiliation: affiliation, startDate: startDate, endDate: endDate)
        if let mainVC = (tabBarController?.viewControllers?[1] as? UINavigationController)?.viewControllers.first as? MainViewController {
            mainVC.didAddProject(project: newProject)
        }
        tabBarController?.selectedIndex = 1
        
        resetInputFields()
    }

    @objc func startDateCalendarButtonTapped(_ sender: UIButton) {
        datePickerPopupView.currentSelection = .start
        view.addSubview(datePickerPopupView)
        datePickerPopupView.frame = view.bounds
    }

    @objc func endDateCalendarButtonTapped(_ sender: UIButton) {
        datePickerPopupView.currentSelection = .end
        view.addSubview(datePickerPopupView)
        datePickerPopupView.frame = view.bounds
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if descriptionTextView.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height / 2.5
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if descriptionTextView.isFirstResponder {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
