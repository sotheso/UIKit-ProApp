//
//  TopicTableViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 07/11/1403.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet var topicLabel: UILabel!
    @IBOutlet var topicIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

