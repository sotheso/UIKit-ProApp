//
//  HandbookCollectionView.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 02/11/1403.
//

import UIKit

class HandbookCollectionView: UICollectionViewCell {
    
    @IBOutlet var overlay: UIView!
    @IBOutlet var banner: UIImageView!
    @IBOutlet var logo: CustomImageView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    let gradient = CAGradientLayer()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
// رنگ گردینت هر سلول از بالا سمت راست به پایین سمت چپ
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = overlay.frame
        gradient.cornerCurve = .continuous
        gradient.cornerRadius = 30
        
        overlay.layer.insertSublayer(gradient, at: 0)
        overlay.layer.cornerCurve = .continuous
        overlay.layer.cornerRadius = 30
    }
    
// آمادگی برای استفاده مجدد
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
