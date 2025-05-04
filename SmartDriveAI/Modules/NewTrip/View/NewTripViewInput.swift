//
//  NewTripViewInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol NewTripViewInput: AnyObject {
    func setupInitialState()
    func setupReadyToStartState(animated: Bool)
    func setupInProcessState(animated: Bool)
    func updateTimerValue(_ value: String)
}
