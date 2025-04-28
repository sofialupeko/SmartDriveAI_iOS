//
//  NewTripPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

import Foundation

enum NewTripState {
    case readyToStart
    case inProcess
    
    mutating func toggle() {
        switch self {
        case .readyToStart:
            self = .inProcess
        case .inProcess:
            self = .readyToStart
        }
    }
}

final class NewTripPresenter {

    weak var view: NewTripViewInput?
    var interactor: NewTripInteractorInput?

    private var email: String = ""
    private var password: String = ""
    private var timer: Timer?
    private var duration: TimeInterval = 0 {
        didSet {
            view?.updateTimerValue(duration.formatted())
        }
    }
    private var state: NewTripState = .readyToStart {
        didSet {
            switch state {
            case .readyToStart:
                view?.setupReadyToStartState()
                duration = 0
                removeTimer()
            case .inProcess:
                view?.setupInProcessState()
                setupTimerIfNeeded()
            }
        }
    }
}

// MARK: NewTripViewOutput
extension NewTripPresenter: NewTripViewOutput {
    func viewIsReady() {
        interactor?.moduleIsReady()
        view?.setupInitialState()
    }
    
    func startStopButtonWasTapped() {
        state.toggle()
    }
}

// MARK: NewTripInteractorOutput
extension NewTripPresenter: NewTripInteractorOutput {
    func sendNewTripSuccess() {
        print("sendNewTripSuccess")
    }
    
    func sendNewTripFailed(error: any Error) {
        print("sendNewTripFailed: \(error)")
    }
}

// MARK: Private
extension NewTripPresenter {
    
    func setupTimerIfNeeded() {
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(timerAction),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc func timerAction() {
        duration += 1
    }
    
    func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
}
