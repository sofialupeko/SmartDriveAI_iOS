//
//  DrivingStyleInfoView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

import SnapKit
import UIKit

struct DrivingStyleInfoViewModel {
    let styleName: String
    let styleColor: UIColor
}

final class DrivingStyleInfoView: UIView {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var styleNameLabel = makeStyleTitleLabel()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: DrivingStyleInfoViewModel) {
        styleNameLabel.text = viewModel.styleName
        styleNameLabel.textColor = viewModel.styleColor
    }
}

private extension DrivingStyleInfoView {
    func commonInit() {
        setupLayout()
        titleLabel.text = "Driving style"
        titleLabel.setContentCompressionResistancePriority(.defaultLow - 1, for: .horizontal)
        titleLabel.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
    }
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(styleNameLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }
        styleNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 24, weight: .regular)
        view.textAlignment = .left
        return view
    }
    
    func makeStyleTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .italicSystemFont(ofSize: 24)
        view.textAlignment = .right
        return view
    }
}
