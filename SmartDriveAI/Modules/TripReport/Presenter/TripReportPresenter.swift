//
//  TripReportPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 27.04.2025.
//

import Foundation

final class TripReportPresenter {

    weak var view: TripReportViewInput?
    var interactor: TripReportInteractorInput?
    
    private let builder: TripReportViewModelBuilder = TripReportViewModelBuilderImp()
}

// MARK: TripReportViewOutput
extension TripReportPresenter: TripReportViewOutput {
    func viewIsReady() {
        interactor?.moduleIsReady()
        view?.setupInitialState()
        interactor?.requestUserTrip(with: "")
    }
}

// MARK: TripReportInteractorOutput
extension TripReportPresenter: TripReportInteractorOutput {
    func tripRequestSuccess(trip: TripReportInfo) {
        view?.configure(with: builder.buildTripReportViewModel(trip: trip))
    }
    
    func tripRequestFailed(error: any Error) {
        print("tripRequestFailed: \(error)")
    }
}
