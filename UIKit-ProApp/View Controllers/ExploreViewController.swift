//
//  ExploreViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 07/11/1403.
//

import UIKit
import Combine

class ExploreViewController: UIViewController {

    @IBOutlet var sectionCollectionView: UICollectionView!
    @IBOutlet var topicTableView: UITableView!
    // نمای ارتفاعی قابل تنظیم
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    // اندازه جدول به اندازه محتوا
    private var tokens: Set<AnyCancellable> = []

    // برای اسکرول کردن
    private var lastScrollYPosition: CGFloat = 0
    
    @IBOutlet var papulerCollerctionView: UICollectionView!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var topicLable: UILabel!
    @IBOutlet var populerLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.layer.masksToBounds = false
        
        topicTableView.delegate = self
        topicTableView.dataSource = self
        topicTableView.layer.masksToBounds = false
        
        papulerCollerctionView.delegate = self
        papulerCollerctionView.dataSource = self
        papulerCollerctionView.layer.masksToBounds = false
// Combine
// برای وقتی که کاربر اسکرول میکنه صفحه متناسب با اون تغییر کنه
        topicTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
    
// Subscribe to scroll view changes
        scrollView.delegate = self
        
        
// Accessibility
                // تعیین فونت و اندازه لیبل برای اونایی که از تنظیمات گوشی قراره تاثیر بگیره
        titleLable.adjustsFontForContentSizeCategory = true
        titleLable.font = UIFont.preferredFont(for: .title2, weight: .semibold)
        titleLable.maximumContentSizeCategory = .accessibilityMedium
                
        topicLable.adjustsFontForContentSizeCategory = true
        topicLable.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        topicLable.maximumContentSizeCategory = .accessibilityExtraLarge
                
        populerLable.adjustsFontForContentSizeCategory = true
        populerLable.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        populerLable.maximumContentSizeCategory = .accessibilityMedium
    }
}

// این حرکت ایف برای اینکه دوبار تابع ننویسیم
extension ExploreViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionCollectionView {
            return sections.count
        } else {
            return handbooks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sectionCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
            let section = sections[indexPath.item]
            
            cell.titleLabel.text = NSLocalizedString(section.sectionTitle, comment: section.sectionTitle )
            cell.logo.image = section.sectionIcon
            cell.banner.image = section.sectionBanner
            cell.subtitleLabel.text = NSLocalizedString(section.sectionSubtitle, comment: section.sectionSubtitle )
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionView
            let handbook = handbooks[indexPath.item]
            
            cell.titleLabel.text = NSLocalizedString(handbook.courseTitle, comment: handbook.courseTitle)
            cell.subtitleLabel.text = NSLocalizedString(handbook.courseSubtitle, comment: handbook.courseSubtitle)
            cell.discriptionLabel.text = NSLocalizedString(handbook.couresDescription, comment: handbook.couresDescription)
            cell.gradient.colors = handbook.courseGradinet
            cell.logo.image = handbook.courseIcon
            cell.banner.image = handbook.courseBanner
            
            return cell
        }
    }
}

extension ExploreViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicTableViewCell
        let topic = topics[indexPath.row]
        
        cell.topicLabel.text = NSLocalizedString(topic.topicName, comment: topic.topicName)
        cell.topicIcon.image = UIImage(systemName: topic.topicSymbol)
        
        return cell
    }

    // تابع نمای جدول ردیف روش میزنی خاکستری بشه 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
}

// برای اسکرول کردن
extension ExploreViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
// وقتی اسکرول میکنی اون بالا تیتر به سر تیتر های خودش تغییر کنه
        let contentHeight = scrollView.contentSize.height
        // موقعیت اسکرول ما برای فهمیدن اینکه کجا هستیم
        let lastScrollYPos = scrollView.contentOffset.y
        let percentage = lastScrollYPos / contentHeight
        // حالا اونجایی که هست این نویگیشن تیتر باشه
        if percentage <= 0.2 {
            self.titleLable.text = NSLocalizedString("Recent", comment: "Recent")
        } else if percentage <= 0.6 {
            self.titleLable.text = NSLocalizedString("Topics", comment: "Topics")
        } else {
            self.titleLable.text = NSLocalizedString("Popular", comment: "Popular")
        }
    }
}

