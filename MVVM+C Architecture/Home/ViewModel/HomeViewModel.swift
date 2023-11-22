//
//  HomeViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol{
    var email: String?
    var password: String?
    weak var coordinatorDelegate : HomeViewModelCoordinatorDelegate?
}
