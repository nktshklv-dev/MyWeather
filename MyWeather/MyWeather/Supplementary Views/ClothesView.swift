//
//  ClothesView.swift
//  MyWeather
//
//  Created by Nikita  on 8/22/23.
//

import UIKit

class ClothesView: UIView {
 
    private var currentWeather: WeatherModel!
    private var hatView: UIImageView!
    private var accesoryView: UIImageView!
    private var outerwearView: UIImageView!
    private var pantsView: UIImageView!
    private var shoesView: UIImageView!
    private var backgroundView: UIView!
    private var titleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backgroundView = UIView()
        backgroundView.backgroundColor = R.color.dark()
        backgroundView.layer.cornerRadius = 16
        self.addSubview(backgroundView)
        
        titleLabel = UILabel()
        titleLabel.text = "Clothes accodring to the weather"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        self.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
        }
    }
   

}
