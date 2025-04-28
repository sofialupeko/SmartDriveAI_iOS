//
//  AnalysisInfoView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//


import SnapKit
import UIKit

struct AnalysisInfoViewModel {
    let title: String
    let value: String
}

final class AnalysisInfoView: UIView {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var valueLabel = makeTitleLabel()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: AnalysisInfoViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
    }
}

private extension AnalysisInfoView {
    func commonInit() {
        setupLayout()
        
        titleLabel.setContentCompressionResistancePriority(.defaultLow - 1, for: .horizontal)
        titleLabel.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
    }
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
//            make.height.equalTo(60)
        }
        valueLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 24, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }
    
    func makeValueLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .italicSystemFont(ofSize: 24)
        view.textAlignment = .right
        view.numberOfLines = 1
        return view
    }
}
