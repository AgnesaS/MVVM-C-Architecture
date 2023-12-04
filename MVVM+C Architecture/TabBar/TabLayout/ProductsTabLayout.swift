//
//  ProductsTabLayout.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import UIKit

/**
 Class for Notifications TabLayout
 - Parameters:
 - Coorindator: DefaultCoordinator that handles routing for the Notifications Tab Bar
 */
class ProductLayout<C:DefaultCoordinator> : TabLayout {
    
    let coordinator : C
    init(coordinator:C) {
        self.coordinator = coordinator
    }
    
    var tabIdentifier : String {
        return "Product"
    }
    
    func tabBarItem() -> UITabBarItem {
        return UITabBarItem(title: nil, image: UIImage(named: "homeNotFilled"), selectedImage: UIImage(named: "homeIcon"))
    }
    
    func imageInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: -50, bottom: -5, right: 0)
    }
    
    func tabViewController() -> UIViewController? {
        return self.coordinator.viewController
    }
    
    func tabViewCoordinator() -> Coordinator {
        return self.coordinator
    }
    
}
