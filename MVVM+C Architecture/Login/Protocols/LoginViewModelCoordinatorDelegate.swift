//
//  LoginViewModelCoordinatorDelegate.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 18.11.23.
//

import Foundation

protocol LoginViewModelCoordinatorDelegate: AnyObject {
   func showSignup()
    func showHome(email: String, password: String)
}
