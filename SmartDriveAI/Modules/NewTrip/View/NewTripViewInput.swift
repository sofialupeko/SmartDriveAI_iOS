//
//  NewTripViewInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol NewTripViewInput: AnyObject {
    func setupInitialState()
    func setupReadyToStartState()
    func setupInProcessState()
    func updateTimerValue(_ value: String)
}
