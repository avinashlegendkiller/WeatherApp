//
//  City.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation
import MapKit

struct City {
    var  id: Int?
    var name: String?
    var country: String?
    var coordinates: CLLocationCoordinate2D?
    var sunrise: String?
    var sunset: String?
    
    init?(parsedData : [String : Any]) {
            if let _id = parsedData["id"] as? Int {
                self.id = _id
            }
            
            if let _name = parsedData["name"] as? String {
                name = _name
            }
            if let _country = parsedData["country"] as? String {
                country = _country
            }
            
            if let _coordinates = parsedData["coord"] as? [String: Any] {
                guard let latitude = _coordinates["lat"] as? Float else {
                    return
                }
                guard let longitude = _coordinates["lon"] as? Float else {
                    return
                }
                coordinates = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
            }
    }
    
    init(id: Int, name: String, country: String, coordinates: [String: Any]) {
        self.id = id
        self.name = name
        self.country = country
        self.coordinates = CLLocationCoordinate2D(latitude: coordinates["lat"] as! CLLocationDegrees, longitude: coordinates["lon"] as! CLLocationDegrees)
    }
}
