//
//  DataCollector.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 14.02.2025.
//

import CoreLocation
import CoreMotion

protocol DataCollectorDelegate: AnyObject {
    func collectDataStart()
    func collectDataStop()
    func dataWasSaved(to url: URL)
    func dataSaveError(_ error: Error)
    func sensorsError()
}

protocol DataCollector {
    var delegate: DataCollectorDelegate? { get set }
    
    func startCollectData()
    func stopAndSave()
}

final class DataCollectorImp: NSObject, DataCollector {
    weak var delegate: DataCollectorDelegate?
    
    private let motionManager = CMMotionManager()
    private let locationManager = CLLocationManager()
    private var data = "timestamp,acc_x,acc_y,acc_z,gyro_x,gyro_y,gyro_z,speed_kmh,latitude,longitude\n"
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }

    // Сбор данных с акселерометра и гироскопа
    func startCollectData() {
        guard motionManager.isAccelerometerAvailable, motionManager.isGyroAvailable else {
            delegate?.sensorsError()
            return
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 1  // Обновление при изменении на 1 метр
        
        locationManager.startUpdatingLocation()
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.gyroUpdateInterval = 0.1
        
        motionManager.startAccelerometerUpdates(to: .main) { (accData, _) in
            guard let acc = accData?.acceleration else { return }
            self.currentAcc = (acc.x, acc.y, acc.z)
        }
        
        motionManager.startGyroUpdates(to: .main) { (gyroData, _) in
            guard let gyro = gyroData?.rotationRate else { return }
            self.currentGyro = (gyro.x, gyro.y, gyro.z)
        }
        
        delegate?.collectDataStart()
    }
    
    // Сохранение данных в файл
    func stopAndSave() {
        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
        
        delegate?.collectDataStop()
        
        let timestamp = Date().timeIntervalSince1970
        let fileName = "driving_data_\(Int(timestamp)).csv"
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL, atomically: true, encoding: .utf8)
            delegate?.dataWasSaved(to: fileURL)
        } catch {
            delegate?.dataSaveError(error)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // Текущие значения датчиков
    private var currentAcc = (x: 0.0, y: 0.0, z: 0.0)
    private var currentGyro = (x: 0.0, y: 0.0, z: 0.0)
}

extension DataCollectorImp: CLLocationManagerDelegate {
    // Обработка обновлений GPS
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.last else { return }
        let timestamp = Date()
        
        let entry = "\(timestamp),\(currentAcc.x),\(currentAcc.y),\(currentAcc.z),\(currentGyro.x),\(currentGyro.y),\(currentGyro.z),\(location.speed * 3.6),\(location.coordinate.latitude),\(location.coordinate.longitude)\n"
        
        data.append(entry)
    }
}
