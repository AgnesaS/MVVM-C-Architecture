//
//  HomeViewModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol{
    
    var weatherDataSource: WeatherDataSource?
    var postDataSource: PostDataSource?
    var email: String?
    var password: String?
    weak var coordinatorDelegate : HomeViewModelCoordinatorDelegate?
    func showHomeInfo(model: [CurrentConditions]){
        self.coordinatorDelegate?.showHomeInfo(model: model)
    }
    
    public init(){
        self.weatherDataSource = WeatherDataSource()
        self.postDataSource = PostDataSource()
       // self.weatherDataSource.
    }
    func getWeather(weather: Welcome){
        self.weatherDataSource?.postResponse = weather
    }
    func getPost(post: Welcome){
        self.postDataSource?.postResponse = post
    }
//    func logOut(){
//        self.coordinatorDelegate?.logOut()
//    }
}

