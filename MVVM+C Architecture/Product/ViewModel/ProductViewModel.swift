//
//  ProductViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import Foundation

class ProductViewModel: ProductViewModelProtocol{
    
    var coordinatorDelegate: ProductViewModelCoordinatorDelegate?
    var productDataSource: ProductDataSource?
    
    public init(){
        self.productDataSource = ProductDataSource()
    }
    
    func getProduct(product: Products){
        self.productDataSource?.productResponse = product
    }
    
}
