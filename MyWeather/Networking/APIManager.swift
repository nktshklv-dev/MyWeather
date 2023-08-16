//
//  APIManager.swift
//  MyWeather
//
//  Created by Nikita  on 8/12/23.
//

import Foundation

class WeatherManager {
    enum WMError: Error {
        case invalidURL
        case invalidData
    }
    private let apiKey = "45b2ab5d9fad4f728a6213736231108"
    var lastUpdatedWeather: WeatherModel!
        
     func getWeather(lat: Double, lon: Double) async throws -> WeatherModel {
        let urlString = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(lat),\(lon)"
         guard let url = URL(string: urlString) else {throw WMError.invalidURL}
         let (data, _) = try await URLSession.shared.data(from: url)
         let model = decodeWeatherData(data: data)
         self.lastUpdatedWeather = model
         return model
    }
    
     func getWeather(cityName: String) async throws -> WeatherModel {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(cityName)"
        guard let url = URL(string: urlString) else {throw WMError.invalidURL}
        let (data, _) = try await URLSession.shared.data(from: url)
        let model = decodeWeatherData(data: data)
        self.lastUpdatedWeather = model
        return model
    }
    
    private func decodeWeatherData(data: Data) -> WeatherModel {
        let decoder = JSONDecoder()
        var weatherModel: WeatherModel!
        do {
            weatherModel = try decoder.decode(WeatherModel.self, from: data)
        } catch {
            print(error)
        }
        return weatherModel
        
    }
}
