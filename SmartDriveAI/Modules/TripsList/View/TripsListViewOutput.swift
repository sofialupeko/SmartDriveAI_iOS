//
//  TripsListViewOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import Foundation

protocol TripsListViewOutput {
    func viewIsReady()
    
    func cellWasTapped(_ index: IndexPath)
}
