//
//  TripReportRecommendationView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 27.04.2025.
//

import SnapKit
import UIKit

final class TripReportRecommendationView: UIView {
    private lazy var titleLabel = makeTitleLabel()
    private lazy var icon = makeIconView()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        titleLabel.text = text
    }
}

private extension TripReportRecommendationView {
    func commonInit() {
        setupLayout()
        icon.image = UIImage(systemName: "circle.fill")
    }
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(icon)
        
        icon.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(8)
            make.size.equalTo(CGSize(width: 6, height: 6))
        }
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(icon.snp.trailing).offset(4)
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 18, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }
    
    func makeIconView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = .black
        return view
    }
}
