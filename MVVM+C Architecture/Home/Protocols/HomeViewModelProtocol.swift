//
//  HomeViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation

protocol HomeViewModelProtocol :  BaseViewModel {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate? {get set}
      var email: String? { get set }
      var password: String? { get set }
    
}
