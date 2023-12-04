//
//  MainAppLayoutProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import UIKit

protocol MainAppLayoutProtocol {
    var parentCoordinator : CoordinatorDelegate? {get set}
    var orderedTabs :  [TabLayout] {get}
}

// Main Class that returns the supported tab bars for the Home Screen
class MainAppLayout : MainAppLayoutProtocol {
    var parentCoordinator: CoordinatorDelegate?
    var orderedTabs : [TabLayout] {
        get {
            return [
                HomeLayout(coordinator: HomeCoordinator(viewModel: HomeViewModel(), navigationController: UINavigationController?.none)),
                ProductLayout(coordinator: ProductCoordinator(viewModel: ProductViewModel(), navigationController: UINavigationController?.none))
                
            ]
        }
    }
}
