//
//  ProfileViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

import SnapKit
import UIKit

struct ProfileViewModel {
    let drivingStyle: DrivingStyleInfoViewModel
    let drivingAnalysis: AnalysisViewModel
}

final class ProfileViewController: UIViewController {

    var output: ProfileViewOutput?

    private lazy var titleLabel = makeTitleLabel()
    private lazy var styleView = DrivingStyleInfoView()
    private lazy var analysisView = AnalysisView()
    private lazy var signOutButton = makeSignOutButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
}

// MARK: ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func setupInitialState() {
        view.backgroundColor = .lightGray
        commonInit()
        addTargets()
    }
    
    func configure(with viewModel: ProfileViewModel) {
        styleView.configure(with: viewModel.drivingStyle)
        analysisView.configure(with: viewModel.drivingAnalysis)
    }
}

// MARK: Private
private extension ProfileViewController {
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
        
        titleLabel.text = "Profile"
        signOutButton.setTitle("Sign out", for: .normal)
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(styleView)
        view.addSubview(analysisView)
        view.addSubview(signOutButton)
                
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        styleView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        analysisView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(styleView.snp.bottom).offset(24)
        }
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(analysisView.snp.bottom).offset(24)
            make.trailing.equalToSuperview().inset(24)
        }
    }

    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .left
        return view
    }

    func makeStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        return view
    }
    
    func makeSignOutButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.red, for: .normal)
        return view
    }
}
