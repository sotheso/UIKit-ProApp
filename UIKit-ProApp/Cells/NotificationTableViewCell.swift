//
//  NotificationTableViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 13/11/1403.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet var massegeLable: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var notificationImageView: UIImageView!

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
                        
        massegeLable.adjustsFontForContentSizeCategory = true
        massegeLable.font = UIFont.preferredFont(for: .caption1  , weight: .regular)
        massegeLable.maximumContentSizeCategory = .extraLarge
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
