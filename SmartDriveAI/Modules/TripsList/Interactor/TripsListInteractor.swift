//
//  TripsListInteractor.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

final class TripsListInteractor {
    
    weak var output: TripsListInteractorOutput?
    
    
}

// MARK: TripsListInteractorInput
extension TripsListInteractor: TripsListInteractorInput {
    func moduleIsReady() { }
    
    func requestUserTrips() {
        let trips: [TripListInfo] = [
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 122.2,
                    duration: 56,
                    averageSpeed: 39
                ),
                drivingStyle: .moderate
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 122.2,
                    duration: 56,
                    averageSpeed: 39
                ),
                drivingStyle: .aggressive
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 122.2,
                    duration: 56,
                    averageSpeed: 39
                ),
                drivingStyle: .safe
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 122.2,
                    duration: 56,
                    averageSpeed: 39
                ),
                drivingStyle: .moderate
            )
        ]
        output?.tripsRequestSuccess(trips: trips)
    }
}
