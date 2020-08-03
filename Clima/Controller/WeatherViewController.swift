//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        weatherManager.delegate = self
    }
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchButtonPressed(_ sender: UIButton) {
         //print(searchTextField.text!)
     }
     
     //text of textField will also be set if the user hits return
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         //print(searchTextField.text!)
         //confirm that user is done editing -> dismiss keyboard
         searchTextField.endEditing(true)
         return true
     }
     
     func textFieldDidEndEditing(_ textField: UITextField) {
         //clear text field once search is entered
         //weatherManager.fetchWeather(cityName: searchTextField.text!)
         if let city = searchTextField.text {
             weatherManager.fetchWeather(cityName: city)
         }
         searchTextField.text = ""
     }
     
     //check if user actually types in something
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         if textField.text != "" {
             return true
         } else {
             searchTextField.placeholder = "Type something"
             return false
         }
     }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        //print(weather.temperature)
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
