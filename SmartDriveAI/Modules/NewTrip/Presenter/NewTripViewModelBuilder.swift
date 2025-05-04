//
//  NewTripViewModelBuilder.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 03.05.2025.
//

import Foundation

protocol NewTripViewModelBuilder {
    func buildTimerValue(_ time: TimeInterval) -> String
}

final class NewTripViewModelBuilderImp: NewTripViewModelBuilder {
    func buildTimerValue(_ time: TimeInterval) -> String {
        guard time > 0 else {
            return "00:00:00"
        }
        
        let seconds = Int(time)
        let minutes = seconds / 60
        let hours = minutes / 60
        
        let secondsPart = seconds % 60
        let minutesPart = minutes % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutesPart, secondsPart)
    }
}
