//
//  TripInfoAnalysisView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct AnalysisViewModel {
    let analysis: [AnalysisInfoViewModel]
}

final class AnalysisView: UIView {
    private lazy var stackView = makeStackView()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: AnalysisViewModel) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        viewModel.analysis.forEach {
            let view = AnalysisInfoView()
            view.configure(with: $0)
            stackView.addArrangedSubview(view)
        }
    }
}

private extension AnalysisView {
    func commonInit() {
        setupLayout()
        backgroundColor = .white
        layer.cornerRadius = 16
    }
    
    func setupLayout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    func makeStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .fill
        view.distribution = .fill
        return view
    }
}
