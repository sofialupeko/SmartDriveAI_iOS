//
//  CoreColor.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 26.04.2025.
//

import UIKit

extension UIColor {
    static var coreLightGray: UIColor {
        return UIColor(hex: "F8F8F8") ?? .lightGray
    }
    static var coreGreen: UIColor {
        return UIColor(hex: "07782B") ?? .green
    }
    static var coreOrange: UIColor {
        return UIColor(hex: "D68743") ?? .orange
    }
    static var coreRed: UIColor {
        return UIColor(hex: "D83030") ?? .red
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count == 6 {
            
            var rgbValue: UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        } else {
            return nil
        }
    }
}
