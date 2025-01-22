//
//  CoursesViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 03/11/1403.
//

import UIKit

class CoursesViewController: UIViewController {

// متغییر برای دوره ای که سلکت شده
    var coures: Course?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("this is \(coures?.courseTitle) selected")

    }

}
