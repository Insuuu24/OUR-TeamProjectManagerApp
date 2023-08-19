//
//  ProjectAddViewController.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/14.
//

import UIKit

class ProjectAddViewController: UIViewController {
    
    // MARK: - Properties
    
    private var progressList: [UITextField] = []
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let projectNamePickerHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "프로젝트 이름"
        label.font = UIFont.boldSystemFont(ofSize: 12)
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
    
    private let startDateHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "시작"
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
        //button.addTarget(self, action: #selector(handleCalendarButton), for: .touchUpInside)
        return button
    }()
    
    private let startDateDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    private let endDateHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "종료"
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
        //button.addTarget(self, action: #selector(handleCalendarButton), for: .touchUpInside)
        return button
    }()
    
    private let endDateDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
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
    
    private let progressListHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "진행상황"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        return label
    }()
    
    private lazy var progressStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 5
        stepper.addTarget(self, action: #selector(handleStepperChange), for: .valueChanged)
        return stepper
    }()


    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
        configureUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    

    // MARK: - Helpers
    
    private func setupNavigationBar() {
        navigationItem.title = "신규 프로젝트"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureUI() {
        let viewsToAdd: [UIView] = [
            scrollView,
            projectNamePickerHeaderLabel,
            projectNameTextField,
            affiliationPickerHeaderLabel,
            affiliationTextField,
            startDateHeaderLabel,
            startDateborderView,
            endDateHeaderLabel,
            endDateborderView,
            descriptionHeaderLabel,
            descriptionTextView,
            progressListHeaderLabel,
            progressStepper
        ]
        
        for viewToAdd in viewsToAdd {
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        scrollView.addSubview(containerView)
        startDateborderView.addSubview(startDateSelectedDateLabel)
        startDateborderView.addSubview(startDateCalendarButton)
        endDateborderView.addSubview(endDateSelectedDateLabel)
        endDateborderView.addSubview(endDateCalendarButton)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        startDateSelectedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        endDateSelectedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
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
            
            progressListHeaderLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16),
            progressListHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            progressStepper.topAnchor.constraint(equalTo: progressListHeaderLabel.bottomAnchor, constant: 16),
            progressStepper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        projectNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: projectNameTextField.frame.height))
        projectNameTextField.leftViewMode = .always
        
        affiliationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: projectNameTextField.frame.height))
        affiliationTextField.leftViewMode = .always
    }

    func updateScrollViewContentSize() {
        // contentSize의 높이를 최종 element의 아래로 설정합니다.
        if let lastElement = scrollView.subviews.last {
            scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: lastElement.frame.maxY + 20) // +20은 추가적인 패딩입니다.
        }
    }
    
    func adjustStepperPosition() {
        // 마지막 텍스트 필드의 아래에 Stepper를 위치시킵니다.
        if let lastTextField = progressList.last {
            NSLayoutConstraint.activate([
                progressStepper.topAnchor.constraint(equalTo: lastTextField.bottomAnchor, constant: 16)
            ])
        } else {
            // 텍스트 필드가 없으면 초기 위치로 되돌립니다.
            NSLayoutConstraint.activate([
                progressStepper.topAnchor.constraint(equalTo: progressListHeaderLabel.bottomAnchor, constant: 16)
            ])
        }
    }
    
    // MARK: - Action
    
    @objc func saveButtonTapped() {
        
        
    }
    
    @objc func handleStepperChange() {
        let diff = Int(progressStepper.value) - progressList.count
        if diff > 0 {
            for _ in 0..<diff {
                addProgressListField()
            }
        } else if diff < 0 {
            for _ in 0..<abs(diff) {
                removeProgressListField()
            }
        }
        adjustStepperPosition()
        updateScrollViewContentSize()
    }
    
    @objc func addProgressListField() {
        let progressListField = UITextField()
        progressListField.borderStyle = .none
        progressListField.placeholder = "프로젝트 이름을 입력해주세요"
        progressListField.font = UIFont.systemFont(ofSize: 14)
        progressListField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
        progressListField.layer.cornerRadius = 10
        progressListField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressListField)
        
        let lastProgressList = progressList.last
        
        NSLayoutConstraint.activate([
            progressListField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressListField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressListField.heightAnchor.constraint(equalToConstant: 40),
            progressListField.topAnchor.constraint(equalTo: lastProgressList?.bottomAnchor ?? progressListHeaderLabel.bottomAnchor, constant: 16)
        ])
        progressList.append(progressListField)
        
        progressListField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: projectNameTextField.frame.height))
        progressListField.leftViewMode = .always
    }
    
    @objc func removeProgressListField() {
        guard let lastProgressField = progressList.last else { return }
        lastProgressField.removeFromSuperview()
        progressList.removeLast()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}


