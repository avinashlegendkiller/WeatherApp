//
//  DaysInWeek.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 27/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

enum daysInWeek: String {
    case sunday = "SUN"
    case monday = "MON"
    case tuesday = "TUE"
    case wednesday = "WED"
    case thursday = "THU"
    case friday = "FRI"
    case saturday = "SAT"
    
    static func getDay(from date: Int) -> String {
        switch date {
        case 1:
            return daysInWeek.sunday.rawValue
        case 2:
            return daysInWeek.monday.rawValue
        case 3:
            return daysInWeek.tuesday.rawValue
        case 4:
            return daysInWeek.wednesday.rawValue
        case 5:
            return daysInWeek.thursday.rawValue
        case 6:
            return daysInWeek.friday.rawValue
        case 7:
            return daysInWeek.saturday.rawValue
        default:
            return "N/A"
            
        }
    }
    
}
