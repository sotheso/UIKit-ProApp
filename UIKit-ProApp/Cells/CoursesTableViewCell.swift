//
//  CoursesTableViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 03/11/1403.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        
        layer.cornerRadius = 30
    }
}
