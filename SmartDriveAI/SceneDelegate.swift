//
//  SceneDelegate.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 14.02.2025.
//

import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewController = OnboardingViewController()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        Container.prepareRootContainer()
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark

        window?.rootViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        
        let tabBar = MainTabbarViewController()
        tabBar.setViewControllers(
            [
                configureTripsListModule(),
                configureNewTripModule(),
                configureProfileModule()
            ],
            animated: false
        )
        tabBar.configure()
        self.window?.rootViewController = tabBar
                
        let auth = configureAuthorizationModule()
        
        tabBar.present(auth, animated: false)
        
        let onboarding = OnboardingViewController()
        onboarding.modalPresentationStyle = .overFullScreen
        auth.present(onboarding, animated: false)
    }
    
    func configureAuthorizationModule() -> UIViewController {
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
    
    func configureNewTripModule() -> UIViewController {
        let vc = NewTripViewController()
        vc.modalPresentationStyle = .overFullScreen
        
        let presenter = NewTripPresenter()
        vc.output = presenter
        presenter.view = vc

        let interactor = NewTripInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        return UINavigationController(rootViewController: vc)
    }
    
    func configureProfileModule() -> UIViewController {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .overFullScreen
        
        let presenter = ProfilePresenter()
        vc.output = presenter
        presenter.view = vc

        let interactor = ProfileInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        let router = ProfileRouter()
        presenter.router = router
        router.view = vc
        
        return UINavigationController(rootViewController: vc)
    }
    
    func configureTripsListModule() -> UIViewController {
        let vc = TripsListViewController()
        vc.modalPresentationStyle = .overFullScreen
        
        let presenter = TripsListPresenter()
        vc.output = presenter
        presenter.view = vc

        let interactor = TripsListInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        let router = TripsListRouter()
        presenter.router = router
        router.view = vc
        
        return UINavigationController(rootViewController: vc)
    }
}

