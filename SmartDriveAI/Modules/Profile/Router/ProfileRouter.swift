//
//  ProfileRouter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 03.05.2025.
//

import UIKit

final class ProfileRouter: ProfileRouterInput {
    weak var view: UIViewController?
    
    func showAuthorization() {
        let auth = configureAuthorizationModule()
        view?.present(auth, animated: true)
    }
    
    private func configureAuthorizationModule() -> UIViewController {
        let vc = AuthorizationViewController()
        vc.modalPresentationStyle = .overFullScreen
        
        let presenter = AuthorizationPresenter()
        vc.output = presenter
        presenter.view = vc

        let interactor = AuthorizationInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        return vc
    }
}
