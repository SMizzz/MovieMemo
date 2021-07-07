//
//  LogoutViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/07.
//

import UIKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func logoutBtnTap(_ sender: Any) {
    
    ModalVC.AlertVC(title: "⚠", msg: "정말 로그아웃하시겠습니까?", action: { (_) in
      UserDefaults.standard.removeObject(forKey: "token")
      let wnd = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
      wnd?.rootViewController = loginVC
    }, view: self)
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}
