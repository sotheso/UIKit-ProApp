//
//  Notification.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 13/11/1403.
//

import UIKit
import FirebaseFirestore
import Firebase

// چون این UITableView فقط یک بخش (Section) دارد، نیازی به تعریف چندین مقدار برای TBSection نیست
//     اگر این اپلیکیشن چند نوع اعلان (مثل خوانده‌شده و خوانده‌نشده) داشت، می‌توانستیم چند case در TBSection تعریف کنیم
enum TBSection: CaseIterable {
    case main
}

struct NotificationModel: Hashable , Codable {
    @DocumentID var id: String?
    var title: String!
    var massage: String!
    var subtitle: String!
    var image: String!
    var sentAt: Timestamp!
}

// برای مثال : بدون اتصال به فایربیس
//let sampleNotifs = [
//    NotificationModel(id: "0x1", title: "New Release", massage: "SwiftUI", subtitle: "A new release of the SwiftUI course has been released", image: "Logo SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x2", title: "Content Update", massage: "React Hooks", subtitle: "The React Hooks course has been updated", image: "React", sentAt: Date()),
//    NotificationModel(id: "0x3", title: "New Release", massage: "UIKit for iOS 15", subtitle: "A new release by Sai Kambampati has been pushed", image: "SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x4", title: "Black Friday Deal", massage: "Design+Code", subtitle: "Purchase your subscription for 20% off only today", image: "Design+Code", sentAt: Date()),
//]
