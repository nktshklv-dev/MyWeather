//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita  on 8/10/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var segmentedControl: UISegmentedControl!
    var mainViewStack: UIStackView!
    var temperatureView: UIView!
    var clothesView: UIView!
    var hourlyWeatherView: UIView!
    var dailyContainerView: UIView!
    var dailyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews() {
        setupSegmentedControl()
        
        mainViewStack = UIStackView()
        mainViewStack.axis = .vertical
        self.view.addSubview(mainViewStack)
        
        temperatureView = LargeTemperatureView()
        self.view.addSubview(temperatureView)
    }
    
    func setupSegmentedControl() {
        self.view.backgroundColor = .black
        
        segmentedControl = UISegmentedControl(items: ["HOME", "5 DAYS AHEAD"])
        segmentedControl.selectedSegmentIndex = 0
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentedControl.selectedSegmentTintColor = .gray
        segmentedControl.addTarget(self, action: #selector(didSwitchControl), for: .valueChanged)
        self.view.addSubview(segmentedControl)
    }
    
    @objc func didSwitchControl(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    func setupConstraints() {
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(46)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        temperatureView.snp.makeConstraints { make in
            let width = self.view.frame.width * 0.9
            make.width.equalTo(width)
            make.height.equalTo(width / 1.377)
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
        }
    }

}
