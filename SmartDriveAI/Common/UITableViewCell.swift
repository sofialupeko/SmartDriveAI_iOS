//
//  UITableViewCell.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import UIKit

public extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}
