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
            let task = session.dataTask(with: url, completionHandler: handle (data: response: error:))
            //start task
            task.resume()
        }
    }
    
    func handle (data: Data?, response: URLResponse?, error: Error?) {
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
        if error != nil {
            print(error!)
            return
        }
    }
}
