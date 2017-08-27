//
//  Weather.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

struct Weather {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init?(parsedData: [String: Any]) {
        if let _id = parsedData["id"] as? Int {
            id = _id
        }
        
        if let _main = parsedData["main"] as? String {
            main = _main
        }
        
        if let _description = parsedData["description"] as? String {
            description = _description
        }
        
        if let _icon = parsedData["icon"] as? String {
            icon = _icon
        }
    }
}
