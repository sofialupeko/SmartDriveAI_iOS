//
//  TripReportViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct TripReportViewModel {
    let topViewModel: TripReportTopViewModel
    let analysisViewModel: AnalysisViewModel
    let recommendationsViewModel: TripReportRecommendationsViewModel
}

final class TripReportViewController: UIViewController {

    var output: TripReportViewOutput?

    private lazy var navigationView = TripReportNavigationView()
    private lazy var scrollView = makeScrollView()
    private lazy var stackView = makeStackView()
    private lazy var topView = TripReportTopView()
    private lazy var analysisView = AnalysisView()
    private lazy var recommendationsView = TripReportRecommendationsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

// MARK: TripsListViewInput
extension TripReportViewController: TripReportViewInput {
    func setupInitialState() {
        navigationView.output = self
        commonInit()
    }
    
    func configure(with viewModel: TripReportViewModel) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        topView.configure(with: viewModel.topViewModel)
        stackView.addArrangedSubview(topView)

        analysisView.configure(with: viewModel.analysisViewModel)
        stackView.addArrangedSubview(analysisView)

        recommendationsView.configure(with: viewModel.recommendationsViewModel)
        stackView.addArrangedSubview(recommendationsView)
    }
}

// MARK: TripReportNavigationViewOutput
extension TripReportViewController: TripReportNavigationViewOutput {
    func backButtonWasTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: Private
private extension TripReportViewController {
    
    func commonInit() {
        setupLayout()
        view.backgroundColor = .coreLightGray
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        view.addSubview(navigationView)
                
        navigationView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().priority(.low)
        }
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
        view.spacing = 16
        return view
    }
}
