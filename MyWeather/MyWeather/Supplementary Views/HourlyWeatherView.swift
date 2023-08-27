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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyTemperatureCollectionViewCell.reuseIdentifier, for: indexPath)
        return cell
    }
}

extension HourlyWeatherView: UICollectionViewDelegate {
    
}
