//
//  TripsListPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import Foundation

final class TripsListPresenter {

    weak var view: TripsListViewInput?
//    var interactor: AuthorizationInteractorInput?

}

// MARK: TripsListViewOutput
extension TripsListPresenter: TripsListViewOutput {
    func viewIsReady() {
//        interactor?.moduleIsReady()
        view?.setupInitialState()
        
        view?.configure(
            with: TripsListViewModel(
                trips: [
                    .init(
                        imageName: "car.fill",
                        date: "April 19, 2024",
                        time: "11:30 - 12:00",
                        distance: "15,2 km",
                        style: "Moderate"
                    ),
                    .init(
                        imageName: "car.fill",
                        date: "April 19, 2024",
                        time: "11:30 - 12:00",
                        distance: "15,2 km",
                        style: "Moderate"
                    ),
                    .init(
                        imageName: "car.fill",
                        date: "April 19, 2024",
                        time: "11:30 - 12:00",
                        distance: "15,2 km",
                        style: "Moderate"
                    ),
                    .init(
                        imageName: "car.fill",
                        date: "April 19, 2024",
                        time: "11:30 - 12:00",
                        distance: "15,2 km",
                        style: "Moderate"
                    ),
                    .init(
                        imageName: "car.fill",
                        date: "April 19, 2024",
                        time: "11:30 - 12:00",
                        distance: "15,2 km",
                        style: "Moderate"
                    )
                ]
            )
        )
    }

    func cellWasTapped(_ index: IndexPath) {
        print("cellWasTapped: \(index)")
        
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
