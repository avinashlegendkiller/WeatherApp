//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 27/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

extension Date {
    
    static func getLocalDate(fromUnixTimestamp: Int) -> Date? {
        let date = Date(timeIntervalSince1970: TimeInterval(fromUnixTimestamp))
        var description = date.description
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone =  TimeZone.ReferenceType.local
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss Z"
        
        let localDate = dateFormatter.date(from: description)
        if let _localDate = localDate  {
            description = _localDate.description(with: Locale.current)
            return _localDate
        }
        return nil
    }
    
    static func getDayNumberInWeek(for date: Date) -> Int {
        let calender = Calendar.current
        return calender.component(.weekday, from: date)
    }
    
    static func getDayInMonth(for date: Date) -> Int {
        let calender = Calendar.current
        return calender.component(.day, from: date)
    }
    
}
