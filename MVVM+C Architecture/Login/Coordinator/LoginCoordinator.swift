//
//  LoginCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import Foundation
import UIKit

class LoginCoordinator: PushCoordinator{
    var configuration: ((LoginViewController) -> ())?
    var viewController : LoginViewController?
    var navigationController: UINavigationController?
    var viewModel : LoginViewModelProtocol
    var signupCoordinator : SignupCoordinator?
    var homeCoordinator: HomeCoordinator?

    
    init(viewModel: LoginViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = LoginViewController.instantiate(.login)
        self.viewController?.viewModel = viewModel
    }
}
extension LoginCoordinator: LoginViewModelCoordinatorDelegate{
    func showHome() {
        let homeViewModel = HomeViewModel()
        homeCoordinator = HomeCoordinator(viewModel: HomeViewModel(), navigationController: self.viewController?.navigationController)
        homeCoordinator?.start()
    }
    
    func showSignup() {
        signupCoordinator = SignupCoordinator(viewModel: SignupViewModel(), navigationController: self.viewController?.navigationController)
        signupCoordinator?.start()
    }
}

