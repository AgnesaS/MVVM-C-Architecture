//
//  IntroViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

protocol IntroViewModelProtocol: BaseViewModel {
    var coordinatorDelegate: IntroViewModelCoordinatorDelegate? { get set }
    func loginTapped()
    func signupTapped()
}
