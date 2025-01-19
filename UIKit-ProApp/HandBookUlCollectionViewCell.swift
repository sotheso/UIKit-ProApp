//
//  HandBookUlCollectionViewCell.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 30/10/1403.
//

import UIKit

class HandBookUlCollectionViewCell: UICollectionViewCell {
    // گرادینت رنگ سلول
    
    @IBOutlet var overlay: UIView!
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var logo: CustomImageView!
    @IBOutlet weak var baner: UIImageView!
    
    @IBOutlet var Titel: UILabel!
    @IBOutlet var SubTitel: UILabel!
    @IBOutlet var SubTitle2: UILabel!
    
    let gradient = CAGradientLayer()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1 )
        gradient.frame = overlay.frame
        gradient.cornerCurve = .continuous
        gradient.cornerRadius = 10

    }
}
