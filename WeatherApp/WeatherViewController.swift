//
//  ViewController.swift
//  WeatherApp
//
//  Created by Daniel Vivek Begari on 23/08/2017.
//  Copyright © 2017 CVR College of Engineering. All rights reserved.
//

import UIKit

class WeatherViewController : UIViewController {
    
    @IBOutlet var weatherView: WeatherView!
    var weatherData: WeatherData?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        weatherView.tableView.dataSource = self
        weatherView.tableView.delegate = self
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            WeatherManager.shared.weatherData(for: "Hyderabad") { (weatherData, error) in
                if let _error = error {
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.displayErrorAlert(message: _error.localizedDescription)
                    }
                    return
                }
                
                guard let _ = weatherData else{
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.displayErrorAlert(message: "No Weather Data")
                    }
                    return
                }
                self.weatherData = weatherData
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.weatherView.tableView.reloadData()
                }
            }
        }
    }
    
    
    @IBAction func refreshScreen(_ sender: Any) {
        fetchWeatherData()
    }
}


extension WeatherViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = weatherData?.days?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as! WeatherTableViewCell
        guard let _weatherData = weatherData else {
            return UITableViewCell()
        }
        cell.updateCellWithData(weatherData: _weatherData, indexPath: indexPath)
        cell.selectionStyle = .none
        //Todo Remove this to show selection, when navigating to next screen
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell =  tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
        //Todo move to next screen to show more Details
        
    }
}

extension WeatherViewController {
    func displayErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


