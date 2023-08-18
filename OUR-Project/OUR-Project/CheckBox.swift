//
//  CheckBox.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

/// 체크박스
class CheckBox: UIButton {
    /// 체크박스 이미지
    var checkBoxResouces = OnOffResources(
        onImage: UIImage(systemName: "checkmark.square")?.withTintColor(UIColor(red: 0.54, green: 0.49, blue: 0.22, alpha: 1.00), renderingMode: .alwaysOriginal),
        offImage: UIImage(systemName: "square")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
    ) {
        didSet {
            self.setChecked(isChecked)
        }
    }

    /// 체크 상태 변경
    var isChecked: Bool = false {
        didSet {
            guard isChecked != oldValue else { return }
            self.setChecked(isChecked)
        }
    }

    /// 이미지 직접 지정 + init
    init(resources: OnOffResources) {
        super.init(frame: .zero)
        self.checkBoxResouces = resources
        commonInit()
    }

    /// 일반적인 init + checkBoxResources 변경
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        self.setImage(checkBoxResouces.offImage, for: .normal)
        self.configuration?.imagePadding = 10
        
        self.addTarget(self, action: #selector(check), for: .touchUpInside)
        self.isChecked = false
    }

    @objc func check(_ sender: UIGestureRecognizer) {
        isChecked.toggle()
    }

    /// 이미지 변경
    private func setChecked(_ isChecked: Bool) {
        if isChecked == true {
            self.setImage(checkBoxResouces.onImage, for: .normal)
            self.configuration?.imagePadding = 10
        } else {
            self.setImage(checkBoxResouces.offImage, for: .normal)
            self.configuration?.imagePadding = 10
        }
    }

    class OnOffResources {

        let onImage: UIImage?
        let offImage: UIImage?

        init(onImage: UIImage?, offImage: UIImage?) {
            self.onImage = onImage
            self.offImage = offImage
        }
    }
}
