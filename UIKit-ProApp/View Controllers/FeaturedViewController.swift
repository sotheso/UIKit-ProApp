//
//  FeaturedViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 29/10/1403.
//

import UIKit

// کنترل نماهای برحسته
class FeaturedViewController:
                            
    UIViewController {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBOutlet var handbooksCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        handbooksCollectionView.layer.masksToBounds = false
    }

}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //  تعداد سلول ها
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // محتوای هر سلول
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionView
        
        let handbook = handbooks[indexPath.item]
        
        
        cell.titleLabel.text = handbook.courseTitle
        cell.subtitleLabel.text = handbook.courseSubtitle
        cell.discriptionLabel.text = handbook.couresDescription
        cell.gradient.colors = handbook.courseGradinet
        cell.logo.image = handbook.courseIcon
        cell.banner.image = handbook.courseBanner
        
        return cell
    }
    
    
}

