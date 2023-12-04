//
//  TabLayout.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import UIKit

// Protocol that each tab bar needs to confirm to
protocol TabLayout {
    var tabIdentifier : String {get}
    func tabBarItem() -> UITabBarItem
    func tabViewController() -> UIViewController?
    func tabViewCoordinator() -> Coordinator
    func imageInsets() -> UIEdgeInsets
}
