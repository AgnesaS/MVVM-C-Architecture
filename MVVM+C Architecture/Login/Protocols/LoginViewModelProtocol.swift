//
//  LoginViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 18.11.23.
//

import Foundation

protocol LoginViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : LoginViewModelCoordinatorDelegate? {get set}
}
