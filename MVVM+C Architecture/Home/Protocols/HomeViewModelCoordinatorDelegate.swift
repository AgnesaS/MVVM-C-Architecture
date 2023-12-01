//
//  HomeViewModelCoordinatorDelegate.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: class{
   func showHomeInfo(model: CurrentConditions)
 //   func showHomeInfo(model: [CurrentConditions])
//    func logOut()
}
