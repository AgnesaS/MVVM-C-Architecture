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
    var splashCoordinator: SplashCoordinator?
    var introCoordinator: IntroCoordinator?
    var loginCoordinator: LoginCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        initializeSplash()
    }
    private func initializeSplash()
    {
        splashCoordinator = SplashCoordinator()
        splashCoordinator?.coordinatorDelegate = self
        splashCoordinator?.start()
        if let vc = splashCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
    private func initializeIntro()
    {
        introCoordinator = IntroCoordinator(viewModel: IntroViewModel())
        introCoordinator?.start()
        if let vc = introCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
    private func initializeSignup()
    {
        loginCoordinator = LoginCoordinator(viewModel: LoginViewModel(), navigationController: UINavigationController())
        loginCoordinator?.start()
        if let vc = loginCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
}
extension AppCoordinator: SplashCoordinatorDelegate {
    func splashShownSuccessful() {
        self.splashCoordinator = nil
        self.initializeIntro()
    }
}

