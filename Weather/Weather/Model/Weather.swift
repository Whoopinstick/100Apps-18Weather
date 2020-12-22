//
//  Weather.swift
//  Weather
//
//  Created by Kevin Paul on 12/15/20.
//

import Foundation

struct Weather: Codable {
    var lat: Double = 0.0
    var lon: Double = 0.0
    var timezone: String = ""
    var current: CurrentWeather = CurrentWeather(temp: 0.0)
    
}

struct CurrentWeather: Codable {
    let temp: Double
}
