//
//  UITabbarController.swift
//  NewsToDay
//
//  Created by Владислав on 08.05.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .purplePrimary
        tabBar.unselectedItemTintColor = .greyLight
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.greyLight.cgColor
    }
    
    private func setupItems() {
        
        let homepage = HomepageViewController()
        let bookmarks = BookmarksViewController()
        let category = CategoryViewController()
        let profile = ProfileViewController()
        
        

        setViewControllers([homepage, category, bookmarks, profile], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(named: "tabBar_home")
        items[1].image = UIImage(named: "tabBar_category")
        items[2].image = UIImage(named: "tabBar_bookmarks")
        items[3].image = UIImage(named: "tabBar_profile")
    
    }
}
