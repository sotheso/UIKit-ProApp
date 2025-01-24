//
//  FeaturedViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 29/10/1403.
//

import UIKit
import Combine

// کنترل نماهای برحسته
class FeaturedViewController: UIViewController {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var handbooksCollectionView: UICollectionView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var coursesTableView: UITableView!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        handbooksCollectionView.layer.masksToBounds = false
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.layer.masksToBounds = false
// Combine
        // برای وقتی که کاربر اسکرول میکنه صفحه متناسب با اون تغییر کنه
        coursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        scrollView.delegate = self
    }
// بر اساس شناسه اون کورس رو باز کنه
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVS = segue.destination as? CoursesViewController, let course = sender as? Course  {
            detailsVS.course = course
// برای پیام به بکند
//            print("Preparation for Course VC Successful")
        }
    }

}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //  تعداد سلول ها
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // محتوای هر سلول
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionView
        
        let handbook = handbooks[indexPath.item]
        
        
        cell.titleLabel.text = handbook.courseTitle
        cell.subtitleLabel.text = handbook.courseSubtitle
        cell.discriptionLabel.text = handbook.couresDescription
        cell.gradient.colors = handbook.courseGradinet
        cell.logo.image = handbook.courseIcon
        cell.banner.image = handbook.courseBanner
        
        return cell
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        let course = courses[indexPath.section]
        
        cell.titleLabel.text = course.courseTitle
        cell.courseLogo.image = course.courseIcon
        cell.courseBanner.image = course.courseBanner
        cell.coursesBackgound.image = course.courseBackground
        cell.desciptionLabel.text = course.couresDescription
        cell.subtitleLabel.text = course.courseSubtitle
        
        return cell
    }
    
    // ارتفاع هدر
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 20
    }
    
    // ارتفاع بین سلول ها بجز سلول اول
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
// یک لحظه سلکت کردن مثلا به رنگ خاکستری و بعد از حالت سلکت خارج شدن
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCourse = courses[indexPath.section]
// بر اساس شناسه اون کورس رو باز کنه
        performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
    }
}

// برای اسکرول کردن
extension FeaturedViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
// وقتی اسکرول میکنی اون بالا تیتر به سر تیتر های خودش تغییر کنه
        let contentHeight = scrollView.contentSize.height
        // موقعیت اسکرول ما برای فهمیدن اینکه کجا هستیم
        let lastScrollYPos = scrollView.contentOffset.y
        let percentage = lastScrollYPos / contentHeight
        // حالا اونجایی که هست این نویگیشن تیتر باشه
        if percentage >= 0.15 {
            self.title = "Featured"
        } else if percentage >= 0.33 {
            self.title = "Handbooks"
        } else {
            self.title = "Courses"
        }
    }
    
}
