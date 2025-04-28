//
//  AuthorizationInteractorInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol AuthorizationInteractorInput {
    func moduleIsReady()
    
    func requestSignUp(
        email: String,
        password: String
    )
    
    func requestLogIn(
        email: String,
        password: String
    )
}
