//
//  AuthorizationViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 18.04.2025.
//

import SnapKit
import UIKit

final class AuthorizationViewController: UIViewController {

    var output: AuthorizationViewOutput?

    private lazy var titleLabel = makeTitleLabel()
    private lazy var emailInputView = PersonalInfoInputView()
    private lazy var passwordInputView = PersonalInfoInputView()
    private lazy var enterButton = makeEnterButton()
    private lazy var changeAuthProcessLabel = makeChangeAuthProcessLabel()
    private lazy var changeAuthProcessButton = makeChangeAuthProcessButton()
    
    private lazy var skipButton = makeSkipButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
}

// MARK: AuthorizationViewInput
extension AuthorizationViewController: AuthorizationViewInput {
    func setupInitialState() {
        view.backgroundColor = .white
        commonInit()
        addTargets()
        setupSignUpState()
    }
    
    func setupSignUpState() {
        titleLabel.text = "Sign up"
        changeAuthProcessLabel.text = "Already have an account?"
        enterButton.isSelected = false
        changeAuthProcessButton.isSelected = false
    }

    func setupLogInState() {
        titleLabel.text = "Log in"
        changeAuthProcessLabel.text = "Don't have an account?"
        enterButton.isSelected = true
        changeAuthProcessButton.isSelected = true
    }
}

// MARK: Private
private extension AuthorizationViewController {
    func addTargets() {
        enterButton.addTarget(
            self,
            action: #selector(enterButtonTapped),
            for: .touchUpInside
        )
        changeAuthProcessButton.addTarget(
            self,
            action: #selector(changeAuthProcessButtonTapped),
            for: .touchUpInside
        )
        skipButton.addTarget(
            self,
            action: #selector(skipButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc func enterButtonTapped() {
        output?.enterButtonWasTapped()
    }
    
    @objc func changeAuthProcessButtonTapped() {
        output?.changeAuthProcessButtonWasTapped()
    }

    @objc func skipButtonTapped() {
        self.dismiss(animated: true)
    }
    
    func commonInit() {
        setupLayout()
        
        emailInputView.configure(
            with: PersonalInfoInputViewModel(
                title: "email",
                textChangeHandler: { [weak self] text in
                    self?.output?.emailTextFieldDidChange(text)
                }
            )
        )
        passwordInputView.configure(
            with: PersonalInfoInputViewModel(
                title: "password",
                textChangeHandler: { [weak self] text in
                    self?.output?.passswordTextFieldDidChange(text)
                }
            )
        )
        enterButton.setTitle("Sign up", for: .normal)
        enterButton.setTitle("Log in", for: .selected)
        changeAuthProcessButton.setTitle("Log in", for: .normal)
        changeAuthProcessButton.setTitle("Sign up", for: .selected)
        skipButton.setTitle("Skip", for: .normal)
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(emailInputView)
        view.addSubview(passwordInputView)
        view.addSubview(enterButton)
        view.addSubview(changeAuthProcessButton)
        view.addSubview(changeAuthProcessLabel)
        
        view.addSubview(skipButton)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(emailInputView.snp.top).offset(-32)
        }
        emailInputView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        passwordInputView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(emailInputView.snp.bottom).offset(12)
        }
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordInputView.snp.bottom).offset(24)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
        }
        changeAuthProcessButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
            make.leading.equalToSuperview().inset(24)
        }
        changeAuthProcessLabel.snp.makeConstraints { make in
            make.bottom.equalTo(changeAuthProcessButton.snp.top).offset(-4)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.trailing.equalToSuperview().inset(24)
        }
    }

    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .center
        return view
    }

    func makeEnterButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 12
        return view
    }
    
    func makeChangeAuthProcessLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        return view
    }
    
    func makeChangeAuthProcessButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.red, for: .normal)
        return view
    }
    
    func makeSkipButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.red, for: .normal)
        return view
    }
}
