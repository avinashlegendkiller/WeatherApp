//
//  DailyData.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

struct Day {
    var dt: Int?
    var temperature: Temperature?
    var pressure: Int?
    var humidity: Int?
    var weathers: [Weather]? = []
    var speed : Int?
    var deg: Int?
    var clouds: Int?
    var rain: Int?
    
    init?(parsedData: [String: Any]) {
        if let _dt = parsedData["dt"] as? Int {
            dt = _dt
        }
        
        if let _temperature = parsedData["temp"] as? [String: Int] {
            temperature = Temperature(parsedData: _temperature)
        }
        
        if let _pressure = parsedData["pressure"] as? Int {
            pressure = _pressure
        }
        
        if let _humidity = parsedData["humidity"] as? Int {
            humidity = _humidity
        }
        
        if let _speed = parsedData["speed"] as? Int {
            speed = _speed
        }
        
        if let _deg = parsedData["deg"] as? Int {
            deg = _deg
        }
        
        if let _clouds = parsedData["clouds"] as? Int {
            clouds = _clouds
        }
        
        if parsedData.keys.contains("rain") {
            if let _rain = parsedData["rain"] as? Int {
                rain = _rain
            }
        }
        
        if let _weathers = parsedData["weather"] as? [AnyObject] {
            for _weather in _weathers {
                if let _weatherData = _weather as? [String: Any] {
                    if let weatherObject = Weather(parsedData: _weatherData) {
                        weathers?.append(weatherObject)
                    }
                }
            }
        }
        
    }
}
