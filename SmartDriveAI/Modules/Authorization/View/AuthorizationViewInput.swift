//
//  AuthorizationViewInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol AuthorizationViewInput: AnyObject {
    func setupInitialState()
    func setupSignUpState()
    func setupLogInState()
}
