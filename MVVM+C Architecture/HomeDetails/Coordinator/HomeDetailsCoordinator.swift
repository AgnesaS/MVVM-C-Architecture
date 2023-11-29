//
//  HomeDetailsCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 29.11.23.
//

import UIKit

class HomeDetailsCoordinator: PushCoordinator{
    var navigationController: UINavigationController?
    var viewController: HomeDetailsViewController?
    var configuration: ((HomeDetailsViewController) -> ())?
    var viewModel: HomeDetailsViewModelProtocol
    
    init(viewModel: HomeDetailsViewModelProtocol, navigationController: UINavigationController?){
        self.viewModel = viewModel
        self.navigationController = navigationController
        self.viewController = HomeDetailsViewController.instantiate(.homeDetails)
        self.viewController?.viewModel = viewModel
    }
    
 
    
    
}
