//
//  SignOutButtonView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import UIKit

protocol SignOutButtonViewOutput: AnyObject {
    func signOutButtonWasTapped()
}

final class SignOutButtonView: UIView {
    weak var output: SignOutButtonViewOutput?
    
    private lazy var signOutButton = makeSignOutButton()

    init() {
        super.init(frame: .zero)
        commonInit()
        addTargets()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Private
private extension SignOutButtonView {
    func addTargets() {
        signOutButton.addTarget(
            self,
            action: #selector(signOutButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc func signOutButtonTapped() {
        output?.signOutButtonWasTapped()
    }
    
    func commonInit() {
        setupLayout()
        
        signOutButton.setTitle("Sign out", for: .normal)
    }
    
    func setupLayout() {
        addSubview(signOutButton)
          
        signOutButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
        }
    }

    func makeSignOutButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.coreRed, for: .normal)
        return view
    }
}
