//
//  WeatherModel.swift
//  Clima
//
//  Created by Quinn Trang on 8/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232: //Thunderstorm
            return "cloud.bolt"
        case 300...321: //Drizzle
            return "cloud.drizzle"
        case 500...531: //Rain
            return "cloud.rain"
        case 600...622: //Snow
            return "cloud.snow"
        case 700...781: //Atmosphere
            return "cloud.fog"
        case 800://Clear
            return "sun.max"
        case 801...804: //Clouds
            return "cloud"
        default:
            return "cloud"
        }
    }
}
