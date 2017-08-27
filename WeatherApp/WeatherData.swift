//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

struct WeatherData {
    var city: City?
    var cod: String?
    var message: String?
    var cnt: Int?
    var days: [Day]? = []
    
     init?(data : Data) {
        do {
            let parsedData = try JSONSerialization.jsonObject(with: data) as! [String:Any]
            
            if let count = parsedData["cnt" ] as? Int {
                cnt = count
            }
            
            if let _cod = parsedData["cod"] as? String {
                cod = _cod
            }
            
            if let _message = parsedData["message"] as? String {
                message = _message
            }
            
            if let _cityData = parsedData["city"] as? [String: Any] {
                if let _city = City(parsedData: _cityData) {
                    self.city = _city
                }
            }
            
            if let weatherList = parsedData["list"] as? [AnyObject] {
                
                for weather in weatherList {
                    if let _weather = weather as? [String: Any]{
                        if let _day = Day(parsedData: _weather) {
                            self.days?.append(_day)
                        }
                    }
                }
            }
        } catch {
            
        }
    }
}
