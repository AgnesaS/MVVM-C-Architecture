//
//  File.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//

import UIKit

class SignupCoordinator: PushCoordinator {
    var viewController: SignupViewController?
    var navigationController: UINavigationController?
    var configuration: ((SignupViewController) -> ())?
    var viewModel: SignupViewModelProtocol
    
    init(viewModel: SignupViewModelProtocol, navigationController: UINavigationController?) {
        self.viewModel = viewModel
        self.navigationController = navigationController
        self.viewController = SignupViewController.instantiate(.signup)
        self.viewController?.viewModel = viewModel
    }
    
    
    
}
