//
//  SignupViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import UIKit

class SignupViewController: UIViewController, Storyboarded {
    
    var viewModel: SignupViewModelProtocol?
    var coordinator: SignupCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SignupViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? SignupCoordinator
    }
    
   
}
