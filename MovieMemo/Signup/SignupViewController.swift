//
//  SignupViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit

class SignupViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTapGRForKeyboardDismissal()
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func signupBtnTap(_ sender: Any) {
    if nameTextField.text == "" && emailTextField.text == "" && passwordTextField.text == "" {
      print("빈칸 있음")
      
      let alertVC = UIAlertController(
        title: "확인",
        message: "빈칸이 있어요!",
        preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
      self.present(alertVC, animated: true, completion: nil)
      return
    }
    
    AuthNetworkManager.postSignup(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) { (msg) in
      let alertVC = UIAlertController(title: "회원가입 완료!", message: msg, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
        self.navigationController?.popViewController(animated: true)
      }))
      self.present(alertVC, animated: true, completion: nil)
    }
  }
}
