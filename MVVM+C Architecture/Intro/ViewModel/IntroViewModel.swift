//
//  IntroViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import Foundation

class IntroViewModel: IntroViewModelProtocol {
    weak var coordinatorDelegate: IntroViewModelCoordinatorDelegate?

    func loginTapped() {
        coordinatorDelegate?.showLoginScreen()
    }

    func signupTapped(){
        coordinatorDelegate?.showSignupScreen()
    }
}
