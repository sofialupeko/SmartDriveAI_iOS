//
//  NewTripViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

import SnapKit
import UIKit

final class NewTripViewController: UIViewController {

    var output: NewTripViewOutput?

    private lazy var backgroundView = makeBackgroundView()
    private lazy var bottomContainerView = makeBottomContainerView()
    private lazy var timerContainer = UIView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var durationLabel = makeDurationLabel()
    private lazy var timerLabel = makeTimerLabel()
    private lazy var startStopButton = makeStartStopButton()
    
    private lazy var timerContainerCollapsedHeight: NSLayoutConstraint = timerContainer.heightAnchor.constraint(equalToConstant: 0)
    private lazy var timerContainerTitleSpacing: NSLayoutConstraint = timerContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24)

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        
        setupInitialState()
    }
}

// MARK: NewTripViewInput
extension NewTripViewController: NewTripViewInput {
    func setupInitialState() {
        view.backgroundColor = .white
        commonInit()
        addTargets()
        setupReadyToStartState(animated: false)
    }
    
    func updateTimerValue(_ value: String) {
        timerLabel.text = value
    }
    
    func setupReadyToStartState(animated: Bool = false) {
        let action: () -> Void = { [weak self] in
            self?.timerContainerCollapsedHeight.isActive = true
            self?.timerContainerTitleSpacing.constant = 0
            self?.view.layoutIfNeeded()
        }
        let completion: () -> Void = { [weak self] in
            self?.titleLabel.text = "New trip"
            self?.startStopButton.isSelected = false
            self?.timerContainer.isHidden = true
        }
        if animated {
            UIView.animate(
                withDuration: 0.3
            ) {
                action()
            } completion: { _ in
                completion()
            }
        } else {
            action()
            completion()
        }
    }

    func setupInProcessState(animated: Bool = false) {
        let action: () -> Void = { [weak self] in
            self?.timerContainerCollapsedHeight.isActive = false
            self?.timerContainerTitleSpacing.constant = 24
            self?.view.layoutIfNeeded()
        }
        let completion: () -> Void = { [weak self] in
            self?.titleLabel.text = "Trip is recording"
            self?.startStopButton.isSelected = true
            self?.timerContainer.isHidden = false
        }
        if animated {
            UIView.animate(
                withDuration: 0.3
            ) {
                action()
            } completion: { _ in
                completion()
            }
        } else {
            action()
            completion()
        }
    }
}

// MARK: Private
private extension NewTripViewController {
    func addTargets() {
        startStopButton.addTarget(
            self,
            action: #selector(startStopButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc func startStopButtonTapped() {
        output?.startStopButtonWasTapped()
    }
    
    func commonInit() {
        setupLayout()
        
        startStopButton.setTitle("Start", for: .normal)
        startStopButton.setTitle("Stop", for: .selected)
        durationLabel.text = "Trip duration"
        timerLabel.text = "00:00:00"
    }
    
    func setupLayout() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(bottomContainerView)
        bottomContainerView.addSubview(timerContainer)
        bottomContainerView.addSubview(titleLabel)
        bottomContainerView.addSubview(startStopButton)
        timerContainer.addSubview(durationLabel)
        timerContainer.addSubview(timerLabel)
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bottomContainerView.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().offset(-1)
            make.bottom.trailing.equalToSuperview().offset(1)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        timerContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        timerContainerCollapsedHeight.isActive = false
        timerContainerTitleSpacing.isActive = true
        startStopButton.snp.makeConstraints { make in
            make.top.equalTo(timerContainer.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(44)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
        }
        durationLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        timerLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(durationLabel.snp.bottom).offset(4)
        }
    }

    func makeBackgroundView() -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        return view
    }
    
    func makeBottomContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .left
        return view
    }
    
    func makeDurationLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .regular)
        view.textAlignment = .center
        return view
    }
    
    func makeTimerLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .center
        return view
    }

    func makeStartStopButton() -> UIButton {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        return view
    }
}
