//
//  LoginViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 10/11/1403.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginCard: CustomView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var primaryBtn: UIButton!
    @IBOutlet var accessoryBtn: UIButton!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var emailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// انیمیشن برنامه
        // الفای cardView = 0 هست
        // وقتی میخوایم sign up کنیم این الفا ۱ میشه
        // یا فریم کارت بیاد بالا
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        }
    }

}
