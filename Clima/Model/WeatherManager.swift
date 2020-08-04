//
//  WeatherController.swift
//  Clima
//
//  Created by Quinn Trang on 8/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate? //optional so that it's not mandatory to be initialized
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5dc08abdd11bdd6e86d9b93d0d4136a9&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather (latitude: Double, longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(Int(latitude))&lon=\(Int(longitude))"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1.Creat URL
        if let url = URL (string: urlString) {
            //URL Session
            let session = URLSession (configuration: .default)
            //task
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
            }
            //start task
            task.resume()
        }
    }
    
    func parseJSON (weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            //self changes WeatherData from an object from a Decodable Protocol type
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            let name = decodedData.name
            
            let weatherModel = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weatherModel
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}


