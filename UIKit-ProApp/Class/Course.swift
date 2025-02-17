//
//  Course.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 02/11/1403.
//

import UIKit

class Course {
    var courseTitle: String
    var courseSubtitle: String
    var couresDescription: String
    var courseIcon: UIImage
    var courseBanner: UIImage
    var courseAuthor: [String]?
    var courseGradinet: [CGColor]?
    var courseBackground: UIImage?
    var sections: [Section]?
    
    init(title: String!, subtitle: String!, description: String!, icon: UIImage!, banner: UIImage!, author: [String]? = nil, colors: [CGColor]? = nil, background: UIImage? = nil, sections: [Section]) {
        self.courseTitle = title
        self.courseSubtitle = subtitle
        self.couresDescription = description
        self.courseIcon = icon
        self.courseBanner = banner
        self.courseAuthor = author
        self.courseGradinet = colors
        self.courseBackground = background
        self.sections = sections
    }
}


// Data
let handbooks = [
    Course(title: "SwiftUI Handbook", subtitle: "80 sections - 9 hours", description: "Build an iOS app for iOS 15 with custom layouts, animations and more!", icon: UIImage(named: "Logo SwiftUI")!, banner: UIImage(named: "Illustration 2")!, author: ["Stephanie Diep"], colors: [
        UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1).cgColor,
        UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1).cgColor
    ], sections: sections),
    Course(title: "React Hooks Handbook", subtitle: "30 sections - 3 hours", description: "A comprehensive series of tutorials on React Hooks and more!", icon: UIImage(named: "Logo React")!, banner: UIImage(named: "Illustration 4")!, author: ["Meng To, Stephanie Diep"], colors: [
        UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1).cgColor,
        UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1).cgColor,
        UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1).cgColor
    ], sections: sections)
]

let courses = [
    Course(title: "SwiftUI Concurrency", subtitle: "NEW VIDEO", description: "Build an iOS app for iOS 15 with custom layouts, animations and more!", icon: UIImage(named: "Logo SwiftUI")!, banner: UIImage(named: "Illustration 4")!, author: ["Meng To"],background: UIImage(named: "Background 3"), sections: sections),
    Course(title: "Flutter for Designers", subtitle: "20 sections - 3 hours", description: "Build a Flutter app for iOS and Android with custom layouts, animations and more!", icon: UIImage(named: "Logo Flutter")!, banner: UIImage(named: "Illustration 1")!, author: ["Sai Kambampati"], background: UIImage(named: "Background 4"), sections: sections),
    Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", description: "Build a React app with custom layouts, animations and more!", icon: UIImage(named: "Logo React")!, banner: UIImage(named: "Illustration 2")!, author: ["Meng To"], background: UIImage(named: "Background 5"), sections: sections)
]

