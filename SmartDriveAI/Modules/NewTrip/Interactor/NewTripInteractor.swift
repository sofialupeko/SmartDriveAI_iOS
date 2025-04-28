//
//  NewTripInteractor.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

final class NewTripInteractor {
    
    weak var output: NewTripInteractorOutput?
    
    
}

// MARK: NewTripInteractorInput
extension NewTripInteractor: NewTripInteractorInput {
    func moduleIsReady() { }
    
    func sendNewTrip() {
        print("sendNewTrip")
    }
}
