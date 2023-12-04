//
//  ProductCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import UIKit

class ProductCoordinator: PushCoordinator {
    var navigationController: UINavigationController?
    var viewController: ProductViewController?
    var configuration: ((ProductViewController) -> ())?
    var viewModel: ProductViewModelProtocol
    
    init(viewModel: ProductViewModel, navigationController: UINavigationController?){
        self.viewModel = viewModel
        self.navigationController = navigationController
        self.viewController = ProductViewController.instantiate(.product)
        self.viewController?.viewModel = viewModel
    }
    
}
