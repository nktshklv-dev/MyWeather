//
//  WeatherModel.swift
//  MyWeather
//
//  Created by Nikita  on 8/12/23.
//

import Foundation

struct WeatherModel: Codable {
    var location: Location
    var current: Current
    var forecast: Forecast
}

struct Location: Codable {
    var name: String
    var region: String
    var country: String
    var lat: Double
    var lon: Double
    var localtime: String
}

struct Current: Codable {
    var temp_c: Double
    var temp_f: Double
    var condition: Condition
    var wind_mph: Double
    var wind_kph: Double
    var wind_degree: Int
    var wind_dir: String
    var pressure_mb: Int
    var pressure_in: Double
    var precip_mm: Double
    var precip_in: Double
    var humidity: Int
    var cloud: Int
    var feelslike_c: Double
    var feelslike_f: Double
    var vis_km: Int
    var vis_miles: Int
    var uv: Int
    var gust_mph: Double
    var gust_kph: Double
}

struct Condition: Codable {
    var text: String
}

struct Forecast: Codable {
    var forecastday: [Forecastday]
}

struct Forecastday: Codable {
    var day: Day
}

struct Day: Codable {
    var maxtemp_c: Double
    var mintemp_c: Double
}

