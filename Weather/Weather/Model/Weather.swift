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
    
    //API returns "America/CityName" like America/Detroit
    //TODO: find a proper way to remove country code
    var americanCity: String {
        var city = ""
        var count = 0
        for char in timezone {
            if count >= 8 {
                city.append(char)
            }
            count += 1
        }
        
        return city
    }
    
    //skip first day returned.  The API returns the current day as the first element in the array.
    var dailyForecast: [Daily] {
        var tempArray: [Daily] = []
        var count = 0
        for day in daily {
            if count > 0 {
                tempArray.append(day)
            }
            count += 1
        }
        
        return tempArray
    }
    
    
    struct CurrentWeather: Codable {
        var temp: Double = 0.0
    }
    
    struct Daily: Codable, Identifiable {
        var id = UUID()
        var dt: Double = 0.0
        var temp: DailyTemp = DailyTemp()
        var weather: [DailyWeather] = []
        
        var weatherID: String {
            let weatherCode = weather[0].id
            switch weatherCode {
            case 200...299:
                return "cloud.bolt.fill"
            case 300...399:
                return "cloud.drizzle.fill"
            case 500...599:
                return "cloud.heavyrain.fill"
            case 600...699:
                return "snow"
            case 700...799:
                return "sun.haze.fill"
            case 800:
                return "sun.max.fill"
            case 801...809:
                return "cloud.fill"
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
            case dt
            case temp
            case weather
        }
    }
}





