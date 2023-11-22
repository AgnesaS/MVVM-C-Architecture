//
//  SplashViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//
import Foundation

protocol SplashViewModelProtocol: BaseViewModel{
    var coordinatorDelegate: SplashViewModelCoordinatorDelegate? {get set}
    func splashShown()
}
