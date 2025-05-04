//
//  TripsListInteractorOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

protocol TripsListInteractorOutput: AnyObject {
    func tripsRequestSuccess(trips: [TripListInfo])
    func tripsRequestFailed(error: Error)
}
