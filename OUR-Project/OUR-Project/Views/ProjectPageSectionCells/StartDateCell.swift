//
//  StartDateCell.swift
//  OUR-Project
//
//  Created by Insu on 2023/08/18.
//

import UIKit

class StartDateCell: UITableViewCell {

    // MARK: - Properties
    
    private var datePickerAction: (() -> Void)?
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private lazy var calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.tintColor = UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDatePicker), for: .touchUpInside)
        return button
    }()
    
    var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
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
        contentView.addSubview(dateLabel)
        contentView.addSubview(calendarButton)

        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            calendarButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            calendarButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            calendarButton.widthAnchor.constraint(equalToConstant: 24),
            calendarButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func getViewController() -> UIViewController? {
        var next = self.next
        while next != nil {
            if let vc = next as? UIViewController {
                return vc
            }
            next = next?.next
        }
        return nil
    }
    
    // MARK: - Action
    
    @objc private func handleDatePicker() {
        guard let viewController = self.getViewController() else { return }
        
        let backgroundView = UIView(frame: viewController.view.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        backgroundView.isUserInteractionEnabled = true
        
        let datePickerPopup = DatePickerPopupView(frame: viewController.view.bounds)
        datePickerPopup.alpha = 0
        
        datePickerPopup.onSelectDate = { [weak self, weak backgroundView] selectedDate in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            self?.dateLabel.text = dateFormatter.string(from: selectedDate)
            backgroundView?.removeFromSuperview()
        }
        
        datePickerPopup.onCancel = {
            backgroundView.removeFromSuperview()
        }
        
        backgroundView.addSubview(datePickerPopup)
        viewController.view.addSubview(backgroundView)

        UIView.animate(withDuration: 0.3) {
            datePickerPopup.alpha = 1
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        }
    }

    func configure(with model: StartDateModel) {
        dateLabel.text = model.startDate
        datePickerAction = model.datePickerAction
    }
}
