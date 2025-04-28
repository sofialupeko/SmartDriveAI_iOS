//
//  UITableView.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(
            T.self,
            forCellReuseIdentifier: T.reuseIdentifier
        )
    }

    func reuseCell<T: UITableViewCell>(
        _ type: T.Type,
        _ indexPath: IndexPath
    ) -> T? {
        dequeueReusableCell(
            withIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T
    }
}
