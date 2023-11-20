//
//  IntroViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import UIKit

class IntroViewController: UIViewController, Storyboarded {

    var viewModel: IntroViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        self.viewModel?.loginTapped()
        print("Login tapped")
    }
    

    @IBAction func signupTapped(_ sender: Any) {
        self.viewModel?.signupTapped()
    }
    
}
