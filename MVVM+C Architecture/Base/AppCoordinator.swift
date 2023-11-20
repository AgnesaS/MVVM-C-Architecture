//
//  AppCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    var introCoordinator: IntroCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        initializeFirstScreen()
    }
    private func initializeFirstScreen()
    {
        introCoordinator = IntroCoordinator()
//        firstScreenCoordinator?.coordinatorDelegate = self
        introCoordinator?.start()
        if let vc = introCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
}
