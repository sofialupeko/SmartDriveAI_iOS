//
//  ProfileViewModelBuilder.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

protocol ProfileViewModelBuilder {
    func buildProfileViewModel(profile: ProfileInfo) -> ProfileViewModel
}

final class ProfileViewModelBuilderImp: ProfileViewModelBuilder {
    func buildProfileViewModel(profile: ProfileInfo) -> ProfileViewModel {
        let styleVM = DrivingStyleInfoViewModel(
            styleName: profile.drivingStyle.name,
            styleColor: profile.drivingStyle.color
        )
        let analysisVM = AnalysisViewModel(
            analysis: [
                .init(
                    title: "Trips number",
                    value: formatCount(profile.analysis.tripsNumber)
                ),
                .init(
                    title: "Total distance",
                    value: formatDistance(profile.analysis.totalDistance)
                ),
                .init(
                    title: "Total duration",
                    value: formatDuration(profile.analysis.totalDuration)
                ),
                .init(
                    title: "Average speed",
                    value: formatSpeed(profile.analysis.averageSpeed)
                ),
                .init(
                    title: "Average number of hard accelerations per trip",
                    value: formatCount(profile.analysis.averageAccelsNumber)
                ),
                .init(
                    title: "Average number of hard brakes per trip",
                    value: formatCount(profile.analysis.averageBrakesNumber)
                ),
                .init(
                    title: "Average number of sharp turns per trip",
                    value: formatCount(profile.analysis.averageTurnsNumber)
                ),
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
    
    private func formatCount(_ value: Int) -> String {
        return String("\(value)")
    }
}
