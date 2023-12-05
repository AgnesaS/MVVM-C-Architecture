//
//  ProductViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import Foundation
protocol ProductViewModelProtocol{
    var coordinatorDelegate: ProductViewModelCoordinatorDelegate? {get set}
    var productDataSource: ProductDataSource? {get}
    func getProduct(product: Products)
}
