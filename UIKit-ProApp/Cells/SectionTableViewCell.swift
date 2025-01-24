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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
