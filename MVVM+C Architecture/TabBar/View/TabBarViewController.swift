//
//  TabBarViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//
import UIKit
class MainTabBarContainer: UITabBarController, Storyboarded {
    let layer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        layer.path = UIBezierPath(roundedRect: CGRect(x: 50, y: 5, width: self.tabBar.bounds.width - 100, height: self.tabBar.bounds.height + 10), cornerRadius: 23).cgPath
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.borderWidth = 1.0
        layer.opacity = 1
        layer.masksToBounds = false
        layer.fillColor = .init(red: 100, green: 122, blue: 111, alpha: 0.3)
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        self.tabBar.layer.insertSublayer(layer, at: 0)
        if let items = self.tabBar.items {
            items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
        }
        self.tabBar.itemWidth = 15.0
        self.tabBar.itemPositioning = .centered
    }
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        let lieTrait = UITraitCollection.init(horizontalSizeClass: .regular)
        return UITraitCollection(traitsFrom: [realTraits, lieTrait])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBar.frame = CGRect( x: 0, y: UIScreen.main.bounds.height - 100, width: self.view.frame.width, height: 75)
    }
}
