//
//  PostModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation
import SwiftyJSON

// MARK: - Welcome
struct Welcome: Codable {
    let queryCost: Int
    let latitude, longitude: Double
    let resolvedAddress, address, timezone: String
    let tzoffset: Int
    let description: String
    let days: [CurrentConditions]
    //let alerts: [JSONAny]
 //   let stations: [String: Station]
    let currentConditions: CurrentConditions
}

// MARK: - CurrentConditions
struct CurrentConditions: Codable{
    let datetime: String
    let datetimeEpoch: Int
    let temp, feelslike, humidity, dew: Double
    let precip, precipprob, snow, snowdepth: Double
  //  let preciptype: [Icon]?
    let windgust, windspeed, winddir, pressure: Double
    let visibility, cloudcover, solarradiation, solarenergy: Double
    let uvindex: Int
  //  let conditions: Conditions
    //let icon: Icon
    //let stations: [ID]?
 //   let source: Source
    let sunrise: String?
    let sunriseEpoch: Int?
    let sunset: String?
    let sunsetEpoch: Int?
    let moonphase, tempmax, tempmin, feelslikemax: Double?
    let feelslikemin, precipcover: Double?
    let severerisk: Int?
    let description: String?
    let hours: [CurrentConditions]?
    
//    func createPost(json: JSON) -> CurrentConditions? {
//        let post = CurrentConditions()
//        
//        if let datetime = json["datetime"].int {
//            post.datetime = datetime
//        }
//        
//        if let datetimeEpoch = json["datetimeEpoc"].string {
//            post.datetimeEpoch = datetimeEpoch
//        }
//
//        return post
//    }
}


