//
//  SignupViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//

import Foundation

class SignupViewModel: SignupViewModelProtocol{
    weak var coordinatorDelegate: SignupViewModelCoordinatorDelegate?
    func showLogin() {
        self.coordinatorDelegate?.showLogin()
    }
    func showHome() {
        self.coordinatorDelegate?.showHome()
    }
}
