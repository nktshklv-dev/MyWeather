//
//  HomeViewControllerViewModel.swift
//  MyWeather
//
//  Created by Nikita  on 8/14/23.
//

import Foundation
import UIKit

class HomeViewControllerViewModel {
    
    weak var viewController: HomeViewController!
    var manager = WeatherManager()
    let cityName = "Berlin"

    func updateUI() {
        updateCityLabel()
        updateTemperatureView()
        updateWindSpeedLabel()
        updateHumidityLabel()
        updatePrecipationLabel()
    }
    
    private func updateCityLabel() {
        Task {
            do {
                let weather = try await manager.getWeather(cityName: cityName)
                await viewController.temperatureView.setCityName(to: weather.location.name)
            } catch {
                print(error)
            }
        }
    }
    
// MARK: LargeTemperatureView UI
    private func updateTemperatureView() {
        Task {
            do {
                let weather = try await manager.getWeather(cityName: cityName)
                await viewController.temperatureView.setTemperature(current: weather.current.temp_c, max: (weather.forecast.forecastday.first?.day.maxtemp_c)!, min: (weather.forecast.forecastday.first?.day.mintemp_c)!)
            } catch {
                print(error)
            }
        }
    }
    private func updateWindSpeedLabel() {
        Task {
            do {
                let weather = try await manager.getWeather(cityName: cityName)
                await viewController.temperatureView.setWindSpeed(to: weather.current.wind_kph)
            } catch {
                print(error)
            }
        }
    }
    private func updateHumidityLabel() {
        Task {
            do {
                let weather = try await manager.getWeather(cityName: cityName)
                await viewController.temperatureView.setHumidity(to: weather.current.humidity)
            } catch {
                print(error)
            }
        }
    }
    private func updatePrecipationLabel() {
        Task {
            do {
                let weather = try await manager.getWeather(cityName: cityName)
                await viewController.temperatureView.setPrecipation(to: weather.current.precip_mm)
            } catch {
                print(error)
            }
        }
    }
    
}
