//
//  AuthorizationViewOutput.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

protocol AuthorizationViewOutput {
    func viewIsReady()
    
    func enterButtonWasTapped()
    func changeAuthProcessButtonWasTapped()
    func emailTextFieldDidChange(_ text: String)
    func passswordTextFieldDidChange(_ text: String)
}
