//
//  SearchViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
