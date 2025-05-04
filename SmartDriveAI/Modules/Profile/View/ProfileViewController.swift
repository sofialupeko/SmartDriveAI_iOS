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
    private lazy var scrollView = makeScrollView()
    private lazy var stackView = makeStackView()
    private lazy var styleView = DrivingStyleInfoView()
    private lazy var analysisView = AnalysisView()
    private lazy var signOutButtonView = SignOutButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
}

// MARK: ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func setupInitialState() {
        view.backgroundColor = .coreLightGray
        signOutButtonView.output = self
        commonInit()
    }
    
    func configure(with viewModel: ProfileViewModel) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        styleView.configure(with: viewModel.drivingStyle)
        stackView.addArrangedSubview(styleView)

        analysisView.configure(with: viewModel.drivingAnalysis)
        stackView.addArrangedSubview(analysisView)
        
        stackView.addArrangedSubview(signOutButtonView)
    }
}

// MARK: SignOutButtonViewOutput
extension ProfileViewController: SignOutButtonViewOutput {
    func signOutButtonWasTapped() {
        output?.signOutButtonWasTapped()
    }
}

// MARK: Private
private extension ProfileViewController {
    func commonInit() {
        setupLayout()
        
        titleLabel.text = "Profile"
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
                
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().priority(.low)
        }
    }

    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .left
        return view
    }
    
    func makeScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }

    func makeStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }
}
