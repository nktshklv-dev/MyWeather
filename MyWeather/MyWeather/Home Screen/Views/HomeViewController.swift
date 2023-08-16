//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita  on 8/10/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewControllerViewModel!
    
    var segmentedControl: UISegmentedControl!
    var mainViewStack: UIStackView!
    var temperatureView: LargeTemperatureView!
    var clothesView: UIView!
    var hourlyWeatherView: UIView!
    var dailyContainerView: UIView!
    var dailyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupViewModel()
    }
    
    func setupViewModel() {
        self.viewModel = HomeViewControllerViewModel()
        viewModel.viewController = self
        viewModel.updateUI()
    }
}

