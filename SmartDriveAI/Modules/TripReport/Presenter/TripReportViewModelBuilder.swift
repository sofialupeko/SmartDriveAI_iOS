//
//  TripReportViewModelBuilder.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

protocol TripReportViewModelBuilder {
    func buildTripReportViewModel(trip: TripReportInfo) -> TripReportViewModel
}

final class TripReportViewModelBuilderImp: TripReportViewModelBuilder {
    func buildTripReportViewModel(trip: TripReportInfo) -> TripReportViewModel {
        let topVM = TripReportTopViewModel(
            date: formatDate(trip.startDateTime),
            time: formatTime(trip.startDateTime),
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
        let recommendationsVM = TripReportRecommendationsViewModel(
            recommendations: trip.recommendations
        )
        return TripReportViewModel(
            topViewModel: topVM,
            analysisViewModel: analysisVM,
            recommendationsViewModel: recommendationsVM
        )
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
    
    private func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
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
