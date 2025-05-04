//
//  TripReportInfo.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 01.05.2025.
//

import Foundation

struct TripReportInfo {
    let id: String
    let startDateTime: Date
    let analysis: TripAnalysis
    let drivingStyle: DrivingStyle
    let recommendations: [String]
}
