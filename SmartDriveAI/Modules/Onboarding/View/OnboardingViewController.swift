//
//  OnboardingViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 18.04.2025.
//

import SnapKit
import UIKit

final class OnboardingViewController: UIViewController {

    private lazy var titleLabel = makeTitleLabel()
    private lazy var startButton = makeStartButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: Private
private extension OnboardingViewController {
    func addTargets() {
        startButton.addTarget(
            self,
            action: #selector(startButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc func startButtonTapped() {
        self.dismiss(animated: true)
    }
    
    func commonInit() {
        view.backgroundColor = .white
        setupLayout()
        addTargets()
        
        titleLabel.text = "SmartDrive AI"
        startButton.setTitle("Start now", for: .normal)
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(startButton)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(44)
        }
    }

    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .center
        return view
    }
    
    func makeStartButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 12
        return view
    }
}
