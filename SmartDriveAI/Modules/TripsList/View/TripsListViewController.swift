//
//  TripsListViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import SnapKit
import UIKit

struct TripsListViewModel {
    let trips: [TripListCellViewModel]
}

final class TripsListViewController: UIViewController {

    var output: TripsListViewOutput?
    
    private var viewModel: TripsListViewModel?

    private lazy var titleLabel = makeTitleLabel()
    private lazy var tableView = makeTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
}

// MARK: TripsListViewInput
extension TripsListViewController: TripsListViewInput {
    func setupInitialState() {
        view.backgroundColor = .coreLightGray
        commonInit()
        configureTableView()
    }
    
    func configure(with viewModel: TripsListViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

// MARK: UITableViewDataSource
extension TripsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel?.trips.count ?? 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = viewModel?.trips[indexPath.row]
        var tableCell = UITableViewCell()
        
        if let model,
           let cell = tableView.reuseCell(TripListCell.self, indexPath) {
            cell.configure(with: model)
            tableCell = cell
        }
        tableCell.selectionStyle = .none
        return tableCell
    }
}
// MARK: UITableViewDelegate
extension TripsListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(
            at: indexPath,
            animated: false
        )
        output?.cellWasTapped(indexPath)
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 88
    }
}

// MARK: Private
private extension TripsListViewController {
    
    func commonInit() {
        setupLayout()
        titleLabel.text = "Trips"
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TripListCell.self)
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
                
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textAlignment = .left
        return view
    }

    func makeTableView() -> UITableView {
        let view = UITableView()
        view.backgroundColor = .coreLightGray
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.allowsMultipleSelection = false
        view.separatorStyle = .none
        return view
    }
}
