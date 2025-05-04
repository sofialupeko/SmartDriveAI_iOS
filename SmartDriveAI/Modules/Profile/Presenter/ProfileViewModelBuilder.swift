//
//  ProfileViewModelBuilder.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

protocol ProfileViewModelBuilder {
    func buildProfileViewModel(trip: ProfileInfo) -> ProfileViewModel
}

final class ProfileViewModelBuilderImp: ProfileViewModelBuilder {
    func buildProfileViewModel(trip: ProfileInfo) -> ProfileViewModel {
        let styleVM = DrivingStyleInfoViewModel(
            styleName: trip.drivingStyle.name,
            styleColor: trip.drivingStyle.color
        )
        let analysisVM = AnalysisViewModel(
            analysis: [
                .init(
                    title: "Distance",
                    value: formatDistance(trip.analysis.distance)
                ),
                .init(
                    title: "Duration",
                    value: formatDuration(trip.analysis.duration)
                ),
                .init(
                    title: "Average speed",
                    value: formatSpeed(trip.analysis.averageSpeed)
                )
            ]
        )
            
        return ProfileViewModel(
            drivingStyle: styleVM,
            drivingAnalysis: analysisVM
        )
    }
    
    private func formatDistance(_ distance: Double) -> String {
        return String("\(distance) km")
    }
    
    private func formatDuration(_ duration: Double) -> String {
        return String("\(duration) min")
    }
    
    private func formatSpeed(_ speed: Double) -> String {
        return String("\(speed) km/h")
    }
}
