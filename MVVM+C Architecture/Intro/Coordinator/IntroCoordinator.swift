//
//  IntroCoordinator.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//
import Foundation
import UIKit

protocol IntroCoordinatorDelegate: class{
    func initIntro()
}
class IntroCoordinator: DefaultCoordinator{
    var viewController : IntroViewController?
    var viewModel : IntroViewModelProtocol
    var loginCoordinator: LoginCoordinator?
    var signupCoordinator: SignupCoordinator?
    var coordinatorDelegate: IntroCoordinatorDelegate?

    init(viewModel: IntroViewModelProtocol = IntroViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    func start() {
        self.viewController = IntroViewController.instantiate(.intro)
        self.viewController?.viewModel = self.viewModel
    }
}
extension IntroCoordinator: IntroViewModelCoordinatorDelegate{
    func showSignupScreen() {
        signupCoordinator = SignupCoordinator(viewModel: SignupViewModel(), navigationController: self.viewController?.navigationController)
        signupCoordinator?.start()
    }
    func showLoginScreen() {
        loginCoordinator = LoginCoordinator(viewModel: LoginViewModel(), navigationController: viewController?.navigationController)
        loginCoordinator?.start()
        //print("second screen")
    }
    func initialShow() {
        self.coordinatorDelegate?.initIntro()
    }
}
