//
//  ProfileInteractor.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

final class ProfileInteractor {
    
    weak var output: ProfileInteractorOutput?
    
    
}

// MARK: ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
    func moduleIsReady() { }
    
    func requestUserProfile() {
        let analysis = ProfileAnalysis(
            tripsNumber: 3,
            totalDistance: 284.2,
            totalDuration: 343.7,
            averageSpeed: 72.5,
            averageBrakesNumber: 7,
            averageAccelsNumber: 4,
            averageGyroRate: 0.2,
            averageTurnsNumber: 3
        )
        let profile = ProfileInfo(
            drivingStyle: .moderate,
            analysis: analysis
        )
        output?.profileRequestSuccess(profile: profile)
    }
}
