//
//  SearchViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var profileBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    profileBtn.clipsToBounds = true
    profileBtn.layer.cornerRadius = profileBtn.frame.height / 2
    getData()
  }
  
  private func getData() {
    let token = UserDefaults.standard.string(forKey: "token")!
    AuthNetworkManager.getCurrent(token: token) { [self] (user) in
      print(user)
      profileBtn.kf.setImage(with: URL(string: user.avatar), for: .normal)
    }
  }
  
  @IBAction func profileBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let logoutVC = mainSB.instantiateViewController(withIdentifier: "EditProfileVC")
    logoutVC.modalPresentationStyle = .fullScreen
    self.present(logoutVC, animated: true, completion: nil)
  }
  
  
  @IBAction func settingBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let logoutVC = mainSB.instantiateViewController(withIdentifier: "LogoutVC")
    logoutVC.modalPresentationStyle = .fullScreen
    self.present(logoutVC, animated: true, completion: nil)
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
