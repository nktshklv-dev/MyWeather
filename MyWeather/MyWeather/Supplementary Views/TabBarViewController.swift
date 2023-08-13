//
//  TabBarViewController.swift
//  
//
//  Created by Nikita  on 8/12/23.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .black
        self.tabBar.unselectedItemTintColor = .systemGray2
        self.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let firstTab = HomeViewController()
        let tabOneItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        firstTab.tabBarItem = tabOneItem
        
        let secondTab = SavedCitiesViewController()
        let secondTabItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        secondTab.tabBarItem = secondTabItem
        
        let settingsTab = SettingsViewController()
        let settingsTabItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 2)
        settingsTab.tabBarItem = settingsTabItem
        
        self.viewControllers = [firstTab, secondTab, settingsTab]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(viewController)
    }
    

   
}
