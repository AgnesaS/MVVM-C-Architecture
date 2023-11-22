//
//  SplashCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//

import UIKit

protocol SplashCoordinatorDelegate: class {
    func splashShownSuccessful()
}
class SplashCoordinator: DefaultCoordinator{
    var viewController: SplashViewController?
    var viewModel: SplashViewModelProtocol
    var introCoordinator: IntroCoordinator?
    var coordinatorDelegate: SplashCoordinatorDelegate?
    
    init(viewModel: SplashViewModelProtocol = SplashViewModel()){
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    func start() {
        self.viewController = SplashViewController.instantiate(.splash)
        self.viewController?.viewModel = self.viewModel
    }
}
extension SplashCoordinator: SplashViewModelCoordinatorDelegate{
    func splashShown() {
        self.coordinatorDelegate?.splashShownSuccessful()
    }
}
