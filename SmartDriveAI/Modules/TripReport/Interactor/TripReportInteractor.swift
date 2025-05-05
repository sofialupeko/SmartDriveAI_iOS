//
//  TripReportInteractor.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

final class TripReportInteractor {
    
    weak var output: TripReportInteractorOutput?
    
    
}

// MARK: TripReportInteractorInput
extension TripReportInteractor: TripReportInteractorInput {
    func moduleIsReady() { }
    
    func requestUserTrip(with id: String) {
        let trip = TripReportInfo(
            id: id,
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
            drivingStyle: .moderate,
            recommendations: [
                "Use cruise control",
                "Avoid sudden braking",
                "Increase following distance"
            ]
        )
        output?.tripRequestSuccess(trip: trip)
    }
}
