//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import UIKit

protocol WeatherViewDelegate: class {
    func fetchButtonWeatherButtonTapped(for: String)
}

class WeatherView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: WeatherViewDelegate?
    

}
