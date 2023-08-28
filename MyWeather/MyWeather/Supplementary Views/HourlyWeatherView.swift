//
//  HourlyWeatherView.swift
//  MyWeather
//
//  Created by Nikita  on 8/24/23.
//

import UIKit

class HourlyWeatherView: UIView {
    
    private var backgorundView: UIView!
    private var titleLabel: UILabel!
    private var collectionView: UICollectionView!
    private var hourlyWeatherData = [Hour]()
    private var currentHourlyWeatherData = [Hour]()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHourlyData(data: [Hour]?) {
        guard let data = data else {return}
        self.hourlyWeatherData = data
        guard let time = self.hourlyWeatherData.first?.time else {return}
        let x = time.dropFirst(11)
        print(x)
    }
    
    func updateCollectionView() {
        self.collectionView.reloadData()
    }
    
    private func setupViews() {
        backgorundView = UIView()
        backgorundView.backgroundColor = R.color.dark()
        backgorundView.layer.cornerRadius = 16
        self.addSubview(backgorundView)
        
        titleLabel = UILabel()
        titleLabel.text = "Hourly weather"
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        titleLabel.textColor = .white
        self.addSubview(titleLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 64, height: 116)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.register(HourlyTemperatureCollectionViewCell.self, forCellWithReuseIdentifier: HourlyTemperatureCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = R.color.dark()
        collectionView.layer.cornerRadius = 8
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        backgorundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
        }
        
        collectionView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalTo(116)
            make.top.equalToSuperview().offset(62)
            make.centerX.equalToSuperview()
        }
    }
}
extension HourlyWeatherView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for data in hourlyWeatherData{
            guard let hour = Int(data.time.dropFirst(11).dropLast(3)) else {return 0}
            print(hour)
            if checkDate(hour: hour) {
                currentHourlyWeatherData.append(data)
            }
        }
        return currentHourlyWeatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyTemperatureCollectionViewCell.reuseIdentifier, for: indexPath) as? HourlyTemperatureCollectionViewCell else {return UICollectionViewCell()}
        cell.setData(data: currentHourlyWeatherData[indexPath.row])
        return cell
    }
    
    func checkDate(hour: Int) -> Bool{
        let date = Date()
        let calendar = Calendar.current
        let time = calendar.component(.hour, from: date)
        
        if time <= hour {
            return true
        } else {
            return false
        }
    }
}

extension HourlyWeatherView: UICollectionViewDelegate {
    
}
