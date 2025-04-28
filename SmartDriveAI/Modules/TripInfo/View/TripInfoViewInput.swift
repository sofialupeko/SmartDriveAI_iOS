//
//  TripInfoViewInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

protocol TripInfoViewInput: AnyObject {
    func setupInitialState()
    func configure(with viewModel: TripInfoViewModel)
}
