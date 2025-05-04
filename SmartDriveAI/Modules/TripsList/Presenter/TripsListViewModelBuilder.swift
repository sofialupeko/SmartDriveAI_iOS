//
//  TripsListViewModelBuilder.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

protocol TripsListViewModelBuilder {
    func buildTripsViewModels(trips: [TripListInfo]) -> [TripListCellViewModel]
}

final class TripsListViewModelBuilderImp: TripsListViewModelBuilder {
    func buildTripsViewModels(trips: [TripListInfo]) -> [TripListCellViewModel] {
        return trips.map { trip in
            TripListCellViewModel(
                imageName: "car.fill",
                date: formatDate(trip.startDateTime),
                time: formatTime(trip.startDateTime),
                distance: formatDistance(trip.analysis.distance),
                styleName: trip.drivingStyle.name,
                styleColor: trip.drivingStyle.color
            )
        }
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
}
