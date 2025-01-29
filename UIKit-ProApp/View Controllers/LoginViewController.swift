//
//  LoginViewController.swift
//  UIKit-ProApp
//
//  Created by Sothesom on 10/11/1403.
//

import UIKit
import FirebaseAuth
// واسه اینکه ببینیم فیلد ها خالی نباشن
import Combine

class LoginViewController: UIViewController {

    @IBOutlet var loginCard: CustomView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var primaryBtn: UIButton!
    @IBOutlet var accessoryBtn: UIButton!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var emailTextfield: UITextField!
    
    // واسه اینکه ببینیم فیلد ها خالی نباشن
    var emailKHALI = true
    var passwordKHALI = true
    private var tokens: Set<AnyCancellable> = []
    
    enum LoginStatus {
        case signUp
        case signIn
    }
    var loginStatus : LoginStatus = .signUp {
        didSet {
            self.titleLabel.text = (loginStatus == .signUp) ? "Sign up" : "Sign in"
            self.primaryBtn.setTitle((loginStatus == .signUp) ? "Creat accout" : "Sign in" , for: .normal)
            self.accessoryBtn.setTitle((loginStatus == .signUp) ? "Don't have a account" : "Already have an account?  ", for: .normal)
            self.passwordTextfield.textContentType = (loginStatus == .signUp) ? .newPassword : .password
        }
    }
    
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
        
        
        // گوش دادن به تغییرات درون فیلد
        emailTextfield.publisher(for: \.text)
            .sink { newValue in
                self.emailKHALI = (newValue == "" || newValue == nil)
            }
            .store(in: &tokens)
        
        passwordTextfield.publisher(for: \.text)
            .sink { newValue in
                self.passwordKHALI = (newValue == "" || newValue == nil)
            }
            .store(in: &tokens)
        
    }
    
    

    // اتصال دکمه های ساخت و singin به Firebase
    @IBAction func primaryBtnAction(_ sender: Any) {
        // اگر دوتا فیلد ایمیل و پسورد خالی باشه به کاربر هشدار بده
        if (emailKHALI || passwordKHALI) {
            let alert = UIAlertController(title: "Missing Information", message: "Please make sure to enter a valid email address and a paswword", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            // حال اگه پر بود
            // بسته به اینکه عضو داریم میشیم یا داریم ثبت نام میکنیم
            if loginStatus == .signUp {
                Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                    authResult, error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    // اگر کاربر با موفقیت اکانت ساخت:
                    // به صفحه home وصل شه
                    self.goToHomeScreen()
                }
            } else {
                Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                    authResult, error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    // اگر کاربر با موفقیت اکانت ساخت:
                    // به صفحه home وصل شه
                    self.goToHomeScreen()
                }
            }
            
        }
    }
    
    @IBAction func accessoryBtnAction(_ sender: Any) {
        self.loginStatus = (self.loginStatus == .signUp) ? .signIn : .signUp
    }
    
    // تابع رفتن به صفحه اصلی
    func goToHomeScreen() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
