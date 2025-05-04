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
                distance: 733.9,
                duration: 287.2,
                averageSpeed: 102.1
            ),
            drivingStyle: .aggressive,
            recommendations: [
                "Use cruise control",
                "Avoid sudden braking"
            ]
        )
        output?.tripRequestSuccess(trip: trip)
    }
}
