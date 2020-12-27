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
    var current: CurrentWeather = CurrentWeather()
    var daily: [Daily] = []
    
    
    struct CurrentWeather: Codable {
        var temp: Double = 0.0
    }
    
    struct Daily: Codable, Identifiable {
        var id = UUID()
        var dew_point: Double = 0.0
        var temp: DailyTemp = DailyTemp()
        var weather: [DailyWeather] = []
        
        var weatherID: String {
            let weatherCode = weather[0].id
            switch weatherCode {
            case 200...299:
                return "thunderstorms"
            case 300...399:
                return "drizzle"
            case 500...599:
                return "rain"
            case 600...699:
                return "snow"
            case 700...799:
                return "atmosphere?"
            case 800:
                return "clear"
            case 801...809:
                return "clouds"
            default:
                return "unknown"
            }
        }
        
        struct DailyTemp: Codable {
            var day: Double = 0.0
            var min: Double = 0.0
            var max: Double = 0.0
        }
        
        struct DailyWeather: Codable {
            var id: Int = 0
        }
        
        enum CodingKeys: CodingKey {
            case dew_point
            case temp
            case weather
        }
    }
}





