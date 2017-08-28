//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var temparature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var dayInWords: UILabel!
    @IBOutlet weak var humidity: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCellWithData(weatherData: WeatherData, indexPath: IndexPath) {
        city.text = weatherData.city?.name
        
        if let _temparature = weatherData.days?[indexPath.row].temperature?.max {
            self.temparature.text = String(describing: _temparature).temperatureDegree
        }
        
        if let _humidity = weatherData.days?[indexPath.row].humidity {
            let humidityValue = String(describing: _humidity) + "%"
            self.humidity.setTitle(humidityValue, for: .normal)
        }
        if let _weatherId = weatherData.days?[indexPath.row].weathers?.first?.id {
            let (weatherType, image) = WeatherCodes.getCodeForID(id: _weatherId)
            self.weatherType.text = weatherType.rawValue
            self.weatherImage.image = image
        }
        
        if let _weatherType = weatherData.days?[indexPath.row].weathers?.first?.description {
            self.weatherType.text = _weatherType.capitalized
        }
        
        if let _dateTimeStamp = weatherData.days?[indexPath.row].dt {
            let date = Date.getLocalDate(fromUnixTimestamp: _dateTimeStamp)
            guard let _date = date else {
                return
            }
            let dayNumber = Date.getDayNumberInWeek(for: _date)
            let daysInWords = daysInWeek.getDay(from: dayNumber)
            dayInWords.text = daysInWords
            day.text = String(describing: Date.getDayInMonth(for: _date))
        }

    }
}
