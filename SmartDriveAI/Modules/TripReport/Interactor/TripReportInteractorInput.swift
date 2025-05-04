//
//  TripReportInteractorInput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

protocol TripReportInteractorInput {
    func moduleIsReady()
    
    func requestUserTrip(with id: String)
}
