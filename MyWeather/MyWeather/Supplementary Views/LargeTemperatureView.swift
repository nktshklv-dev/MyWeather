//
//  LargeTemperatureView.swift
//  MyWeather
//
//  Created by Nikita  on 8/13/23.
//

import UIKit

class LargeTemperatureView: UIView {
//TODO: gradient animation for updating weather info in views (skeleton view)
//TODO: update according to conditions / time
   private var backgroundConditionView: UIView!
//TODO: think smth about changing the size of label with the city name length 
   private var cityLabel: UILabel!
   private var temperatureLabel: UILabel!
//TODO: conditionIcon and conditionLabel update with weather calls
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
//TODO: set up details button (think smth about fullscreen detailView)
   private var detailsButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Views Setup
    private func setupViews() {
        
        backgroundConditionView = UIView()
        backgroundConditionView.layer.cornerRadius = 24
        backgroundConditionView.backgroundColor = .systemBlue
        self.addSubview(backgroundConditionView)
        
        cityLabel = UILabel()
        cityLabel.text = "---"
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
        conditionLabel.text = "---"
        conditionLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        self.addSubview(conditionLabel)
        
        temperatureLabel = UILabel()
        temperatureLabel.text = "-°C"
        temperatureLabel.font = UIFont.systemFont(ofSize: 80, weight: .light)
        temperatureLabel.textColor = .white
        self.addSubview(temperatureLabel)
        
        highestTemperatureIcon = UIImageView()
        highestTemperatureIcon.image = UIImage(systemName: "arrow.up")
        highestTemperatureIcon.tintColor = .white
        self.addSubview(highestTemperatureIcon)
        
        highestTemperatureLabel = UILabel()
        highestTemperatureLabel.text = "---"
        highestTemperatureLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.addSubview(highestTemperatureLabel)
        
        lowestTemperatureIcon = UIImageView()
        lowestTemperatureIcon.image = UIImage(systemName: "arrow.down")
        lowestTemperatureIcon.tintColor = .white
        self.addSubview(lowestTemperatureIcon)
        
        lowestTemperatureLabel = UILabel()
        lowestTemperatureLabel.text = "---"
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
        humidityLabel.text = "---"
        humidityLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
        humidityLabel.textColor = R.color.labelGray()
        self.addSubview(humidityLabel)
        
        windSpeedIcon = UIImageView()
        windSpeedIcon.image = UIImage(systemName: "wind")
        windSpeedIcon.tintColor = R.color.labelGray()
        self.addSubview(windSpeedIcon)
        
        windSpeedLabel = UILabel()
        windSpeedLabel.text = "--- m/s"
        windSpeedLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        windSpeedLabel.textColor = R.color.labelGray()
        self.addSubview(windSpeedLabel)
        
        precipationIcon = UIImageView()
        precipationIcon.image = UIImage(systemName: "water.waves")
        precipationIcon.tintColor = R.color.labelGray()
        self.addSubview(precipationIcon)
        
        precipationLabel = UILabel()
        precipationLabel.text = "--- mm"
        precipationLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        precipationLabel.textColor = R.color.labelGray()
        self.addSubview(precipationLabel)
    }
//MARK: Setup Constraints
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
    
//MARK: UI updating functions
    
    func setTemperature(current: Double, max: Double, min: Double) {
        self.temperatureLabel.text = Int(current).description + "°C"
        self.highestTemperatureLabel.text = Int(max).description + "°"
        self.lowestTemperatureLabel.text = Int(min).description + "°"
    }
    
    func setCityName(to name: String) {
        self.cityLabel.text = name
    }
    
    func setWindSpeed(to speed: Double) {
        self.windSpeedLabel.text = round(((speed / 3.6) * 10.0) / 10.0).description + " m/s"
    }
    
    func setHumidity(to humidity: Int) {
        self.humidityLabel.text = humidity.description + " %"
    }
    func setPrecipation(to precipation: Double) {
        self.precipationLabel.text = precipation.description + " mm"
    }
}

