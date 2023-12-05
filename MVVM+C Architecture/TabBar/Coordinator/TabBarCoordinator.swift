//
//  TabBarCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    let tabBarController : UITabBarController
    private(set) var appLayout : MainAppLayoutProtocol
    var tabsCoordinator : [Coordinator] = []
    
    var homeTabCoordinator :HomeCoordinator? {
        return tabsCoordinator.first{$0 is HomeCoordinator} as? HomeCoordinator
    }
    
    init(tabBarController: UITabBarController, appLayout: MainAppLayoutProtocol) {
        self.tabBarController = tabBarController
        self.appLayout = appLayout
    }
    
    func start() {
        self.configureTabBar()
    }
    
    private func configureTabBar() {
        var viewControllers : [UIViewController] = []
        let tabs = appLayout.orderedTabs
        
        for tabLayout in tabs {
            let coordinator = tabLayout.tabViewCoordinator()
            coordinator.start()
            tabsCoordinator.append(coordinator)
            if let controller = tabLayout.tabViewController() {
                controller.tabBarItem = tabLayout.tabBarItem()
                controller.tabBarItem.imageInsets = tabLayout.imageInsets()
                viewControllers.append(controller)
            }
        }
        tabBarController.viewControllers = viewControllers.map {
            //BaseNavigationController(rootViewController: $0)
            let nav = UINavigationController(rootViewController: $0)
            nav.navigationBar.isHidden = true
            return nav
        }
    }
}
