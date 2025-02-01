//
//  NotificationViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 13/11/1403.
//

import UIKit
import Combine
import FirebaseFirestore

class NotificationViewController: UIViewController {

    @IBOutlet var cardView: CustomView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    private var tokens: Set<AnyCancellable> = []

// ستون:main .... ردیف: NotifModel
    var dataSource: UITableViewDiffableDataSource <TBSection, NotificationModel>! = nil
    
//رای ذخیره آخرین وضعیت داده‌های نمایش داده‌شد
    var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

// Combine
// برای وقتی که کاربر اسکرول میکنه صفحه متناسب با اون تغییر کنه
        tableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        tableView.delegate = self
        
        
        
/// مقدار self.dataSource برابر با یک نمونه از UITableViewDiffableDataSource قرار داده می‌شود
        self.dataSource = UITableViewDiffableDataSource<TBSection, NotificationModel>(tableView: tableView) {
/// •    tableView: UITableView → جدولی که داده‌ها در آن نمایش داده می‌شوند.
///•    indexPath: IndexPath → مشخص‌کننده‌ی سطر فعلی.
///•    item: NotificationModel → مدلی که باید در این ردیف نمایش داده شود
            (tableView: UITableView, indexPath: IndexPath, item: NotificationModel) -> NotificationTableViewCell in
/// دریافت سلول از UITableView
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell else {
                fatalError("Can't create new cell")
            }
/// مقداردهی فیلدهای cell با داده‌های item
            cell.titleLabel.text = item.title
            cell.massageLable.text = item.massage
            cell.subtitleLabel.text = item.subtitle.uppercased()
            cell.notificationImageView.image = UIImage(named: item.image)
            
            return cell
        }
/// تنظیم انیمیشن پیش‌فرض برای تغییرات داده‌ها
        self.dataSource.defaultRowAnimation = .fade
        
        
// بارگذاری داده‌های فایربیس روی جدول
        Task {
            do {
                try await self.loadData()
                self.cardView.alpha = 1
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
//  بارگذاری داده‌ها از دیتابیس Firestore
    func loadData() async throws {
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        currentSnapshot.appendSections([.main])

/// وصل شدن به دیتابیس فایربیس
        let docs = try await Firestore.firestore()
///  داده هارا از کالکشن notifications میگیره
            .collection("notifications")
/// داده‌ها بر اساس فیلد sentAt به صورت صعودی (قدیمی به جدید) مرتب می‌شوند
            .order(by: "sentAt", descending: false)
///     این تابع، اسناد (documents) مربوط به این کالکشن را به صورت غیرهمزمان (await) بازیابی می‌کند
            .getDocuments()

/// برای ذخیره دادها
        var notifications = [NotificationModel]()

///  پردازش اسناد (Documents توی یک حلقه
        for docSnapshot in docs.documents {
            let data = try docSnapshot.data(as: NotificationModel.self)
            notifications.append(data)
        }

///  بروزرسانی Snapshot و اعمال تغییرات 
        self.currentSnapshot.appendItems(notifications, toSection: .main)
        await self.dataSource.apply(currentSnapshot, animatingDifferences: true)

// نامرئی بودن جدول
//        DispatchQueue.main.async {
//            self.cardView.alpha = 1
//        }
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
