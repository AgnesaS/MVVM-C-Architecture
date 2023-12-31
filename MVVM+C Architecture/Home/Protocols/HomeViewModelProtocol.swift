//
//  HomeViewModelProtocol.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation

protocol HomeViewModelProtocol :  BaseViewModel {
    var coordinatorDelegate: HomeViewModelCoordinatorDelegate? {get set}
    var weatherDataSource: WeatherDataSource? {get}
    var postDataSource: PostDataSource? {get}
    func showDetailsView(model: CurrentConditions)
    func getWeather(weather: Welcome)
    func getPost(post: Welcome)
    //      func logOut()
}
