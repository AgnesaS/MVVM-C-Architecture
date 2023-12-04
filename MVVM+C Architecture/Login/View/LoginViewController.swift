//
//  LoginViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
  
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkView: UIView!
    
    //MARK: - Properties
    var viewModel: LoginViewModelProtocol?
    var coordinator: LoginCoordinator?
    var checkState = false
    
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
        self.viewModel?.showHome()
        
    }
    @IBAction func signupBtnTapped(_ sender: Any) {
        self.viewModel?.showSignup()
    }
    @IBAction func checkViewTapped(_ sender: Any) {
        if checkState == false {
              let systemImageView = UIImageView(image: UIImage(systemName: "checkmark"))
              systemImageView.tintColor = .blue
              checkView.subviews.forEach { $0.removeFromSuperview() }
              checkView.addSubview(systemImageView)
              systemImageView.center = CGPoint(x: checkView.bounds.midX, y: checkView.bounds.midY)
          } else {
              checkView.subviews.forEach { $0.removeFromSuperview() }
          }
          checkState.toggle()
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
