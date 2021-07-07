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
    let alertVC = UIAlertController(title: "⚠", message: "정말 로그아웃하시겠습니까?", preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "네", style: .default, handler: { (_) in
      UserDefaults.standard.removeObject(forKey: "token")
      let wnd = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
      wnd?.rootViewController = loginVC
    }))
    alertVC.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
    self.present(alertVC, animated: true, completion: nil)
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
