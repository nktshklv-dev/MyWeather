//
//  LargeTemperatureView.swift
//  MyWeather
//
//  Created by Nikita  on 8/13/23.
//

import UIKit

class LargeTemperatureView: UIView {
    
   private var backgroundConditionView: UIView!
   private var cityLabel: UILabel!
   private var temperatureLabel: UILabel!
   private var conditionIcon: UIImageView!
   private var conditionLabel: UILabel!
   private var highestTemperatureIcon: UIImageView!
   private var highestTemperatureLabel: UILabel!
   private var lowestTemperatureIcon: UIImageView!
   private var lowestTemperatureLabel: UILabel!
   private var separateLineView: UIImageView!
   private var humidityIcon: UIImageView!
   private var humidityLabel: UILabel!
   private var windSpeedIcon: UIImageView!
   private var windSpeedLabel: UILabel!
   private var precipationIcon: UIImageView!
   private var precipationLabel: UILabel!
   private var detailsButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundConditionView = UIView()
        backgroundConditionView.layer.cornerRadius = 24
        backgroundConditionView.backgroundColor = .systemBlue
        self.addSubview(backgroundConditionView)
        
        cityLabel = UILabel()
        cityLabel.text = "Moscow"
        cityLabel.textColor = .white
        cityLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        cityLabel.layer.borderColor = UIColor(ciColor: .white).cgColor
        cityLabel.textAlignment = .center
        cityLabel.layer.borderWidth = 2
        cityLabel.layer.cornerRadius = 15
        cityLabel.numberOfLines = 0
        self.addSubview(cityLabel)
        
        conditionIcon = UIImageView()
        conditionIcon.tintColor = .white
        conditionIcon.image = UIImage(systemName: "moon.fill")
        self.addSubview(conditionIcon)
        
        conditionLabel = UILabel()
        conditionLabel.text = "Clear"
        conditionLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        self.addSubview(conditionLabel)
        
        temperatureLabel = UILabel()
        temperatureLabel.text = "20°C"
        temperatureLabel.font = UIFont.systemFont(ofSize: 80, weight: .light)
        temperatureLabel.textColor = .white
        self.addSubview(temperatureLabel)
        
        highestTemperatureIcon = UIImageView()
        highestTemperatureIcon.image = UIImage(systemName: "arrow.up")
        highestTemperatureIcon.tintColor = .white
        self.addSubview(highestTemperatureIcon)
        
        highestTemperatureLabel = UILabel()
        highestTemperatureLabel.text = "24°"
        highestTemperatureLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.addSubview(highestTemperatureLabel)
        
        lowestTemperatureIcon = UIImageView()
        lowestTemperatureIcon.image = UIImage(systemName: "arrow.down")
        lowestTemperatureIcon.tintColor = .white
        self.addSubview(lowestTemperatureIcon)
        
        lowestTemperatureLabel = UILabel()
        lowestTemperatureLabel.text = "12°"
        lowestTemperatureLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.addSubview(lowestTemperatureLabel)
        
        separateLineView = UIImageView()
        separateLineView.image = R.image.line()
        self.addSubview(separateLineView)
        
        humidityIcon = UIImageView()
        humidityIcon.image = UIImage(systemName: "drop.fill")
        humidityIcon.tintColor = R.color.labelGray()
        self.addSubview(humidityIcon)
        
        humidityLabel = UILabel()
        humidityLabel.text = "30%"
        humidityLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
        humidityLabel.textColor = R.color.labelGray()
        self.addSubview(humidityLabel)
        
        windSpeedIcon = UIImageView()
        windSpeedIcon.image = UIImage(systemName: "wind")
        windSpeedIcon.tintColor = R.color.labelGray()
        self.addSubview(windSpeedIcon)
        
        windSpeedLabel = UILabel()
        windSpeedLabel.text = "4 m/s"
        windSpeedLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        windSpeedLabel.textColor = R.color.labelGray()
        self.addSubview(windSpeedLabel)
        
        precipationIcon = UIImageView()
        precipationIcon.image = UIImage(systemName: "water.waves")
        precipationIcon.tintColor = R.color.labelGray()
        self.addSubview(precipationIcon)
        
        precipationLabel = UILabel()
        precipationLabel.text = "0 mm"
        precipationLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        precipationLabel.textColor = R.color.labelGray()
        self.addSubview(precipationLabel)
    }
    private func setupConstraints() {
        self.backgroundConditionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints { make in
            make.width.equalTo(81)
            make.height.equalTo(30)
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        conditionIcon.snp.makeConstraints { make in
            make.width.height.equalTo(21)
            make.centerY.equalTo(cityLabel)
            make.right.equalToSuperview().inset(65)
        }
        
        conditionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(conditionIcon)
            make.left.equalTo(conditionIcon.snp.right).offset(4)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(20)
            make.left.equalTo(cityLabel)
        }
        
        highestTemperatureLabel.snp.makeConstraints { make in
            make.right.equalTo(conditionLabel)
            make.top.equalTo(temperatureLabel)
        }
        
        highestTemperatureIcon.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(19)
            make.top.equalTo(highestTemperatureLabel)
            make.right.equalTo(highestTemperatureLabel.snp.left).offset(-4)
        }
        
        lowestTemperatureLabel.snp.makeConstraints { make in
            make.right.equalTo(highestTemperatureLabel)
            make.bottom.equalTo(temperatureLabel)
        }
        
        lowestTemperatureIcon.snp.makeConstraints { make in
            make.width.equalTo(highestTemperatureIcon)
            make.height.equalTo(highestTemperatureIcon)
            make.top.equalTo(lowestTemperatureLabel)
            make.right.equalTo(lowestTemperatureLabel.snp.left).offset(-4)
        }
        
        separateLineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(temperatureLabel.snp.bottom).offset(16)
        }
        
        humidityIcon.snp.makeConstraints { make in
            make.top.equalTo(separateLineView.snp.bottom).offset(10)
            make.left.equalTo(cityLabel)
        }
        
        humidityLabel.snp.makeConstraints { make in
            make.top.equalTo(humidityIcon)
            make.left.equalTo(humidityIcon.snp.right).offset(4)
        }
        
        windSpeedIcon.snp.makeConstraints { make in
            make.left.equalTo(humidityIcon)
            make.top.equalTo(humidityIcon.snp.bottom).offset(12)
        }
        
        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(windSpeedIcon)
            make.left.equalTo(windSpeedIcon.snp.right).offset(2)
        }
        
        precipationLabel.snp.makeConstraints { make in
            make.right.equalTo(conditionLabel)
            make.top.equalTo(humidityIcon)
        }
        
        precipationIcon.snp.makeConstraints { make in
            make.top.equalTo(humidityIcon)
            make.right.equalTo(precipationLabel.snp.left).offset(-4)
        }
    }
}

