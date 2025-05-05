//
//  TripsListRouter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 04.05.2025.
//

import UIKit

final class TripsListRouter: TripsListRouterInput {
    weak var view: UIViewController?
    
    func openTripReport(for tripID: String) {
        let trip = configureTripReportModule()
        view?.navigationController?.pushViewController(trip, animated: true)
    }
    
    func configureTripReportModule() -> UIViewController {
        let vc = TripReportViewController()
        vc.modalPresentationStyle = .overFullScreen
        
        let presenter = TripReportPresenter()
        vc.output = presenter
        presenter.view = vc

        let interactor = TripReportInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        return vc
    }
}
