//
//  MainTabbarViewController.swift
//  SmartDriveAI
//
//  Created by Lupeko Sofia on 23.04.2025.
//

import UIKit

final class MainTabbarViewController: UITabBarController {
    
    func configure() {
        for (idx, tabBatItem) in tabBar.items!.enumerated() {
            switch idx {
            case 0:
                tabBatItem.image = UIImage(systemName: "list.bullet")
                tabBatItem.title = "Trips".localizedLowercase
            case 1:
                tabBatItem.image = UIImage(systemName: "plus")
                tabBatItem.title = "New trip".localizedLowercase
            case 2:
                tabBatItem.image = UIImage(systemName: "person.fill")
                tabBatItem.title = "Profile".localizedLowercase
            default:
                break
            }
        }

        tabBar.backgroundColor = .white
        tabBar.tintColor = .blue
        tabBar.barTintColor = .black
        tabBar.unselectedItemTintColor = .black

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .white
            tabBar.scrollEdgeAppearance = appearance
            tabBar.standardAppearance = appearance
            UITableView.appearance().sectionHeaderTopPadding = 0.0
        }
    }
}
