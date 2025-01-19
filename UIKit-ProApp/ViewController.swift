//
//  ViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 29/10/1403.
//

import UIKit

class ViewController:
                            
    UIViewController {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBOutlet var HandBookCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


/// به جای استفاده از این کد ها در هر فیچر برنامه از کلاس های کمک کننده فایل Helper استفاده میکنیم
//        cardView.layer.cornerRadius = 30
//        cardView.layer.cornerCurve = .continuous
//        blurView.layer.cornerRadius = 30
//        blurView.layer.cornerCurve = .continuous
//        
//        blurView.layer.masksToBounds = true
//        
//        cardView.layer.shadowColor = UIColor(named: "Shadow")!.cgColor
//        cardView.layer.shadowOpacity = 0.5
//        cardView.layer.shadowRadius = 30
//        cardView.layer.shadowOffset = CGSize(width: 0, height: 10 )
/// اینطوری میتونی با import کردن کلاس مربوطه
/// در بخش main تنظیمات
/// ویوی خودت رو کاستوم کنی
        
        
        
        
        HandBookCollectionView.delegate = self
        HandBookCollectionView.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //  تعداد سلول ها
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // محتوای هر سلول
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandBookUlCollectionViewCell
        cell.Titel.text = "Sothesom HandBook"
        cell.SubTitel.text = "20 HOURS - 30 SECTIONS"
        cell.SubTitle2.text = "Learn about all the basics of SwiftUI"
        cell.gradient.colors = [UIColor.red.cgColor, UIColor.systemPink.cgColor]
        cell.logo.image = UIImage(named: "Logo React")
        cell.baner.image = UIImage(named: "Illustration 2")
        
        return cell
    }
    
    
}

