//
//  ProfileInteractorOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

protocol ProfileInteractorOutput: AnyObject {
    func profileRequestSuccess(trip: ProfileInfo)
    func profileRequestFailed(error: Error)
}
