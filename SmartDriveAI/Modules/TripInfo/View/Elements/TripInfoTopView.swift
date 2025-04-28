//
//  TripInfoTopView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct TripInfoTopViewModel {
    let date: String
    let time: String
    let style: String
}

final class TripInfoTopView: UIView {
    private lazy var dateLabel = makeDateLabel()
    private lazy var timeLabel = makeTimeLabel()
    private lazy var styleLabel = makeStyleLabel()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TripInfoTopViewModel) {
        timeLabel.text = viewModel.time
        dateLabel.text = viewModel.date
        styleLabel.text = viewModel.style
    }
}

private extension TripInfoTopView {
    func commonInit() {
        setupLayout()
        
    }
    
    func setupLayout() {
        addSubview(dateLabel)
        addSubview(timeLabel)
        addSubview(styleLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        timeLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom)
            make.trailing.equalTo(dateLabel)
        }
        styleLabel.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
            make.leading.equalTo(dateLabel.snp.trailing).offset(4)
        }
    }
    
    func makeDateLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 24, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }
    
    func makeTimeLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 24, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }
    
    func makeStyleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .italicSystemFont(ofSize: 24)
        view.textAlignment = .right
        view.numberOfLines = 1
        return view
    }
}
