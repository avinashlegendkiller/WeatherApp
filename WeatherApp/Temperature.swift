//
//  Temperature.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

struct Temperature {
    var day: Int?
    var min: Int?
    var max: Int?
    var night: Int?
    var eve: Int?
    var morn: Int?
    
    init?(parsedData: [String: Any]) {
        if let _day = parsedData["day"] as? Int {
            day = _day
        }
        
        if let _min = parsedData["min"] as? Int {
            min = _min
        }
        if let _max = parsedData["max"] as? Int {
            max = _max
        }
        if let _night = parsedData["night"] as? Int {
            night = _night
        }
        if let _eve = parsedData["eve"] as? Int {
            eve = _eve
        }
        if let _morn = parsedData["morn"] as? Int {
            morn = _morn
        }
    }
}
