//
//  HomeViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 29.11.23.
//

import Foundation

protocol HomeDetailsViewModelProtocol: BaseViewModel {
    var coordinatorDelegate: HomeDetailsViewModelCoordinatorDelegate? {get set}
    var model: [CurrentConditions] {get set}
}
