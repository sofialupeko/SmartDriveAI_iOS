//
//  TripInfoViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct TripInfoViewModel {
    let topViewModel: TripInfoTopViewModel
    let analysisViewModel: AnalysisViewModel
    let recommendationsViewModel: TripInfoRecommendationsViewModel
}

final class TripInfoViewController: UIViewController {

    var output: TripInfoViewOutput?

    private lazy var titleLabel = makeTitleLabel()
    private lazy var scrollView = makeScrollView()
    private lazy var stackView = makeStackView()
    private lazy var topView = TripInfoTopView()
    private lazy var analysisView = AnalysisView()
    private lazy var recommendationsView = TripInfoRecommendationsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
}

// MARK: TripsListViewInput
extension TripInfoViewController: TripInfoViewInput {
    func setupInitialState() {
        view.backgroundColor = .lightGray
        commonInit()
    }
    
    func configure(with viewModel: TripInfoViewModel) {
        stackView.subviews.forEach { $0.removeFromSuperview() }

        topView.configure(with: viewModel.topViewModel)
        stackView.addArrangedSubview(topView)

        analysisView.configure(with: viewModel.analysisViewModel)
        stackView.addArrangedSubview(analysisView)

        recommendationsView.configure(with: viewModel.recommendationsViewModel)
        stackView.addArrangedSubview(recommendationsView)
    }
}

// MARK: Private
private extension TripInfoViewController {
    
    func commonInit() {
        setupLayout()
        titleLabel.text = "Trip report"
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
                
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().priority(.low)
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .left
        return view
    }
    
    func makeScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }
    
    func makeStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        return view
    }
}
