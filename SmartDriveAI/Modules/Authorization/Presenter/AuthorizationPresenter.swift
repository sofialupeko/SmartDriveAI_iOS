//
//  AuthorizationPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

enum AuthorizationProcess {
    case signUp
    case logIn
    
    mutating func toggle() {
        switch self {
        case .signUp:
            self = .logIn
        case .logIn:
            self = .signUp
        }
    }
}

final class AuthorizationPresenter {

    weak var view: AuthorizationViewInput?
    var interactor: AuthorizationInteractorInput?

    private var email: String = ""
    private var password: String = ""
    private var authProcess: AuthorizationProcess = .signUp {
        didSet {
            switch authProcess {
            case .signUp:
                view?.setupSignUpState()
            case .logIn:
                view?.setupLogInState()
            }
        }
    }
}

// MARK: AuthorizationViewOutput
extension AuthorizationPresenter: AuthorizationViewOutput {
    func viewIsReady() {
        interactor?.moduleIsReady()
        view?.setupInitialState()
    }
    
    func enterButtonWasTapped() {
        switch authProcess {
        case .signUp:
            interactor?.requestSignUp(
                email: email,
                password: password
            )
        case .logIn:
            interactor?.requestLogIn(
                email: email,
                password: password
            )
        }
    }
    
    func changeAuthProcessButtonWasTapped() {
        authProcess.toggle()
    }
    
    func emailTextFieldDidChange(_ text: String) {
        email = text
    }
    
    func passswordTextFieldDidChange(_ text: String) {
        password = text
    }
}

// MARK: AuthorizationInteractorOutput
extension AuthorizationPresenter: AuthorizationInteractorOutput {
    func authorizationSuccess() {
        print("authorizationSuccess")
    }
    
    func authorizationFailed(error: any Error) {
        print("authorizationFailed: \(error)")
    }
    
}
