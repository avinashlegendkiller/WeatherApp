//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 24/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

extension String {
    var temperatureDegree: String {
        get {
            let input = self + "\u{00B0}"
            return input
        }
    }
}
