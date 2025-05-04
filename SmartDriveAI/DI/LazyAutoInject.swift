//
//  LazyAutoInject.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 03.05.2025.
//

import Swinject

@propertyWrapper
public final class LazyAutoInject<Value> {

    private var value: Value?

    public var wrappedValue: Value {
        get {
            if let value = self.value {
                return value
            } else {
                let newValue = resolveValue()
                value = newValue
                return newValue
            }
        }
        set {
            value = newValue
        }
    }

    public init(value: Value? = nil) {
        self.value = value
    }

    private func resolveValue() -> Value {
        let container = Container.rootContainer.synchronize()

        guard let value = container.resolve(Value.self) else {
            fatalError("Could not resolve non-optional \(Value.self)")
        }

        return value
    }
}
