//
//  LoginCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import Foundation
import UIKit
protocol LoginCoordinatorDelegate: class{
    func showSignup()
}

class LoginCoordinator: PushCoordinator{
    var configuration: ((LoginViewController) -> ())?
    var viewController : LoginViewController?
    var navigationController: UINavigationController?
    var viewModel : LoginViewModelProtocol
    var signup : SignupCoordinator?
    var coordinatorDelegate: LoginCoordinatorDelegate?
    
    init(viewModel: LoginViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = LoginViewController.instantiate(.login)
        self.viewController?.viewModel = viewModel
    }
}
extension LoginCoordinator: LoginViewModelCoordinatorDelegate{
    func showSignup(){
        self.coordinatorDelegate?.showSignup()
    }
}

