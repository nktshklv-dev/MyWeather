//
//  HourlyTemperatureCollectionViewCell.swift
//  MyWeather
//
//  Created by Nikita  on 8/28/23.
//

import UIKit

class HourlyTemperatureCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "HourlyTemperatureCollectionViewCell"
    private var currentTimeLabel: UILabel!
    private var currentConditionIcon: UIImageView!
    private var currentTemperatureLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = R.color.gray()
        self.layer.cornerRadius = 8 
    }
    
    private func setupConstraints() {
        
    }
    
    
}
