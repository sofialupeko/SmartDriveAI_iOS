//
//  DrivingStyle.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import UIKit

enum DrivingStyle: String {
    case safe
    case moderate
    case aggressive
    
    var name: String {
        return rawValue.capitalized
    }
    
    var color: UIColor {
        switch self {
        case .safe:
            return .coreGreen
        case .moderate:
            return .coreOrange
        case .aggressive:
            return .coreRed
        }
    }
}
