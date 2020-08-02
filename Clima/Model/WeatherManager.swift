//
//  WeatherController.swift
//  Clima
//
//  Created by Quinn Trang on 8/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5dc08abdd11bdd6e86d9b93d0d4136a9&units=metric"
    
    func fetchWeather (cityName: String) {
        //let urlString = weatherURL + "&q=" + cityName
        let urlString = "\(weatherURL)&q=\(cityName)"
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
                    self.parseJSON(weatherData: safeData)
                }
                
                if error != nil {
                    print(error!)
                    return
                }
            }
            //start task
            task.resume()
        }
    }
    
    func parseJSON (weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            //self changes WeatherData from an object from a Decodable Protocol type
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
}
