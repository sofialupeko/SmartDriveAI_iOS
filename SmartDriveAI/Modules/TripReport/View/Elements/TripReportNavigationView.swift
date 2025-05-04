//
//  TripReportNavigationView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import SnapKit
import UIKit

protocol TripReportNavigationViewOutput: AnyObject {
    func backButtonWasTapped()
}

final class TripReportNavigationView: UIView {
    weak var output: TripReportNavigationViewOutput?

    private lazy var titleLabel = makeTitleLabel()
    private lazy var backButton = makeBackButton()

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TripReportNavigationView {
    func commonInit() {
        backgroundColor = .coreLightGray
        titleLabel.text = "Trip report"
        setupLayout()
        addTargets()
    }

    func addTargets() {
        backButton.addTarget(
            self,
            action: #selector(backButtonTap),
            for: .touchUpInside
        )
    }

    @objc func backButtonTap() {
        output?.backButtonWasTapped()
    }

    func setupLayout() {
        addSubview(backButton)
        addSubview(titleLabel)
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.equalToSuperview().inset(8)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(backButton.snp.trailing).offset(8)
            make.centerY.equalTo(backButton)
        }
    }

    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textColor = .black
        return view
    }

    func makeBackButton() -> UIButton {
        let view = UIButton()
        view.setImage(
            UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        view.tintColor = .black
        return view
    }
}
