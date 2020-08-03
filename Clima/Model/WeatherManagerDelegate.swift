//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Quinn Trang on 8/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
}
