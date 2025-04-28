//
//  NewTripInteractorOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol NewTripInteractorOutput: AnyObject {
    func sendNewTripSuccess()
    func sendNewTripFailed(error: Error)
}
