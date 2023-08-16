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
    func updateWeatherData() {
        Task {
            do {
                let weather = try await manager.getWeather(cityName: "Moscow")
                print(weather)
                print(manager.lastUpdatedWeather)
            } catch {
                print(error)
            }
          
        }
    }
}
