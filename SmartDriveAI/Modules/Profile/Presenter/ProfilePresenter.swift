//
//  ProfilePresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

final class ProfilePresenter {

    weak var view: ProfileViewInput?
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?

    private let builder: ProfileViewModelBuilder = ProfileViewModelBuilderImp()
}

// MARK: ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    func viewIsReady() {
        interactor?.moduleIsReady()
        view?.setupInitialState()
        interactor?.requestUserProfile()
    }

    func signOutButtonWasTapped() {
        router?.showAuthorization()
    }
}

// MARK: ProfileInteractorOutput
extension ProfilePresenter: ProfileInteractorOutput {
    func profileRequestSuccess(trip: ProfileInfo) {
        view?.configure(with: builder.buildProfileViewModel(trip: trip))
    }
    
    func profileRequestFailed(error: any Error) {
        print("profileRequestFailed: \(error)")
    }
}
