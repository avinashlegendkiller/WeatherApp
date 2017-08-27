//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

class WeatherManager {
    static let shared = WeatherManager()
    
    func weatherData(for location: String, completion: @escaping (WeatherData?, Error?) -> () ) {
        let urlString : String = "http://api.openweathermap.org/data/2.5/forecast/daily?q=\(location),IN&cnt=6&units=metric&appid=14f61333d12ccb335323ca5213b194e7"
        
        APIClient.performGETAction(URN: urlString, parameters: nil) { (data, error) in
            do {
                if let _error = error {
                    completion(nil, _error)
                    return
                }

                guard let _data = data else {
                    completion(nil,nil)
                    return
                }
                
                guard let weatherData = WeatherData(data: _data) else {
                    completion(nil, nil)
                    return
                }
                completion(weatherData, nil)
            }
        }
    }
    
}
