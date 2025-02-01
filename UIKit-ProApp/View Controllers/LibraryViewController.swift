//
//  LibraryViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 13/11/1403.
//

import UIKit
import Combine
import SwiftUI

class LibraryViewController: UIViewController {
     
    @IBOutlet var sectionCollectionView: UICollectionView!
    @IBOutlet var topicTableView: UITableView!
    // نمای ارتفاعی قابل تنظیم
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    // اندازه جدول به اندازه محتوا
    private var tokens: Set<AnyCancellable> = []
        
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var certificatesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.layer.masksToBounds = false
        
        topicTableView.delegate = self
        topicTableView.dataSource = self
        topicTableView.layer.masksToBounds = false
         
// Combine
// برای وقتی که کاربر اسکرول میکنه صفحه متناسب با اون تغییر کنه
        topicTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
// Accessibility
                // تعیین فونت و اندازه لیبل برای اونایی که از تنظیمات گوشی قراره تاثیر بگیره
        titleLable.adjustsFontForContentSizeCategory = true
        titleLable.font = UIFont.preferredFont(for: .title2, weight: .semibold)
        titleLable.maximumContentSizeCategory = .accessibilityMedium
                
        certificatesLabel.adjustsFontForContentSizeCategory = true
        certificatesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        certificatesLabel.maximumContentSizeCategory = .accessibilityMedium
    }
    
// Hosting Controller
    // Swift U  I
    @IBSegueAction func createCertificatesView(_ coder: NSCoder) -> UIViewController? {
//        return UIHostingController(coder: coder, rootView: CertificateView())
        // تغییر رنگ پس زمینه
        let V = UIHostingController(coder: coder, rootView: CertificateView())!
        V.view.backgroundColor = .clear
        return V
    }
    
}

// این حرکت ایف برای اینکه دوبار تابع ننویسیم
extension LibraryViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
        let section = sections[indexPath.item]
        
        cell.titleLabel.text = section.sectionTitle
        cell.logo.image = section.sectionIcon
        cell.banner.image = section.sectionBanner
        cell.subtitleLabel.text = section.sectionSubtitle
        
        return cell
    }
}

extension LibraryViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicTableViewCell
        let setting = librarySettings[indexPath.row]
        
        cell.topicLabel.text = setting.topicName
        cell.topicIcon.image = UIImage(systemName: setting.topicSymbol)
        
        return cell
    }
    
    // تابع نمای جدول ردیف روش میزنی خاکستری بشه
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
    }
}
