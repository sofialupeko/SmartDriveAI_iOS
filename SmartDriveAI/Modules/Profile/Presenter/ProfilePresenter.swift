//
//  ProfilePresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

final class ProfilePresenter {

    weak var view: ProfileViewInput?
//    var interactor: AuthorizationInteractorInput?

}

// MARK: ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    func viewIsReady() {
//        interactor?.moduleIsReady()
        view?.setupInitialState()
        
        view?.configure(
            with: ProfileViewModel(
                drivingStyle: DrivingStyleInfoViewModel(styleName: "Moderate"),
                drivingAnalysis: AnalysisViewModel(
                    analysis: [
                        .init(title: "Trips", value: "345"),
                        .init(title: "Trips", value: "345"),
                        .init(title: "Total distance", value: "1254,3 km"),
                        .init(title: "Trips", value: "345"),
                        .init(title: "Trips", value: "345"),
                        .init(title: "Average number of harsh accelerations per trip", value: "12"),
                        .init(title: "Average number of harsh accelerations per trip", value: "12")
                    ]
                )
            )
        )
    }

    func signOutButtonWasTapped() {
        print("signOutButtonWasTapped")
    }
}

//// MARK: AuthorizationInteractorOutput
//extension ProfilePresenter: AuthorizationInteractorOutput {
//    func authorizationSuccess() {
//        print("authorizationSuccess")
//    }
//    
//    func authorizationFailed(error: any Error) {
//        print("authorizationFailed: \(error)")
//    }
//    
//}
