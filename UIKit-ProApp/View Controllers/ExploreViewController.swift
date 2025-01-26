//
//  ExploreViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 07/11/1403.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet var sectionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.layer.masksToBounds = false
    }
}

extension ExploreViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
        let section = sections[indexPath.section]
        
        cell.titleLabel.text = section.sectionTitle
        cell.logo.image = section.sectionIcon
        cell.banner.image = section.sectionBanner
        cell.subtitleLabel.text = section.sectionSubtitle
        
        return cell
    }
    
     
}
