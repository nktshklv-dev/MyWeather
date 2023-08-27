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
        
        currentTimeLabel = UILabel()
        currentTimeLabel.text = "22:00"
        currentTimeLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        currentTimeLabel.textColor = R.color.labelGray()
        self.contentView.addSubview(currentTimeLabel)
        
        currentConditionIcon = UIImageView()
        currentConditionIcon.image = UIImage(systemName: "moon.fill")
        currentConditionIcon.tintColor = R.color.labelGray()
        self.contentView.addSubview(currentConditionIcon)
        
        currentTemperatureLabel = UILabel()
        currentTemperatureLabel.text = "20°C"
        currentTemperatureLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        currentTemperatureLabel.textColor = R.color.labelGray()
        self.contentView.addSubview(currentTemperatureLabel)
    }
    
    private func setupConstraints() {
        currentTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        
        currentConditionIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(30)
            make.top.equalTo(currentTimeLabel.snp.bottom).offset(8)
        }
        
        currentTemperatureLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-16)
            make.centerX.equalToSuperview()
        }
    }
    
    
}
