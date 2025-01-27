//
//  SectionTableViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 05/11/1403.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    @IBOutlet var desciptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var courseLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
//Accessibility
// تعیین فونت و اندازه لیبل برای اونایی که از تنظیمات گوشی قراره تاثیر بگیره
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
                
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
                        
        desciptionLabel.adjustsFontForContentSizeCategory = true
        desciptionLabel.font = UIFont.preferredFont(for: .caption1  , weight: .regular)
        desciptionLabel .maximumContentSizeCategory = .extraLarge
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
