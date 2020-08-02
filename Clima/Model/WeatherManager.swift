//
//  WeatherController.swift
//  Clima
//
//  Created by Quinn Trang on 8/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=5dc08abdd11bdd6e86d9b93d0d4136a9&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = weatherURL + "&q=" + cityName
        print(urlString)
        
    }
}
