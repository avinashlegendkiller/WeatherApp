//
//  APIClient.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import Foundation

class APIClient {
    
    static func performGETAction(URN: String, parameters: [String: Any]?, completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = URL(string: URN) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {(data:Data?,request: URLResponse?,error: Error?) in
            completion(data, error)
        }
        task.resume()
    }
    
    
    
}
