//
//  TripInfoPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 27.04.2025.
//

import Foundation

final class TripInfoPresenter {

    weak var view: TripInfoViewInput?
//    var interactor: AuthorizationInteractorInput?

}

// MARK: TripInfoViewOutput
extension TripInfoPresenter: TripInfoViewOutput {
    func viewIsReady() {
//        interactor?.moduleIsReady()
        view?.setupInitialState()
        
        view?.configure(
            with: TripInfoViewModel(
                topViewModel: TripInfoTopViewModel(
                    date: "April 19, 2024",
                    time: "11:30 - 12:00",
                    style: "Moderate"
                ),
                analysisViewModel: AnalysisViewModel(
                    analysis: [
                        .init(title: "Distance", value: "54,3 km"),
                        .init(title: "Average speed Average speed Average speed", value: "120 km/h"),
                        .init(title: "Average speed", value: "120 km/h")
                    ]
                ),
                recommendationsViewModel: TripInfoRecommendationsViewModel(
                    recommendations: [
                        .init(text: "Avoid rapid accelerations and hard braking"),
                        .init(text: "Use cruise control on highways"),
                        .init(text: "Keep tires properly inflated")
                    ]
                )
            )
        )
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
