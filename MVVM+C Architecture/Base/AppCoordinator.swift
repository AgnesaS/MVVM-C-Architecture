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
    var tabCoordinator: TabBarCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        initializeMainApp()
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
    func initializeMainApp(){
        let tabBarController = MainTabBarContainer.instantiate(.tabBar)
     //   Account.shared.delegate = self
        let nav =  UINavigationController(rootViewController: tabBarController)
        UIApplication.shared.windows.first?.rootViewController = nav
        tabCoordinator = TabBarCoordinator(tabBarController:tabBarController, appLayout: MainAppLayout())
        tabCoordinator?.start()
    }
    
}
extension AppCoordinator: SplashCoordinatorDelegate {
    func splashShownSuccessful() {
        self.splashCoordinator = nil
        self.initializeIntro()
    }
}

