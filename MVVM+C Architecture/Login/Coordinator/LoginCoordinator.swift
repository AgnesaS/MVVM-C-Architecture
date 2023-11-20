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
    
    init(viewModel: LoginViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
     //   self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = LoginViewController.instantiate(.login)
        self.viewController?.viewModel = viewModel
    }
}

