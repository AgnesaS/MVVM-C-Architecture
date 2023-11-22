//
//  SplashViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol{
    weak var coordinatorDelegate: SplashViewModelCoordinatorDelegate?
    func splashShown() {
        coordinatorDelegate?.splashShown()
    }
}
