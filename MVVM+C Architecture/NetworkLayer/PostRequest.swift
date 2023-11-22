//
//  PostRequest.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostRequests: NSObject {
    func getPost(completionHandler: @escaping (Welcome) -> Void) {
        let urlString = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Pristine%2CKosovo?unitGroup=us&key=TJ3LH33M9Q4KXBECA7U8QZ4J8&contentType=json"
        
        AF.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response { response in
            guard let data = response.data else { return }
            do { let decoder = JSONDecoder()
                let responseResult = try decoder.decode(Welcome.self, from: data)
                
                completionHandler(responseResult)
                print(responseResult)
//                print(responseResult.days.first?.datetime)
            }
            catch let error { print(error)  }
        }
    }
}
