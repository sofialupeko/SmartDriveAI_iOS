//
//  TripsListPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import Foundation

final class TripsListPresenter {

    weak var view: TripsListViewInput?
    var interactor: TripsListInteractorInput?

    private let builder: TripsListViewModelBuilder = TripsListViewModelBuilderImp()
}

// MARK: TripsListViewOutput
extension TripsListPresenter: TripsListViewOutput {
    func viewIsReady() {
        interactor?.moduleIsReady()
        view?.setupInitialState()
        interactor?.requestUserTrips()
    }

    func cellWasTapped(_ index: IndexPath) {
        print("cellWasTapped: \(index)")
        
    }

}

// MARK: TripsListInteractorOutput
extension TripsListPresenter: TripsListInteractorOutput {
    func tripsRequestSuccess(trips: [TripListInfo]) {
        view?.configure(
            with: TripsListViewModel(
                trips: builder.buildTripsViewModels(trips: trips)
            )
        )
    }
    
    func tripsRequestFailed(error: any Error) {
        print("tripsRequestFailed: \(error)")
    }
}
