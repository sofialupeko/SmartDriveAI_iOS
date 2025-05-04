//
//  NewTripPresenter.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

import Foundation
import Swinject

import UIKit //

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
    
    @LazyAutoInject var dataCollector: DataCollector
    private let builder: NewTripViewModelBuilder = NewTripViewModelBuilderImp()

    private var email: String = ""
    private var password: String = ""
    private var timer: Timer?
    private var duration: TimeInterval = 0 {
        didSet {
            view?.updateTimerValue(builder.buildTimerValue(duration))
        }
    }
    private var state: NewTripState = .readyToStart {
        didSet {
            switch state {
            case .readyToStart:
                dataCollector.stopAndSave()
            case .inProcess:
                dataCollector.startCollectData()
            }
        }
    }
}

// MARK: NewTripViewOutput
extension NewTripPresenter: NewTripViewOutput {
    func viewIsReady() {
        dataCollector.delegate = self
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

// MARK: DataCollectorDelegate
extension NewTripPresenter: DataCollectorDelegate {
    func collectDataStart() {
        view?.setupInProcessState(animated: true)
        setupTimerIfNeeded()
    }
    
    func collectDataStop() {
        view?.setupReadyToStartState(animated: true)
        duration = 0
        removeTimer()
    }
    
    func dataWasSaved(to url: URL) {
        let activityViewController = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )
        if let topController = UIApplication.shared.windows.first?.rootViewController {
            topController.present(
                activityViewController,
                animated: true,
                completion: nil
            )
        }
        
        print("Данные успешно сохранены в \(url)")
    }
    
    func dataSaveError(_ error: any Error) {
        print("Ошибка сохранения данных: \(error)")
    }
    
    func sensorsError() {
        print("Ошибка доступа к датчикам. Настройте доступы в настройках")
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
