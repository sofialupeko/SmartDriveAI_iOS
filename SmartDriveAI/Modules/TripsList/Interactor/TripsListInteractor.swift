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
                    distance: 24.2,
                    duration: 35.6,
                    averageSpeed: 83.3,
                    brakesNumber: 2,
                    accelsNumber: 1,
                    turnsNumber: 4,
                    averageGyroRate: 0.6
                ),
                drivingStyle: .moderate
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 45.2,
                    duration: 78.3,
                    averageSpeed: 102.3,
                    brakesNumber: 4,
                    accelsNumber: 5,
                    turnsNumber: 2,
                    averageGyroRate: 0.1
                ),
                drivingStyle: .aggressive
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 14.2,
                    duration: 32.2,
                    averageSpeed: 32.3,
                    brakesNumber: 2,
                    accelsNumber: 3,
                    turnsNumber: 2,
                    averageGyroRate: 0.3
                ),
                drivingStyle: .safe
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 83.6,
                    duration: 109.4,
                    averageSpeed: 88.9,
                    brakesNumber: 2,
                    accelsNumber: 5,
                    turnsNumber: 2,
                    averageGyroRate: 0.3
                ),
                drivingStyle: .moderate
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 36.6,
                    duration: 57.8,
                    averageSpeed: 46.9,
                    brakesNumber: 6,
                    accelsNumber: 2,
                    turnsNumber: 1,
                    averageGyroRate: 0.2
                ),
                drivingStyle: .moderate
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 94.6,
                    duration: 108.3,
                    averageSpeed: 91.9,
                    brakesNumber: 3,
                    accelsNumber: 4,
                    turnsNumber: 2,
                    averageGyroRate: 0.2
                ),
                drivingStyle: .moderate
            ),
            .init(
                id: "",
                startDateTime: Date(),
                analysis: .init(
                    distance: 12.7,
                    duration: 30.4,
                    averageSpeed: 37.6,
                    brakesNumber: 1,
                    accelsNumber: 3,
                    turnsNumber: 1,
                    averageGyroRate: 0.1
                ),
                drivingStyle: .safe
            )
        ]
        output?.tripsRequestSuccess(trips: trips)
    }
}
