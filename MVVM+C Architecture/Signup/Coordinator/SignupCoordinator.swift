//
//  File.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//

import UIKit

class SignupCoordinator: PushCoordinator{
    
    var viewController: SignupViewController?
    var navigationController: UINavigationController?
    var configuration: ((SignupViewController) -> ())?
    var viewModel: SignupViewModelProtocol
    var loginCoordinator: LoginCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init(viewModel: SignupViewModelProtocol, navigationController: UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = SignupViewController.instantiate(.signup)
        self.viewController?.viewModel = viewModel
    }
}
extension SignupCoordinator: SignupViewModelCoordinatorDelegate {
    func showHome() {
        homeCoordinator = HomeCoordinator(viewModel: HomeViewModel(), navigationController: self.viewController?.navigationController)
        homeCoordinator?.start()
    }
    
    func showLogin() {
        loginCoordinator = LoginCoordinator(viewModel: LoginViewModel(), navigationController: self.viewController?.navigationController)
        loginCoordinator?.start()
    }
}
