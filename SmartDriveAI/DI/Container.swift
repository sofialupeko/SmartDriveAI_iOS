//
//  Container.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 03.05.2025.
//

import Swinject

extension Container {
    static var rootContainer = Container(defaultObjectScope: .transient)

    static func prepareRootContainer() {
        let container = rootContainer

        let containerPrepared = container.resolve(Bool.self, name: "container_prepared_flag") ?? false
        guard !containerPrepared else { return }

        prepareConfigValues()

        container.register(DataCollector.self) { _ in
            let storage = DataCollectorImp()
            return storage
        }
        .inObjectScope(.container)
    }

    static func prepareConfigValues() {
        let container = rootContainer

        container.register(Bool.self, name: "container_prepared_flag") { _ in
            true
        }
    }
}
