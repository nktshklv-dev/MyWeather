//
//  HomeViewController+Actions.swift
//  MyWeather
//
//  Created by Nikita  on 8/14/23.
//

import Foundation
import UIKit

extension HomeViewController {
    
    @objc func didSwitchControl(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
}
