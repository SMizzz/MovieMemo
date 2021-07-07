//
//  LoginViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emailTextField.autocorrectionType = .no
    passwordTextfield.autocorrectionType = .no
    setupTapGRForKeyboardDismissal()
  }
  
  @IBAction func loginBtnTap(_ sender: Any) {
    AuthNetworkManager.postLogin(email: emailTextField.text!, password: passwordTextfield.text!) { (token) in
      if token != nil {
        UserDefaults.standard.setValue(token, forKey: "token")
        let alertVC = UIAlertController(title: "🎉", message: "로그인 완료!!", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
          let wnd = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
          let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
          wnd?.rootViewController = mainVC
        }))
        self.present(alertVC, animated: true, completion: nil)
        return
      }
    }
  }
  
  @IBAction func forgotPasswordBtnTap(_ sender: Any) {
    
  }
  
  @IBAction func appleBtnTap(_ sender: Any) {
    
  }
  
  @IBAction func kakaoBtnTap(_ sender: Any) {
    
  }
  
  
  @IBAction func fbBtnTap(_ sender: Any) {
    
  }
  
  @IBAction func signupBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let signupVC = mainSB.instantiateViewController(withIdentifier: "SignupVC")
    navigationController?.pushViewController(signupVC, animated: true)
  }
}
