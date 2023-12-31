//
//  SignupViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import UIKit

class SignupViewController: UIViewController, Storyboarded {
    //MARK: - Properties
    var viewModel: SignupViewModelProtocol?
    var coordinator: SignupCoordinator?
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: IBActions
    @IBAction func backBtnTapped(_ sender: Any) {
        self.coordinator?.stop()
    }
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.viewModel?.showLogin()
    }
    @IBAction func signupBtnTapped(_ sender: Any) {
        self.viewModel?.showHome()
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
