//
//  SectionsCollectionViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 07/11/1403.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var banner: UIImageView!
    @IBOutlet var logo: CustomImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
        
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()

//Accessibility
// تعیین فونت و اندازه لیبل برای اونایی که از تنظیمات گوشی قراره تاثیر بگیره
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
                        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        subtitleLabel.maximumContentSizeCategory = .extraLarge

    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
         
    }
    
// آمادگی برای استفاده مجدد
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
