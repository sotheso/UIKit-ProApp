//
//  CustomTabBarViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 06/11/1403.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor(named: "TabBarTint")!
        
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        // کرو شدن فقط برای دو گوشه بالا باشه
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
        
        // خط نشانگر برای هر تب سلکت
        self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        self.additionalSafeAreaInsets.bottom = 20
    }

}
