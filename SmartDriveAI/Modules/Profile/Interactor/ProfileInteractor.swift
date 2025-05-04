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
            distance: 578,
            duration: 189,
            averageSpeed: 48
        )
        let profile = ProfileInfo(
            drivingStyle: .moderate,
            analysis: analysis
        )
        output?.profileRequestSuccess(trip: profile)
    }
}
