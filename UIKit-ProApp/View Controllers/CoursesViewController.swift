//
//  CoursesViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 03/11/1403.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {

// متغییر برای دوره ای که سلکت شده
    var course: Course?
    
    
    @IBOutlet var sectionTableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var backgroudImage: UIImageView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var authorLable: UILabel!
    @IBOutlet var descripcionLable: UILabel!
    @IBOutlet var subtitleLable: UILabel!
    
    @IBOutlet var iconImageView: CustomImageView!
    
    @IBOutlet var menuButton: UIButton!
    
    private var tokens: Set<AnyCancellable> = []
     
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sectionTableView.delegate = self
        sectionTableView.dataSource = self

// Combine
            // برای وقتی که کاربر اسکرول میکنه صفحه متناسب با اون تغییر کنه
        sectionTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
                
//        sectionTableView.rowHeight = UITableView.automaticDimension
//        sectionTableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        // Set data for the preview card // داده های پیشفرض
        self.iconImageView.image = course?.courseIcon
        self.bannerImage.image = course?.courseBanner
        self.backgroudImage.image = course?.courseBackground
        self.titleLable.text = course?.courseTitle
        self.subtitleLable.text = course?.courseSubtitle
        self.descripcionLable.text = course?.couresDescription
        self.authorLable.text = "Sotheom by \(course?.courseAuthor?.formatted(.list(type: .and, width: .standard)) ?? "Sothesom Karimi")"
        
        
// منوی دکمه بالای صفحه
        let menu = UIMenu(
            title: NSLocalizedString("Course Options", comment: "Course Options"),
            options: .displayInline,
            children: [
                UIAction(title: NSLocalizedString("Shere", comment: "Shere"), image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in
                    // دکمه ی شیر
                }),
                UIAction(title: NSLocalizedString("Take Test", comment: "Take Test"), image: UIImage(systemName: "highlighter"), handler: { _ in

                }),
                UIAction(title: NSLocalizedString("Download", comment: "Download"), image: UIImage(systemName: "square.and.arrow.down"), handler: { _ in

                }),
                UIAction(title: NSLocalizedString("Forums", comment: "Forums"), image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"), handler: { _ in

                }),
                
            ]
        )
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = menu
    }

    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.course?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections![indexPath.row]
            
            cell.courseLogo.image = selectedSection.sectionIcon
            cell.desciptionLabel.text = NSLocalizedString(selectedSection.sectionDescription, comment: selectedSection.sectionDescription)
            cell.subtitleLabel.text = NSLocalizedString(selectedSection.sectionSubtitle, comment: selectedSection.sectionSubtitle)
            cell.titleLabel.text = NSLocalizedString(selectedSection.sectionTitle, comment: selectedSection.sectionTitle)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // ارتفاع هر سطح بر اسا آنچه کهع در استوری برد داریم تنظیم میشود
//
}
