//
//  APIManager.swift
//  MyWeather
//
//  Created by Nikita  on 8/12/23.
//

import Foundation

class WeatherManager {
    
    private let apiKey = "45b2ab5d9fad4f728a6213736231108"
    
    func getWeather(lat: Double, lon: Double) -> WeatherModel? {
        guard let data = getWeatherData(lat: lat, lon: lon) else {return nil}
        let weatherModel = decodeWeatherData(data: data)
        return weatherModel
    }
    
    func getWeather(cityName: String) -> WeatherModel? {
        guard let data = getWeatherData(cityName: cityName) else {return nil}
        let weatherModel = decodeWeatherData(data: data)
        return weatherModel
    }
    
    private func getWeatherData(lat: Double, lon: Double) -> Data? {
        let urlString = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(lat),\(lon)"
        var weatherData: Data? = nil
        do {
            guard let url = URL(string: apiKey) else {return nil}
            weatherData = try Data(contentsOf: url)
        } catch {
            print(error)
        }
        return weatherData
    }
    
    private func getWeatherData(cityName: String) -> Data? {
        let urlString = "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(cityName)"
        var weatherData: Data? = nil
        do {
            guard let url = URL(string: urlString) else {return nil}
            weatherData = try Data(contentsOf: url)
        } catch {
            print(error)
        }
        return weatherData
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
