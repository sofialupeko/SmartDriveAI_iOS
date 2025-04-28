//
//  TripsListViewInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

protocol TripsListViewInput: AnyObject {
    func setupInitialState()
    func configure(with viewModel: TripsListViewModel)
}
