//
//  AuthorizationInteractorOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol AuthorizationInteractorOutput: AnyObject {
    func authorizationSuccess()
    func authorizationFailed(error: Error)
}
