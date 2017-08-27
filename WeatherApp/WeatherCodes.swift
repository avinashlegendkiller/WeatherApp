//
//  WeatherCodes.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 24/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation
import UIKit

enum WeatherCodes: String {
    case thunderStroms = "ThunderStroms"
    case rainy = "Rainy"
    case cloudy = "Cloudy"
    case sunny = "Sunny"
    case drizzle = "Drizzle"
    case snow = "Snow"
    
    static func getCodeForID(id: Int) -> (weather: WeatherCodes, image: UIImage?) {
        switch id {
        case (200...232) :
            let image = UIImage(named: "ThunderStroms")
             return (WeatherCodes.thunderStroms, image)
        case 300...321 :
            let image = UIImage(named: "Drizzle")
            return (WeatherCodes.drizzle, image)
        case 500...531 :
            let image = UIImage(named: "Rainy")
            return (WeatherCodes.rainy, image)
        case 600...622 :
            let image = UIImage(named: "PartlyCloudy")
            return (WeatherCodes.snow, image)
        case 800...804 :
            let image = UIImage(named: "Cloudy")
            return (WeatherCodes.cloudy, image)
        default:
            let image = UIImage(named: "Sunny")
            return (WeatherCodes.sunny,image)
        }
    }
    
}
