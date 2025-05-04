//
//  TripReportRecommendationsView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct TripReportRecommendationsViewModel {
    let recommendations: [String]
}

final class TripReportRecommendationsView: UIView {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var stackView = makeStackView()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TripReportRecommendationsViewModel) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        viewModel.recommendations.forEach {
            let view = TripReportRecommendationView()
            view.configure(with: $0)
            stackView.addArrangedSubview(view)
        }
    }
}

private extension TripReportRecommendationsView {
    func commonInit() {
        setupLayout()
        titleLabel.text = "Recommendations"
        backgroundColor = .white
        layer.cornerRadius = 16
    }
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(stackView)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 24, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }
    
    func makeStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }
}
