//
//  TripListCell.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct TripListCellViewModel {
    let imageName: String
    let date: String
    let time: String
    let distance: String
    let style: String
}

final class TripListCell: UITableViewCell {
    private lazy var background = UIView()
    private lazy var image = makeImageView()
    private lazy var topContainer = UIView()
    private lazy var dateLabel = makeDateLabel()
    private lazy var timeLabel = makeTimeLabel()
    private lazy var bottomContainer = UIView()
    private lazy var distanceLabel = makeDistanceLabel()
    private lazy var styleLabel = makeStyleLabel()
    private lazy var chevron = makeChevronView()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TripListCellViewModel) {
        image.image = UIImage(systemName: viewModel.imageName)
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        distanceLabel.text = viewModel.distance
        styleLabel.text = viewModel.style
    }
}

private extension TripListCell {
    func commonInit() {
        setupLayout()
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        background.backgroundColor = .white
        background.layer.cornerRadius = 16
        distanceLabel.setContentCompressionResistancePriority(.defaultLow - 1, for: .horizontal)
        distanceLabel.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
        
        chevron.image = UIImage(systemName: "chevron.right")
    }
    
    func setupLayout() {
        contentView.addSubview(background)
        background.addSubview(image)
        background.addSubview(topContainer)
        background.addSubview(bottomContainer)
        topContainer.addSubview(dateLabel)
        topContainer.addSubview(timeLabel)
        bottomContainer.addSubview(distanceLabel)
        bottomContainer.addSubview(styleLabel)
        bottomContainer.addSubview(chevron)
        
        background.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        topContainer.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.top.trailing.equalToSuperview().inset(8)
        }
        bottomContainer.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.bottom.trailing.equalToSuperview().inset(8)
            make.top.greaterThanOrEqualTo(topContainer.snp.bottom).offset(4)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        distanceLabel.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
        }
        styleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(distanceLabel.snp.trailing).offset(4)
        }
        chevron.snp.makeConstraints { make in
            make.leading.equalTo(styleLabel.snp.trailing).offset(4)
            make.trailing.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }
    
    func makeChevronView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = .black
        return view
    }
    
    func makeDateLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }
    
    func makeTimeLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }
    
    func makeDistanceLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }
    
    func makeStyleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .italicSystemFont(ofSize: 18)
        view.textAlignment = .right
        view.numberOfLines = 1
        return view
    }
}
