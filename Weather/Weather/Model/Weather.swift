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
    var daily: [Daily] = []
}

struct CurrentWeather: Codable {
    let temp: Double
}

struct Daily: Codable, Identifiable {
    var id = UUID()
    var dew_point: Double = 0.0
    
    enum CodingKeys: CodingKey {
        case dew_point
    }
}

struct DailyTemp: Codable {
    var day: Double = 0.0
    var min: Double = 0.0
    var max: Double = 0.0
}

struct DailyWeather: Codable {
    
}
