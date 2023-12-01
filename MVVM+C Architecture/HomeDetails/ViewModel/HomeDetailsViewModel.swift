//
//  HomeViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 29.11.23.
//

import Foundation

class HomeDetailsViewModel: HomeDetailsViewModelProtocol {
    var model: CurrentConditions
    
    var coordinatorDelegate: HomeDetailsViewModelCoordinatorDelegate?
    public init(model: CurrentConditions){
        self.model = model
    }
}
