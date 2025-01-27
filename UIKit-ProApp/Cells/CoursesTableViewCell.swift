//
//  CoursesTableViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 03/11/1403.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    @IBOutlet var coursesBackgound: UIImageView!
    @IBOutlet var desciptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var courseBanner: UIImageView!
    @IBOutlet var courseLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        
        layer.cornerRadius = 30
        
//Accessibility
    // تعیین فونت و اندازه لیبل برای اونایی که از تنظیمات گوشی قراره تاثیر بگیره
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
                
        desciptionLabel.adjustsFontForContentSizeCategory = true
        desciptionLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        desciptionLabel .maximumContentSizeCategory = .extraLarge
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
