//
//  LoginViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    //MARK: - Properties
    var viewModel: LoginViewModelProtocol?
    var coordinator: LoginCoordinator?
    var email: String?
    var password: String?
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  //MARK: - IBActions
    @IBAction func backBtnTapped(_ sender: Any) {
        self.coordinator?.stop()
    }
    @IBAction func forgotPassBtnTapped(_ sender: Any) {
    }
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.viewModel?.showHome(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        
    }
    @IBAction func signupBtnTapped(_ sender: Any) {
        self.viewModel?.showSignup()
    }
}
extension LoginViewController : Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? LoginCoordinator
    }
}
