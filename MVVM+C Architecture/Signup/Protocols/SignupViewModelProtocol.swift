//
//  SignupViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//

import Foundation

protocol SignupViewModelProtocol: BaseViewModel{
    var coordinatorDelegate : SignupViewModelCoordinatorDelegate? {get set}
}
