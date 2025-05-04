//
//  ViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 14.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var dataCollector = DataCollectorImp()
    
    private var startStopButton = UIButton()
    private var infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataCollector.delegate = self
        isCollectingData = false
        commonInit()
        addTargets()
    }
    
    var isCollectingData: Bool = false {
        didSet {
            startStopButton.isSelected = isCollectingData
            startStopButton.backgroundColor = isCollectingData ? .systemRed : .systemGreen
        }
    }
    
    func commonInit() {
        setupLayout()
        
        view.backgroundColor = .white
        
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.textColor = .black
        infoLabel.text = "Нажмите Старт для начала записи"
        infoLabel.font = .systemFont(ofSize: 24)
        
        startStopButton.layer.cornerRadius = 16
        startStopButton.setTitleColor(.black, for: .normal)
        startStopButton.setTitle("Start", for: .normal)
        startStopButton.setTitle("Stop", for: .selected)
    }
    
    func addTargets() {
        startStopButton.addTarget(
            self,
            action: #selector(startStopButtonTapHandler),
            for: .touchUpInside
        )
    }
    
    @objc func startStopButtonTapHandler() {
        if isCollectingData {
            dataCollector.stopAndSave()
        } else {
            dataCollector.startCollectData()
        }
        isCollectingData.toggle()
    }

    func setupLayout() {
        view.addSubview(infoLabel)
        view.addSubview(startStopButton)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                startStopButton.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -40),
                startStopButton.widthAnchor.constraint(equalToConstant: 300),
                startStopButton.heightAnchor.constraint(equalToConstant: 60),
                startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        )
    }
}

extension ViewController: DataCollectorDelegate {
    func collectDataStart() {
        infoLabel.text = "Запись началась. Нажмите Стоп для остановки"
    }
    
    func collectDataStop() {
        infoLabel.text = "Запись закончена"
    }
    
    func dataWasSaved(to url: URL) {
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        if let topController = UIApplication.shared.windows.first?.rootViewController {
            topController.present(activityViewController, animated: true, completion: nil)
        }
        
        infoLabel.text = "Данные успешно сохранены в \(url)"
    }
    
    func dataSaveError(_ error: any Error) {
        infoLabel.text = "Ошибка сохранения данных: \(error)"
    }
    
    func sensorsError() {
        infoLabel.text = "Ошибка доступа к датчикам. Настройте доступы в настройках"
    }
}
