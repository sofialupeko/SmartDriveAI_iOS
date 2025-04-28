//
//  AuthorizationInteractor.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

final class AuthorizationInteractor {
    
    weak var output: AuthorizationInteractorOutput?
    
    
}

// MARK: AuthorizationInteractorInput
extension AuthorizationInteractor: AuthorizationInteractorInput {
    func moduleIsReady() { }
    
    func requestSignUp(
        email: String,
        password: String
    ) {
        print("SignUp email: \(email), password: \(password)")
    }
    
    func requestLogIn(
        email: String,
        password: String
    ) {
        print("LogIn email: \(email), password: \(password)")
    }
}
