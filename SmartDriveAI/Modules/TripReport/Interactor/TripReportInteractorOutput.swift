//
//  TripReportInteractorOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

protocol TripReportInteractorOutput: AnyObject {
    func tripRequestSuccess(trip: TripReportInfo)
    func tripRequestFailed(error: Error)
}
