//
//  LoginViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    func showSignup() {
        coordinatorDelegate?.showSignup()
    }
    func showHome() {
        coordinatorDelegate?.showHome()
    }
    
   
}
