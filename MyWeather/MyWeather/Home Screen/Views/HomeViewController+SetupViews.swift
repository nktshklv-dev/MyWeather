//
//  HomeViewController+SetupViews.swift
//  MyWeather
//
//  Created by Nikita  on 8/14/23.
//

import Foundation
import UIKit

extension HomeViewController {
    
    func setupViews() {
        setupSegmentedControl()
        
        mainViewStack = UIStackView()
        mainViewStack.axis = .vertical
        self.view.addSubview(mainViewStack)
        
        temperatureView = LargeTemperatureView()
        self.view.addSubview(temperatureView)
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
}
