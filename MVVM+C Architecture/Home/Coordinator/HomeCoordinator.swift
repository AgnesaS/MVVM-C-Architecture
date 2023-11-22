//
//  HomeCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import UIKit

class HomeCoordinator: PushCoordinator{
    var navigationController: UINavigationController?
    var viewController: HomeViewController?
    var configuration: ((HomeViewController) -> ())?
    var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol, navigationController: UINavigationController?) {
        self.viewModel = viewModel
        self.navigationController = navigationController
        self.viewController = HomeViewController.instantiate(.home)
        self.viewController?.viewModel = viewModel
    }
    
    
}
