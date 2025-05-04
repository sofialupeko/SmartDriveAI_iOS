//
//  PersonalInfoInputView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 18.04.2025.
//

import SnapKit
import UIKit

struct PersonalInfoInputViewModel {
    let title: String
    let textChangeHandler: ((String) -> Void)?
}

final class PersonalInfoInputView: UIView {
    private var viewModel: PersonalInfoInputViewModel?
    
    private lazy var titleLabel = makeTitleLabel()
    private lazy var inputContainer = UIView()
    private lazy var infoTextField = makeInfoTextField()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: PersonalInfoInputViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }
}

// MARK: UITextFieldDelegate
extension PersonalInfoInputView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.textChangeHandler?(textField.text ?? "")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


private extension PersonalInfoInputView {
    func commonInit() {
        setupLayout()
        infoTextField.delegate = self
        
        inputContainer.layer.borderColor = UIColor.darkGray.cgColor
        inputContainer.layer.borderWidth = 1
        inputContainer.layer.cornerRadius = 12
    }
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(inputContainer)
        inputContainer.addSubview(infoTextField)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(inputContainer.snp.top).offset(-4)
        }
        inputContainer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        infoTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .regular)
        view.textAlignment = .left
        return view
    }
    
    func makeInfoTextField() -> UITextField {
        let view = UITextField()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.tintColor = .darkGray
        return view
    }
}
