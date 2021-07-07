//
//  EditProfileViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit
import Kingfisher

class EditProfileViewController: UIViewController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
    nameTextField.autocorrectionType = .no
    emailTextField.autocorrectionType = .no
    profileImageView.layer.cornerRadius = profileImageView.frame.height/2
  }
  
  private func getData() {
    let token = UserDefaults.standard.string(forKey: "token")!
    AuthNetworkManager.getCurrent(token: token) { [self] (user) in
      print(user)
      profileImageView.kf.setImage(with: URL(string: user.avatar))
      nameTextField.text = user.name
      emailTextField.text = user.email
    }
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func saveBtnTap(_ sender: Any) {
    
  }
}
